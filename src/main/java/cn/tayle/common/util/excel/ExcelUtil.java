package cn.tayle.common.util.excel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.DVConstraint;
import org.apache.poi.hssf.usermodel.HSSFDataValidation;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.DataValidationHelper;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.usermodel.XSSFDataValidation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.tayle.common.YiMoConfig;
import cn.tayle.common.annotation.Excel;
import cn.tayle.common.annotation.Excel.Type;
import cn.tayle.common.enums.ComboType;
import cn.tayle.common.enums.ConvertType;
import cn.tayle.common.model.vo.ResponseVo;
import cn.tayle.common.util.DataConvert;
import cn.tayle.common.util.DateUtils;
import cn.tayle.common.util.ReflectUtils;
import cn.tayle.common.util.SpringUtil;
import cn.tayle.sys.domain.DictDataDO;
import cn.tayle.sys.service.impl.DictDataServiceImpl;

public class ExcelUtil<T> {
	private static final Logger log = LoggerFactory.getLogger(ExcelUtil.class);

	/**
	 * Excel sheet最大行数，默认03-65536 07-1048576
	 */
	public static final int sheetSize = 1048576;

	/**
	 * 工作表名称
	 */
	private String sheetName;

	/**
	 * 导出类型（EXPORT:导出数据；IMPORT：导入模板）
	 */
	private Type type;

	/**
	 * 工作薄对象
	 */
	private Workbook wb;

	/**
	 * 工作表对象
	 */
	private Sheet sheet;

	/**
	 * 导入导出数据列表
	 */
	private List<T> list;

	/**
	 * 字段列表
	 */
	private List<Field> fields;

	/**
	 * 实体对象
	 */
	public Class<T> clazz;

	public ExcelUtil(Class<T> clazz) {
		this.clazz = clazz;
	}

	public void init(List<T> list, String sheetName, Type type) {
		if (list == null) {
			list = new ArrayList<T>();
		}
		this.list = list;
		this.sheetName = sheetName;
		this.type = type;
		createExcelField();
		// 排序
		Collections.sort(fields, new Comparator<Field>() {
			@Override
			public int compare(Field f1, Field f2) {
				Excel e1 = f1.getAnnotation(Excel.class);
				Excel e2 = f2.getAnnotation(Excel.class);
				if (e1.orderNum() > e2.orderNum())
					return 1;
				else if (e1.orderNum() == e2.orderNum())
					return 0;
				else
					return -1;
			}
		});

		createWorkbook();
	}

	/**
	 * 对excel表单默认第一个索引名转换成list
	 * 
	 * @param input 输入流
	 * @return 转换后集合
	 */
	public List<T> importExcel(InputStream is) throws Exception {
		return importExcel(StringUtils.EMPTY, is);
	}

	/**
	 * 对excel表单指定表格索引名转换成list
	 * 
	 * @param sheetName 表格索引名
	 * @param input     输入流
	 * @return 转换后集合
	 */
	public List<T> importExcel(String sheetName, InputStream is) throws Exception {
		this.type = Type.IMPORT;
		this.wb = WorkbookFactory.create(is);
		List<T> list = new ArrayList<T>();
		Sheet sheet = null;
		if (StringUtils.isNotEmpty(sheetName)) {
			// 如果指定sheet名,则取指定sheet中的内容.
			sheet = wb.getSheet(sheetName);
		} else {
			// 如果传入的sheet名不存在则默认指向第1个sheet.
			sheet = wb.getSheetAt(0);
		}

		if (sheet == null) {
			throw new IOException("文件sheet不存在");
		}

		int rows = sheet.getPhysicalNumberOfRows();

		if (rows > 0) {
			// 默认序号
			int serialNum = 0;
			// 有数据时才处理 得到类的所有field.
			Field[] allFields = clazz.getDeclaredFields();
			// 定义一个map用于存放列的序号和field.
			Map<Integer, Field> fieldsMap = new HashMap<Integer, Field>();
			for (int col = 0; col < allFields.length; col++) {
				Field field = allFields[col];
				Excel attr = field.getAnnotation(Excel.class);
				if (attr != null && (attr.type() == Type.ALL || attr.type() == type)) {
					// 设置类的私有字段属性可访问.
					field.setAccessible(true);
					fieldsMap.put(++serialNum, field);
				}
			}
			for (int i = 1; i < rows; i++) {
				// 从第2行开始取数据,默认第一行是表头.
				Row row = sheet.getRow(i);
				int cellNum = serialNum;
				T entity = null;
				for (int column = 0; column < cellNum; column++) {
					Object val = this.getCellValue(row, column);
					if (val == null || StringUtils.isEmpty(val.toString())) {// 值为空直接跳过
						continue;
					}
					// 如果不存在实例则新建.
					entity = (entity == null ? clazz.newInstance() : entity);
					// 从map中得到对应列的field.
					Field field = fieldsMap.get(column + 1);
					// 取得类型,并根据对象类型设置值.
					Class<?> fieldType = field.getType();
					Excel attr = field.getAnnotation(Excel.class);

					log.info("字段名称{},excel对应值{},注解{},", field.getName(), val, attr.toString());

					// 从注解判断是否需要对值进行转化，如果需要则进行转化
					if (StringUtils.isNotEmpty(attr.convertExp())) {
						val = reverseByExp(String.valueOf(val), attr.convertExp(), attr.convertType());
					}
					// 如果是日期格式数据需要转化
					if (StringUtils.isNotEmpty(attr.dateFormat()) && val instanceof Date) {
						String dateFormat = attr.dateFormat();
						val = DateUtils.format((Date) val, dateFormat);
					}

					// 根据bean对象格式对数据进行转化
					if (String.class == fieldType) {
						String s = DataConvert.toString(val);
						if (StringUtils.endsWith(s, ".0")) {
							val = StringUtils.substringBefore(s, ".0");
						} else {
							val = DataConvert.toString(val);
						}
					} else if ((Integer.TYPE == fieldType) || (Integer.class == fieldType)) {
						val = DataConvert.toInt(val);
					} else if ((Long.TYPE == fieldType) || (Long.class == fieldType)) {
						val = DataConvert.toLong(val);
					} else if ((Double.TYPE == fieldType) || (Double.class == fieldType)) {
						val = DataConvert.toDouble(val);
					} else if ((Float.TYPE == fieldType) || (Float.class == fieldType)) {
						val = DataConvert.toFloat(val);
					} else if (BigDecimal.class == fieldType) {
						val = DataConvert.toBigDecimal(val);
					} else if (Date.class == fieldType) {
						if (val instanceof String) {
							val = DateUtils.parseDate(val.toString(), DateUtils.DATE_PATTERN);
						} else if (val instanceof Double) {
							val = DateUtil.getJavaDate((Double) val);
						}
					}

					log.info("转化后：字段名称{},excel对应值{},", field.getName(), val);

					if (fieldType != null) {
						String propertyName = field.getName();
						if (StringUtils.isNotEmpty(attr.targetAttr())) {
							propertyName = field.getName() + "." + attr.targetAttr();
						}
						ReflectUtils.invokeSetter(entity, propertyName, val);
					}
				}
				list.add(entity);
			}
		}
		return list;
	}

	/**
	 * 导出list数据到excel
	 * 
	 * @param list      导出数据集合
	 * @param sheetName 工作表的名称
	 * @return 结果
	 */
	public ResponseVo exportExcel(List<T> list, String sheetName) {
		this.init(list, sheetName, Type.EXPORT);
		return exportExcel();
	}

	/**
	 * 导出导入模板
	 * 
	 * @param sheetName 工作表的名称
	 * @return 结果
	 */
	public ResponseVo importTemplateExcel(String sheetName) {
		this.init(null, sheetName, Type.IMPORT);
		return exportExcel();
	}

	/**
	 * 对list数据源将其里面的数据导入到excel表单
	 * 
	 * @return 结果
	 */
	public ResponseVo exportExcel() {
		OutputStream out = null;
		try {
			// 取出一共有多少个sheet.
			double sheetNo = Math.ceil(list.size() / sheetSize);
			for (int index = 0; index <= sheetNo; index++) {
				createSheet(sheetNo, index);
				Cell cell = null; // 产生单元格

				// 产生一行
				Row row = sheet.createRow(0);
				// 写入各个字段的列头名称
				for (int i = 0; i < fields.size(); i++) {
					Field field = fields.get(i);
					Excel attr = field.getAnnotation(Excel.class);
					// 创建列
					cell = row.createCell(i);
					// 设置列中写入内容为String类型
					cell.setCellType(CellType.STRING);
					CellStyle cellStyle = wb.createCellStyle();
					cellStyle.setAlignment(HorizontalAlignment.CENTER);
					cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
					if (attr.name().indexOf("注：") >= 0) {
						Font font = wb.createFont();
						font.setColor(HSSFColorPredefined.RED.getIndex());
						cellStyle.setFont(font);
						cellStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_BLUE.getIndex());
						sheet.setColumnWidth(i, 6000);
					} else {
						Font font = wb.createFont();
						// 粗体显示
						font.setBold(true);
						font.setColor(HSSFColorPredefined.WHITE.getIndex());
						// 选择需要用到的字体格式
						cellStyle.setFont(font);
						cellStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_BLUE.getIndex());
						// 设置列宽
						sheet.setColumnWidth(i, (int) ((attr.width() + 0.72) * 256));
						row.setHeight((short) (attr.height() * 20));
					}
					cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
					cellStyle.setWrapText(true);
					cell.setCellStyle(cellStyle);

					// 写入列名
					cell.setCellValue(attr.name());

					// 如果设置了提示信息则鼠标放上去提示.
					if (StringUtils.isNotEmpty(attr.prompt())) {
						setHSSFPrompt(sheet, "", attr.prompt(), 0, 1, i, i);
					}
					// 如果设置了combo属性则本列只能选择不能输入
					if (attr.comboExp() != null && StringUtils.isNotBlank(attr.comboExp())) {
						setHSSFValidation(sheet, getComboValue(attr.comboType(), attr.comboExp()), 1, 100, i, i);
					}
				}
				if (Type.EXPORT.equals(type)) {
					fillExcelData(index, row, cell);
				}
			}
			String filename = encodingFilename(sheetName);
			out = new FileOutputStream(getAbsoluteFile(filename));
			wb.write(out);
			return ResponseVo.ok(filename);
		} catch (Exception e) {
			log.error("导出Excel异常{}", e.getMessage());
			return ResponseVo.exception("导出Excel失败，请联系网站管理员！");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
	}

	/**
	 * 填充excel数据
	 * 
	 * @param index 序号
	 * @param row   单元格行
	 * @param cell  类型单元格
	 */
	public void fillExcelData(int index, Row row, Cell cell) {
		int startNo = index * sheetSize;
		int endNo = Math.min(startNo + sheetSize, list.size());
		// 写入各条记录,每条记录对应excel表中的一行
		CellStyle cs = wb.createCellStyle();
		cs.setAlignment(HorizontalAlignment.CENTER);
		cs.setVerticalAlignment(VerticalAlignment.CENTER);
		for (int i = startNo; i < endNo; i++) {
			row = sheet.createRow(i + 1 - startNo);
			// 得到导出对象.
			T vo = (T) list.get(i);
			for (int j = 0; j < fields.size(); j++) {
				// 获得field.
				Field field = fields.get(j);
				// 设置实体类私有属性可访问
				field.setAccessible(true);
				Excel attr = field.getAnnotation(Excel.class);
				try {
					// 设置行高
					row.setHeight((short) (attr.height() * 20));
					// 根据Excel中设置情况决定是否导出,有些情况需要保持为空,希望用户填写这一列.
					if (attr.isExport()) {
						// 创建cell
						cell = row.createCell(j);
						cell.setCellStyle(cs);
						if (vo == null) {
							// 如果数据存在就填入,不存在填入空格.
							cell.setCellValue("");
							continue;
						}
						// 用于读取对象中的属性
						Object value = getTargetValue(vo, field, attr);
						String convertExp = attr.convertExp();
						ConvertType convertType = attr.convertType();

						if (StringUtils.isNotEmpty(convertExp)) {
							cell.setCellValue(convertByExp(String.valueOf(value), convertExp, convertType));
						} else {
							cell.setCellType(CellType.STRING);
							// 如果数据存在就填入,不存在填入空格.
							cell.setCellValue(value == null ? attr.defaultValue() : value + attr.suffix());
						}
					}
				} catch (Exception e) {
					log.error("导出Excel失败{}", e.getMessage());
				}
			}
		}
	}

	/**
	 * 设置单元格上提示
	 * 
	 * @param sheet         要设置的sheet.
	 * @param promptTitle   标题
	 * @param promptContent 内容
	 * @param firstRow      开始行
	 * @param endRow        结束行
	 * @param firstCol      开始列
	 * @param endCol        结束列
	 * @return 设置好的sheet.
	 */
	public static Sheet setHSSFPrompt(Sheet sheet, String promptTitle, String promptContent, int firstRow, int endRow,
			int firstCol, int endCol) {
		// 构造constraint对象
		DVConstraint constraint = DVConstraint.createCustomFormulaConstraint("DD1");
		// 四个参数分别是：起始行、终止行、起始列、终止列
		CellRangeAddressList regions = new CellRangeAddressList(firstRow, endRow, firstCol, endCol);
		// 数据有效性对象
		HSSFDataValidation dataValidationView = new HSSFDataValidation(regions, constraint);
		dataValidationView.createPromptBox(promptTitle, promptContent);
		sheet.addValidationData(dataValidationView);
		return sheet;
	}

	/**
	 * 设置某些列的值只能输入预制的数据,显示下拉框.
	 * 
	 * @param sheet    要设置的sheet.
	 * @param textlist 下拉框显示的内容
	 * @param firstRow 开始行
	 * @param endRow   结束行
	 * @param firstCol 开始列
	 * @param endCol   结束列
	 * @return 设置好的sheet.
	 */
	public static Sheet setHSSFValidation(Sheet sheet, String[] textlist, int firstRow, int endRow, int firstCol,
			int endCol) {
		DataValidationHelper helper = sheet.getDataValidationHelper();
		// 加载下拉列表内容
		DataValidationConstraint constraint = helper.createExplicitListConstraint(textlist);
		// 设置数据有效性加载在哪个单元格上,四个参数分别是：起始行、终止行、起始列、终止列
		CellRangeAddressList regions = new CellRangeAddressList(firstRow, endRow, firstCol, endCol);
		// 数据有效性对象
		DataValidation dataValidation = helper.createValidation(constraint, regions);
		// 处理Excel兼容性问题
		if (dataValidation instanceof XSSFDataValidation) {
			dataValidation.setSuppressDropDownArrow(true);
			dataValidation.setShowErrorBox(true);
		} else {
			dataValidation.setSuppressDropDownArrow(false);
		}

		sheet.addValidationData(dataValidation);
		return sheet;
	}

	/**
	 * 解析导出值 0=男,1=女,2=未知
	 * 
	 * @param propertyValue 参数值
	 * @param converterExp  翻译注解
	 * @return 解析后值
	 * @throws Exception
	 */
	public static String convertByExp(String propertyValue, String converterExp, ConvertType convertType)
			throws Exception {
		String returnValue = "";
		if (StringUtils.isNotBlank(convertType.name())) {
			if (ConvertType.CODE_TABLE.equals(convertType)) {
				try {
					String[] convertSource = converterExp.split(",");
					for (String item : convertSource) {
						String[] itemArray = item.split("=");
						if (itemArray[0].equals(propertyValue)) {
							returnValue = itemArray[1];
						}
					}
				} catch (Exception e) {
					throw e;
				}
			} else if (ConvertType.DICT.equals(convertType)) {
				DictDataServiceImpl dictService = SpringUtil.getBean(DictDataServiceImpl.class);
				returnValue = dictService.getDictName(converterExp, propertyValue);
			}
		}
		return returnValue;
	}

	/**
	 * 反向解析值 男=0,女=1,未知=2
	 * 
	 */
	public static String reverseByExp(String propertyValue, String converterExp, ConvertType convertType)
			throws Exception {
		String returnValue = "";
		if (StringUtils.isNotBlank(convertType.name())) {
			if (ConvertType.CODE_TABLE.equals(convertType)) {
				try {
					String[] convertSource = converterExp.split(",");
					for (String item : convertSource) {
						String[] itemArray = item.split("=");
						if (itemArray[1].equals(propertyValue)) {
							returnValue = itemArray[0];
						}
					}
				} catch (Exception e) {
					throw e;
				}
			} else if (ConvertType.DICT.equals(convertType)) {
				DictDataServiceImpl dictService = SpringUtil.getBean(DictDataServiceImpl.class);
				returnValue = dictService.getDictNoByName(converterExp, propertyValue);
			}
		}
		return returnValue;
	}

	/**
	 * 根据Combo表达式 解析成Combo值 1=男,2=女 ==> 男,女
	 * 
	 */
	public static String[] getComboValue(ComboType comboType, String comboExp) {
		ArrayList<String> dictNameList = new ArrayList<>(30);
		if (StringUtils.isNotBlank(comboType.name())) {
			if (ComboType.CODE_TABLE.equals(comboType)) {
				try {
					String[] convertSource = comboExp.split(",");
					for (String item : convertSource) {
						String[] itemArray = item.split("=");
						dictNameList.add(itemArray[1]);
					}
				} catch (Exception e) {
					throw e;
				}
			} else if (ComboType.DICT.equals(comboType)) {
				DictDataServiceImpl dictService = SpringUtil.getBean(DictDataServiceImpl.class);
				List<DictDataDO> allActiveDictData = dictService.getAllActiveDictData(comboExp);

				for (DictDataDO dictDataDO : allActiveDictData) {
					String dictName = dictDataDO.getDictName();
					dictNameList.add(dictName);
				}
			}
		}
		return dictNameList.toArray(new String[dictNameList.size()]);
	}

	/**
	 * 编码文件名
	 */
	public String encodingFilename(String filename) {
		filename = UUID.randomUUID().toString() + "_" + filename + ".xls";
		return filename;
	}

	/**
	 * 获取下载路径
	 * 
	 * @param filename 文件名称
	 */
	public String getAbsoluteFile(String filename) {
		String downloadPath = YiMoConfig.getDownloadPath() + File.separator + filename;
		File desc = new File(downloadPath);
		if (!desc.getParentFile().exists()) {
			desc.getParentFile().mkdirs();
		}
		return downloadPath;
	}

	/**
	 * 获取bean中的属性值
	 * 
	 * @param vo    实体对象
	 * @param field 字段
	 * @param excel 注解
	 * @return 最终的属性值
	 * @throws Exception
	 */
	private Object getTargetValue(T vo, Field field, Excel excel) throws Exception {
		Object o = field.get(vo);
		if (StringUtils.isNotEmpty(excel.targetAttr())) {
			String target = excel.targetAttr();
			if (target.indexOf(".") > -1) {
				String[] targets = target.split("[.]");
				for (String name : targets) {
					o = getValue(o, name);
				}
			} else {
				o = getValue(o, target);
			}
		}
		return o;
	}

	/**
	 * 以类的属性的get方法方法形式获取值
	 * 
	 * @param o
	 * @param name
	 * @return value
	 * @throws Exception
	 */
	private Object getValue(Object o, String name) throws Exception {
		if (StringUtils.isNotEmpty(name)) {
			Class<?> clazz = o.getClass();
			String methodName = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
			Method method = clazz.getMethod(methodName);
			o = method.invoke(o);
		}
		return o;
	}

	/**
	 * 得到所有定义字段
	 */
	private void createExcelField() {
		this.fields = new ArrayList<Field>();
		List<Field> tempFields = new ArrayList<>();
		Class<?> tempClass = clazz;
		tempFields.addAll(Arrays.asList(clazz.getDeclaredFields()));
		while (tempClass != null) {
			tempClass = tempClass.getSuperclass();
			if (tempClass != null)
				tempFields.addAll(Arrays.asList(tempClass.getDeclaredFields()));
		}
		putToFields(tempFields);
	}

	/**
	 * 放到字段集合中
	 */
	private void putToFields(List<Field> fields) {
		for (Field field : fields) {
			Excel attr = field.getAnnotation(Excel.class);
			if (attr != null && (attr.type() == Type.ALL || attr.type() == type)) {
				this.fields.add(field);
			}
		}
	}

	/**
	 * 创建一个工作簿
	 */
	public void createWorkbook() {
		this.wb = new HSSFWorkbook();
	}

	/**
	 * 创建工作表
	 * 
	 * @param         sheetName，指定Sheet名称
	 * @param sheetNo sheet数量
	 * @param index   序号
	 */
	public void createSheet(double sheetNo, int index) {
		this.sheet = wb.createSheet();
		// 设置工作表的名称.
		if (sheetNo == 0) {
			wb.setSheetName(index, sheetName);
		} else {
			wb.setSheetName(index, sheetName + index);
		}
	}

	/**
	 * 获取单元格值
	 * 
	 * @param row    获取的行
	 * @param column 获取单元格列号
	 * @return 单元格值
	 */
	public Object getCellValue(Row row, int column) {
		if (row == null) {
			return row;
		}
		Object val = "";
		try {
			Cell cell = row.getCell(column);
			if (cell != null) {
				if (cell.getCellTypeEnum() == CellType.NUMERIC) {
					val = cell.getNumericCellValue();
					if (HSSFDateUtil.isCellDateFormatted(cell)) {
						val = DateUtil.getJavaDate((Double) val); // POI Excel 日期格式转换
					} else {
						if ((Double) val % 1 > 0) {
							val = new DecimalFormat("0.00").format(val);
						} else {
							val = new DecimalFormat("0").format(val);
						}
					}
				} else if (cell.getCellTypeEnum() == CellType.STRING) {
					val = cell.getStringCellValue();
				} else if (cell.getCellTypeEnum() == CellType.BOOLEAN) {
					val = cell.getBooleanCellValue();
				} else if (cell.getCellTypeEnum() == CellType.ERROR) {
					val = cell.getErrorCellValue();
				}

			}
		} catch (Exception e) {
			return val;
		}
		return val;
	}
}
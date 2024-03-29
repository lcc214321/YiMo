package top.yimo.generator;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.WordUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.util.DateUtils;
import top.yimo.generator.domain.ColumnDO;
import top.yimo.generator.domain.TableDO;

/**
 * 代码生成器 工具类
 */
public class GenUtils {
	public static final String separator = "@";

	public static List<String> getTemplates() {
		List<String> templates = new ArrayList<String>();
		templates.add("templates/generator/vm/java/domain.java.vm");
		templates.add("templates/generator/vm/java/Dao.java.vm");
		templates.add("templates/generator/vm/xml/Mapper.xml.vm");
		templates.add("templates/generator/vm/java/Service.java.vm");
		templates.add("templates/generator/vm/java/ServiceImpl.java.vm");
		templates.add("templates/generator/vm/java/Controller.java.vm");
		templates.add("templates/generator/vm/html/list.html.vm");
		templates.add("templates/generator/vm/html/add.html.vm");
		templates.add("templates/generator/vm/html/edit.html.vm");
		templates.add("templates/generator/vm/sql/dml.sql.vm");

		return templates;
	}

	/**
	 * 生成代码
	 * 
	 * @throws Exception
	 */

	public static void generatorCode(Map<String, String> table, List<Map<String, String>> columns, ZipOutputStream zip)
			throws Exception {
		// 配置信息
		Configuration config = getConfig();
		// 表信息
		TableDO tableDO = new TableDO();
		tableDO.setTableName(table.get("tableName"));
		tableDO.setComments(table.get("tableComment"));
		// 表名转换成Java类名
		String className = tableToJava(tableDO.getTableName(), config.getString("tablePrefix"),
				config.getString("autoRemovePre"));
		tableDO.setClassName(className);
		tableDO.setClassname(StringUtils.uncapitalize(className));

		// 列信息
		List<ColumnDO> columsList = new ArrayList<>();
		for (Map<String, String> column : columns) {
			String excludeField = config.getString("excludeField").toUpperCase();
			String columnName = column.get("columnName").toUpperCase();
			if (StringUtils.isNotBlank(excludeField)) {// 排除部分列信息
				String[] excludeFields = excludeField.split(separator);
				if (Arrays.asList(excludeFields).contains(columnName)) {
					continue;
				}
			}

			ColumnDO columnDO = new ColumnDO();
			columnDO.setColumnName(column.get("columnName"));
			columnDO.setDataType(column.get("dataType"));
			columnDO.setComments(column.get("columnComment"));
			columnDO.setExtra(column.get("extra"));

			// 列名转换成Java属性名
			String attrName = columnToJava(columnDO.getColumnName());
			columnDO.setAttrName(attrName);
			columnDO.setAttrname(StringUtils.uncapitalize(attrName));

			// 列的数据类型，转换成Java类型
			String attrType = config.getString(columnDO.getDataType(), "unknowType");
			columnDO.setAttrType(attrType);

			// 是否主键
			if ("PRI".equalsIgnoreCase(column.get("columnKey")) && tableDO.getPk() == null) {
				tableDO.setPk(columnDO);
			}

			columsList.add(columnDO);
		}
		tableDO.setColumns(columsList);

		// 没主键，则第一个字段为主键
		if (tableDO.getPk() == null) {
			tableDO.setPk(tableDO.getColumns().get(0));
		}

		// 设置velocity资源加载器
		Properties prop = new Properties();
		prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
		Velocity.init(prop);
		String moduleName = config.getString("package").substring(config.getString("package").lastIndexOf(".") + 1);//// 默认为包名最后一个

		// 封装模板数据
		Map<String, Object> map = new HashMap<>(16);
		map.put("tableName", tableDO.getTableName());
		map.put("comments", tableDO.getComments());
		map.put("pk", tableDO.getPk());
		map.put("className", tableDO.getClassName());
		map.put("classname", tableDO.getClassname());
		map.put("moduleName", moduleName);
		map.put("columns", tableDO.getColumns());
		map.put("htmlTitle", tableDO.getTableName());
		map.put("package", config.getString("package"));
		map.put("author", config.getString("author"));
		map.put("email", config.getString("email"));
		map.put("datetime", DateUtils.format(new Date(), "yyyy年MM月dd日 HH:mm:ss"));
		VelocityContext context = new VelocityContext(map);

		// 获取模板列表
		List<String> templates = getTemplates();
		for (String template : templates) {
			// 渲染模板
			StringWriter sw = new StringWriter();
			Template tpl = Velocity.getTemplate(template, "UTF-8");
			tpl.merge(context, sw);

			try {
				// 添加到zip
				String fileName = getFileName(template, tableDO.getClassname(), tableDO.getClassName(),
						config.getString("package"), moduleName);
				zip.putNextEntry(new ZipEntry(fileName));
				IOUtils.write(sw.toString(), zip, "UTF-8");
				IOUtils.closeQuietly(sw);
				zip.closeEntry();
			} catch (IOException e) {
				throw new Exception("渲染模板失败，表名：" + tableDO.getTableName(), e);
			}
		}
	}

	/**
	 * 列名转换成Java属性名 驼峰命名方便MyBatis自动转换
	 */
	public static String columnToJava(String columnName) {
		return WordUtils.capitalizeFully(columnName, new char[] { '_' }).replace("_", "");
	}

	/**
	 * 表名转换成Java类名
	 */
	public static String tableToJava(String tableName, String tablePrefix, String autoRemovePre) {
		if (WebConstant.AUTO_REOMVE_PRE.equals(autoRemovePre)) {
			tableName = tableName.substring(tableName.indexOf("_") + 1);
		}
		if (StringUtils.isNotBlank(tablePrefix)) {
			tableName = tableName.replace(tablePrefix, "");
		}

		return columnToJava(tableName);
	}

	/**
	 * 获取配置信息
	 * 
	 * @throws Exception
	 */
	public static Configuration getConfig() throws Exception {
		try {
			return new PropertiesConfiguration("generator.properties");
		} catch (ConfigurationException e) {
			throw new Exception("获取配置文件失败，", e);
		}
	}

	/**
	 * 获取文件名
	 */
	public static String getFileName(String template, String classname, String className, String packageName,
			String moduleName) {
		String packagePath = "main" + File.separator + "java" + File.separator;
		if (StringUtils.isNotBlank(packageName)) {// 当时java是才加包空间
			if (template.endsWith(".java.vm")) {
				packagePath += packageName.replace(".", File.separator) + File.separator;
			}
		}
		if (template.contains("domain.java.vm")) {
			return packagePath + "domain" + File.separator + className + "DO.java";
		}

		if (template.contains("Dao.java.vm")) {
			return packagePath + "dao" + File.separator + className + "Dao.java";
		}

		if (template.contains("Service.java.vm")) {
			return packagePath + "service" + File.separator + className + "Service.java";
		}

		if (template.contains("ServiceImpl.java.vm")) {
			return packagePath + "service" + File.separator + "impl" + File.separator + className + "ServiceImpl.java";
		}

		if (template.contains("Controller.java.vm")) {
			return packagePath + "controller" + File.separator + className + "Controller.java";
		}

		if (template.contains("Mapper.xml.vm")) {
			return "main" + File.separator + "resources" + File.separator + "mapper" + File.separator + moduleName
					+ File.separator + className + "Mapper.xml";
		}

		if (template.contains("list.html.vm")) {
			return "main" + File.separator + "resources" + File.separator + "templates" + File.separator + moduleName
					+ File.separator + classname + File.separator + classname + ".html";
		}
		if (template.contains("add.html.vm")) {
			return "main" + File.separator + "resources" + File.separator + "templates" + File.separator + moduleName
					+ File.separator + classname + File.separator + "add.html";
		}
		if (template.contains("edit.html.vm")) {
			return "main" + File.separator + "resources" + File.separator + "templates" + File.separator + moduleName
					+ File.separator + classname + File.separator + "edit.html";
		}

		if (template.contains("dml.sql.vm")) {
			return "main" + File.separator + "resources" + File.separator + "db" + File.separator + classname + "_dml"
					+ ".sql";
		}

		return null;
	}
}

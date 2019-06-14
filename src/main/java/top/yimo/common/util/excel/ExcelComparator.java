package top.yimo.common.util.excel;

import java.util.Comparator;

import top.yimo.common.annotation.Excel;

public class ExcelComparator<T> implements Comparator<T> {

	@Override
	public int compare(T arg0, T arg1) {
		Excel e1 = (Excel) arg0;
		Excel e2 = (Excel) arg1;
		if (e1.orderNum() < e2.orderNum())
			return 1;
		else
			return 0;
	}
}

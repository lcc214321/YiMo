package top.yimo.common;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "yimo")
public class YiMoConfig {
	// 下载附件路径
	private static String downloadPath;
	// 上传附件路径
	private static String uploadPath;

	// 日志模式
	private static String logModel;

	public static String getDownloadPath() {
		return downloadPath;
	}

	public void setDownloadPath(String downloadPath) {
		YiMoConfig.downloadPath = downloadPath;
	}

	public static String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		YiMoConfig.uploadPath = uploadPath;
	}

	public static String getLogModel() {
		return logModel;
	}

	public void setLogModel(String logModel) {
		YiMoConfig.logModel = logModel;
	}

}

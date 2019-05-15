package top.yimo.common;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "yimo")
public class YiMoConfig {
	// 上传附件路径
	private static String downloadPath;

	public static String getDownloadPath() {
		return downloadPath;
	}

	public void setDownloadPath(String downloadPath) {
		YiMoConfig.downloadPath = downloadPath;
	}

}

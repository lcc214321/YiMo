package top.yimo.common.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import top.yimo.common.YiMoConfig;
import top.yimo.common.util.file.FileUtils;

/**
 * 集成一些公共的请求响应
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月27日 下午4:14:25
 */
@RequestMapping("/common")
@Controller
@Slf4j
public class CommonController extends BaseController {
	private String prefix = "common";

	@RequiresPermissions("common:frombuild")
	@GetMapping(value = "frombuild")
	public String frombuild() {
		return prefix + "/frombuilder/frombuilder";
	}

	/**
	 * 通用下载请求
	 * 
	 * @param fileName 文件名称
	 * @param delete   是否删除
	 */
	@GetMapping("download")
	public void fileDownload(String fileName, Boolean delete, HttpServletResponse response,
			HttpServletRequest request) {
		String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
		try {
			String filePath = YiMoConfig.getDownloadPath() + fileName;
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition",
					"attachment;fileName=" + setFileDownloadHeader(request, realFileName));
			FileUtils.writeBytes(filePath, response.getOutputStream());
			if (delete) {
				FileUtils.deleteFile(filePath);
			}
		} catch (Exception e) {
			log.error("下载文件失败", e);
		}
	}

	@GetMapping(value = "uploadFile")
	public String uploadFile() {
		return prefix + "/uploadFile";
	}

	public String setFileDownloadHeader(HttpServletRequest request, String fileName)
			throws UnsupportedEncodingException {
		final String agent = request.getHeader("USER-AGENT");
		String filename = fileName;
		if (agent.contains("MSIE")) {
			// IE浏览器
			filename = URLEncoder.encode(filename, "utf-8");
			filename = filename.replace("+", " ");
		} else if (agent.contains("Firefox")) {
			// 火狐浏览器
			filename = new String(fileName.getBytes(), "ISO8859-1");
		} else if (agent.contains("Chrome")) {
			// google浏览器
			filename = URLEncoder.encode(filename, "utf-8");
		} else {
			// 其它浏览器
			filename = URLEncoder.encode(filename, "utf-8");
		}
		return filename;
	}
}

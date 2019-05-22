package top.yimo.sys.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import top.yimo.common.annotation.Log;
import top.yimo.common.constant.WebConstant;
import top.yimo.common.controller.BaseController;
import top.yimo.common.enums.OperatorType;
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.sys.domain.JobDO;
import top.yimo.sys.service.JobService;

/**
 * 定时任务调度表 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月25日 16:25:43
 */

@Controller
@RequestMapping("/sys/job")
public class JobController extends BaseController {
	private String prefix = "/sys/job";
	private final static String title = "定时任务调度表";
	@Autowired
	private JobService jobService;

	@GetMapping()
	@RequiresPermissions("sys:job:job")
	public String Job() {
		return prefix + "/job";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:job:job")
	@Log(describe = "获取" + title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params) {
		startPage(params);
		List<JobDO> jobList = jobService.listByPage(params);
		return getPageData(jobList);
	}

	@GetMapping("/add")
	@RequiresPermissions("sys:job:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{jobId}")
	@RequiresPermissions("sys:job:edit")
	public String edit(@PathVariable("jobId") Integer jobId, Model model) {
		JobDO job = jobService.get(jobId);
		model.addAttribute("job", job);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:job:add")
	@Log(describe = "新增", title = title, operatorType = OperatorType.INSERT)
	public ResponseVo save(JobDO job) {
		beforeSave(job);
		job.setStatus("0");// 默认不执行
		if (jobService.save(job) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:job:edit")
	@Log(describe = "更新", title = title, operatorType = OperatorType.UPDATE)
	public ResponseVo update(JobDO job) {
		beforeUpdate(job);
		job.setUpdateUserId(getUserId());
		if (jobService.update(job) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove/{id}")
	@ResponseBody
	@RequiresPermissions("sys:job:remove")
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id")Integer jobId) {
		if (jobService.remove(jobId) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:job:batchRemove")
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id")@RequestParam("ids[]") Integer[] jobIds) {
		if (jobService.batchRemove(jobIds) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 暂停定时任务
	 * 	 
	 */
	@PostMapping("/pause")
	@ResponseBody
	@RequiresPermissions("sys:job:operator")
	@Log(describe = "暂停定时任务", title = title, operatorType = OperatorType.UPDATE)
	public ResponseVo pause(Integer jobId) {
		jobService.changeStatus(jobId, WebConstant.STATUS_RUNNING_STOP);
		return ResponseVo.ok();
	}

	/**
	 * 启动定时任务
	 * 	 
	 */
	@PostMapping("/resume")
	@ResponseBody
	@RequiresPermissions("sys:job:operator")
	@Log(describe = "启动定时任务", title = title, operatorType = OperatorType.UPDATE)
	public ResponseVo resume(Integer jobId) {
		jobService.changeStatus(jobId, WebConstant.STATUS_RUNNING_RUN);
		return ResponseVo.ok();
	}

	/**
	 * 校验cron表达式是否有效
	 */
	@GetMapping("/checkCronExpressionIsValid")
	@ResponseBody
	public ResponseVo checkCronExpressionIsValid(String cronExpression) {
		String result = jobService.checkCronExpressionIsValid(cronExpression.trim());
		if (result.contains("@")) {
			if ("true".equals(result.split("@")[0])) {
				return ResponseVo.ok(result.split("@")[1]);
			} else {
				return ResponseVo.fail(result.split("@")[1]);
			}
		} else {
			return ResponseVo.fail("校验cron表达式异常");
		}
	}
}

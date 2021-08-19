package study.spring.zigme.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Alarm;
import study.spring.zigme.model.User;
import study.spring.zigme.service.AlarmService;

@Slf4j
@Controller
public class AlarmAjaxController {
	
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.springhelper.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.service.ProfessorService;
	@Autowired
	AlarmService alarmService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/util/util_alarm.do", method = RequestMethod.GET)
	public ModelAndView list(Model model) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>controller 진입완료");
		
		Alarm input = new Alarm();

		List<Alarm> output_alarm = null;
		int alarmCount = 0;

		try {
			output_alarm = alarmService.getAlarmList(input);
			alarmCount = alarmService.countAlarm(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output_alarm", output_alarm);
		model.addAttribute("alarmCount", alarmCount);

		return new ModelAndView("util/util_alarm");
	}

	/** alarmAct 조회 */

	/*
	 * @RequestMapping(value = "/util_ajax/util_alarm_act.do", method =
	 * RequestMethod.GET) public ModelAndView alarmAct_item(Model model,
	 * 
	 * @RequestParam(value = "alarmNo", defaultValue = "0") int alarmNo) {
	 * 
	 * Alarm input_act = new Alarm(); input_act.setAlarmNo(alarmNo);
	 * 
	 * String alarmAct = ""; List<Alarm> output_alarm = null;
	 * 
	 * 
	 * try {
	 * 
	 * alarmAct = alarmService.selectAlarmAct(input_act); } catch (Exception e) {
	 * return webHelper.redirect(null, e.getLocalizedMessage()); }
	 * 
	 * model.addAttribute("alarmAct", alarmAct);
	 * 
	 * return new ModelAndView("util/util_alarm");
	 * 
	 * }
	 */
}

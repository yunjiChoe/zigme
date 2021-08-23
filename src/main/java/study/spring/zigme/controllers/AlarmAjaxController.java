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
		
	/** 알람 추가 action 페이지 */
	@RequestMapping(value = "/util/util_alarm_add.do", method = RequestMethod.POST)
	public ModelAndView add(Model model,
			@RequestParam(value="hour", defaultValue="") String hour,
			@RequestParam(value="min", defaultValue="") String min,
			@RequestParam(value="monAct", defaultValue="N") String monAct,
			@RequestParam(value="tueAct", defaultValue="N") String tueAct,
			@RequestParam(value="wedAct", defaultValue="N") String wedAct,
			@RequestParam(value="thuAct", defaultValue="N") String thuAct,
			@RequestParam(value="friAct", defaultValue="N") String friAct,
			@RequestParam(value="satAct", defaultValue="N") String satAct,
			@RequestParam(value="sunAct", defaultValue="N") String sunAct,
			@RequestParam(value="alarmContent", defaultValue="") String alarmContent,
			@RequestParam(value="userNo", defaultValue= "0") int userNo) {
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>삽입 action controller 진입 완료");
		
		Alarm input = new Alarm();
		input.setAlarmTime(hour+ ":" +min);
		input.setMonAct(monAct);
		input.setTueAct(tueAct);
		input.setWedAct(wedAct);
		input.setThuAct(thuAct);
		input.setFriAct(friAct);
		input.setSatAct(satAct);
		input.setSunAct(sunAct);
		input.setAlarmContent(alarmContent);
		input.setUserNo(userNo);
		
		List<Alarm> output_alarm = null;
		
		try {
			alarmService.addAlarm(input);
			output_alarm = alarmService.getAlarmList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output_alarm", output_alarm);
		
		return  new ModelAndView("util/util_alarm.do");
	}
	
}

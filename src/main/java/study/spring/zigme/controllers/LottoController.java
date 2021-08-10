package study.spring.zigme.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LottoController {

	/** POST 방식의 파라미터를 전송받기 위한 컨트롤러 메서드 */
	// 추가적인 파라미터가 필요하다면 콤마(,)로 구분하여 나열한다.
	@RequestMapping(value = "/util/util_lotto_result.do", method = RequestMethod.POST)
	public String post(Model model,
			@RequestParam(value="player0", defaultValue="") String player0,
			@RequestParam(value="player1", defaultValue="") String player1,
			@RequestParam(value="player2", defaultValue="") String player2,
			@RequestParam(value="player3", defaultValue="") String player3,
			@RequestParam(value="player4", defaultValue="") String player4,
			@RequestParam(value="player5", defaultValue="") String player5,
			@RequestParam(value="player6", defaultValue="") String player6,
			@RequestParam(value="player7", defaultValue="") String player7,
			@RequestParam(value="player8", defaultValue="") String player8,
			@RequestParam(value="player9", defaultValue="") String player9) {

		// 파라미터값을 View에게 전달한다.
		model.addAttribute("player0", player0);
		model.addAttribute("player1", player1);
		model.addAttribute("player2", player2);
		model.addAttribute("player3", player3);
		model.addAttribute("player4", player4);
		model.addAttribute("player5", player5);
		model.addAttribute("player6", player6);
		model.addAttribute("player7", player7);
		model.addAttribute("player8", player8);
		model.addAttribute("player9", player9);
		
		// "/src/main/webapp/WEB-INF/views/util/util_lotto_result.jsp" 파일을 View로 지정한다.
		return "util/util_lotto_result";
	}
}

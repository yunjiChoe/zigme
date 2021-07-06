package study.spring.zigme.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;

@RestController
public class HelpRestController {
	/**WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	
	
}

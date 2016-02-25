package es.us.isa.ideas.controller.sample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/help")
public class HelpController {
    
    @RequestMapping(value = "*", method = RequestMethod.GET)
	public String help() {                                   
                return "forward:/language/help";
	}
}

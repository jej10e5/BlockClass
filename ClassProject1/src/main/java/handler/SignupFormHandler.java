package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignupFormHandler implements CommandHandler {
	@RequestMapping( "/signupForm" )
	public ModelAndView process( HttpServletRequest request, HttpServletResponse response )
		throws Exception {
		return new ModelAndView( "class365/signupForm" );
	}
}

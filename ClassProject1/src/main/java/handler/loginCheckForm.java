package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class loginCheckForm implements CommandHandler{
	
	@RequestMapping
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	String url = "";
	
	if(request.getSession().getAttribute("memid").equals(null) || request.getSession().getAttribute("memid").equals("")) {
		url = "loginForm";
		
	}else {
		
	}
			
		
		return new ModelAndView("handler/"+url);
	}

}

package handler;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lecmem.LecmemDataBean;
import lecture.LectureDao;
@Controller
public class FindPasswdHandler implements CommandHandler{
	
	@Resource
	private LectureDao lectureDao;
	
	@RequestMapping("/findPasswd")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse reponse) throws Exception {		 
		
		String email = request.getParameter("email");
		String id = (String)request.getParameter("id");
		
		LecmemDataBean dto = new LecmemDataBean();
	    dto.setEmail(email);
	    dto.setId(id);
	  
		
		String result = lectureDao.findPasswd(dto);
		
		
	
		request.setAttribute("result", result);
	
		
		
		return new ModelAndView("class365/findPasswd");
	}
}

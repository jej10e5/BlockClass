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

import lecture.LectureDao;
@Controller
public class FindIdHandler implements CommandHandler{
	
	@Resource
	private LectureDao lectureDao;
	
	@RequestMapping("/findId")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse reponse) throws Exception {		 
		
		String tel = request.getParameter("tel");
		
		String result = lectureDao.findId(tel);
	
		request.setAttribute("result", result);
		
		
		
		return new ModelAndView("class365/findId");
	}
}

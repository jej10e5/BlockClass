package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import tutor.TutorDataBean;

@Controller
public class TutorInfoFormHandler implements CommandHandler{
	
	@Resource
	private LectureDao lectureDao;
	
	@RequestMapping("/tutorInfoForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=(String) request.getSession().getAttribute("memid");
		
		
		
		TutorDataBean dto = lectureDao.getTutor(id);
		
		request.setAttribute("dto", dto);

		
		return new ModelAndView("class365/tutorInfoForm");
	}

}

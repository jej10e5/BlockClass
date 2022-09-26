
package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import lecturede.LectureDeDataBean;

@Controller
public class TutorMainHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/tutorMain")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memid");
		int tutorInfo = lectureDao.getCreateTutor(id); 
		request.setAttribute("tutorInfo", tutorInfo);
		List<LectureDeDataBean> dtos = lectureDao.getTutorClass(id);
		request.setAttribute("dtos", dtos);
		return new ModelAndView("class365/tutorMain");
	}

}

 
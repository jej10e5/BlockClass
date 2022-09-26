package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecmem.LecmemDataBean;
import lecture.LectureDao;
import lecture.LectureDataBean;
import tutor.TutorDataBean;

@Controller
public class PayFormHandler implements CommandHandler{
	
	@Resource
	private LectureDao	lectureDao;
	
	
	
	
	
	
	@RequestMapping("/payForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id=(String) request.getSession().getAttribute("memid");
		int lec_num = Integer.parseInt(request.getParameter("lec_num"));
		String cost = (String)request.getParameter("cost");
		
		
		LecmemDataBean dto = lectureDao.getMember(id);
		LectureDataBean dlo = lectureDao.getLecture(lec_num);
		
		request.setAttribute("lec_num", lec_num);
		request.setAttribute("cost", cost);
		request.setAttribute("dto", dto);
		request.setAttribute("dlo", dlo);
		return new ModelAndView("class365/payForm");
	}

}

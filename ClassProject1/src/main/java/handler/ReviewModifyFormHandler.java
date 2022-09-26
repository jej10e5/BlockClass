package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import review.ReviewDataBean;
@Controller
public class ReviewModifyFormHandler implements CommandHandler{

	@Resource
	LectureDao lectureDao;
	
	
	@RequestMapping("reviewModifyForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int re_num= Integer.parseInt(request.getParameter("re_num"));
		
		ReviewDataBean dto = lectureDao.getRe(re_num);
		
		
		request.setAttribute("re_num", re_num);
		request.setAttribute("dto", dto);
		return new ModelAndView("class365/reviewModifyForm");
	}

}

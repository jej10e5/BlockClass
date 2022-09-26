package handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import review.ReviewDataBean;
@Controller
public class TutorReviewProHandler implements CommandHandler{
	
	@Resource
	LectureDao lectureDao;
	
	@RequestMapping("/tutorReviewPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memid");	
		int gr = Integer.parseInt(request.getParameter("gr"));
		int lec_num = Integer.parseInt(request.getParameter("lec_num"));
		String re = (String)request.getParameter("re");
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String reg_date = sdf.format(date);
		
		ReviewDataBean dto = new ReviewDataBean();
		dto.setLec_num(lec_num);
		dto.setId(id);
		dto.setRe(re);
		dto.setReg_date(reg_date);
		dto.setGr(gr);
		
		int result = lectureDao.insertTutorReview(dto);
		
		request.setAttribute("lec_num", lec_num);
		request.setAttribute("result", result);
		return new ModelAndView("class365/tutorReviewPro");
	}

}

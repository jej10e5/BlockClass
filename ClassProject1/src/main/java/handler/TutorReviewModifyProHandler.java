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
public class TutorReviewModifyProHandler implements CommandHandler{
	@Resource
	LectureDao lectureDao; 
	
	
	@RequestMapping("tutorReviewModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int re_num = Integer.parseInt(request.getParameter("re_num"));
		int lec_num = Integer.parseInt(request.getParameter("lec_num"));
		String re = request.getParameter("re");
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String reg_date = sdf.format(date);
		
		
		
		ReviewDataBean dto = new ReviewDataBean();
		dto.setRe_num(re_num);
		dto.setRe(re);
		dto.setReg_date(reg_date);
		
		int result = lectureDao.modifyTutorReview(dto);
		
		request.setAttribute("lec_num", lec_num);
		request.setAttribute("result", result);
		return new ModelAndView("class365/tutorReviewModifyPro");
	}

}

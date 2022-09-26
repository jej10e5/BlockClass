package handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import lecturede.LectureDeDataBean;
import reviewlec.ReviewLecDataBean;

@Controller
public class TutorReviewMainHandler implements CommandHandler{
	
	@Resource
	LectureDao lectureDao;
	
	
	@RequestMapping("/tutorReviewMain")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	String id = (String)request.getSession().getAttribute("memid");
	List<LectureDeDataBean> dtos = lectureDao.getTutorClass(id);
	List<ReviewLecDataBean> dlos = new ArrayList<ReviewLecDataBean>();
	
	for(LectureDeDataBean dto : dtos) {
		int lec_num = dto.getLec_num();
	
		ReviewLecDataBean dlo = lectureDao.getTutorObj(lec_num);
		dlos.add(dlo);
	}
		
	
		request.setAttribute("dlos", dlos);
	 return new ModelAndView("class365/tutorReviewMain");
	}
}

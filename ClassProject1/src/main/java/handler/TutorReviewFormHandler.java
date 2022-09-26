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
import lecture.LectureDataBean;
import review.ReviewDataBean;
import reviewgr.ReviewGrDataBean;
import tutor.TutorDataBean;

@Controller
public class TutorReviewFormHandler implements CommandHandler{

	@Resource
	LectureDao lectureDao;
	
	
	@RequestMapping("/tutorReviewForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memid");		
		int lec_num= Integer.parseInt(request.getParameter("lec_num"));
		TutorDataBean sibal = lectureDao.getTutor(id);
		
	
		String pro = sibal.getPro();
		List<ReviewDataBean> dtos =lectureDao.getTutorReview(lec_num); 
		List<ReviewGrDataBean> dgos = new ArrayList<ReviewGrDataBean>(); 
		
		for(ReviewDataBean dto : dtos) {
			String cid= dto.getId();
			int clec_num = dto.getLec_num();
			int gr =  dto.getGr();
			int count =  0;
			ReviewGrDataBean dgo = new ReviewGrDataBean();
			
			if(cid != id) {
			  count=lectureDao.getGrCount(gr);			  
			}
			dgo.setRe_num(dto.getRe_num());
			dgo.setLec_num(clec_num);
			dgo.setId(dto.getId());
			dgo.setRe(dto.getRe());
			dgo.setImg(dto.getImg());
			dgo.setReg_date(dto.getReg_date());
			dgo.setRe_level(dto.getRe_level());
			dgo.setGr(gr);
			 dgo.setCount(count);
			dgos.add(dgo);
		}
		
		
		request.setAttribute("dgos", dgos);
		request.setAttribute("tutorpro", pro);
		request.setAttribute("tutorid", id);
		request.setAttribute("dtos", dtos);
		return new ModelAndView("class365/tutorReviewForm");
	}

}

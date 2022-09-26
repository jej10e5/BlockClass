package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import leclike.LeclikeDataBean;
import lecture.LectureDao;

@Controller
public class EfHeartHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("efheart.do")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
		String id=(String)request.getSession().getAttribute("memid");
		LeclikeDataBean dto = new LeclikeDataBean();
		dto.setId(id);
		dto.setLec_num(lec_num);
			lectureDao.insertHeart(dto);
			request.setAttribute("lec_num", lec_num);
			return new ModelAndView("/class365/heart_full");

	}
}
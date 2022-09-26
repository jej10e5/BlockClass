package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import leclike.LeclikeDataBean;
import lecture.LectureDao;
import lecturede.LectureDeDataBean;

@Controller
public class DeleteHeartHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/deleteHeart") 

	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memid");
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
		LeclikeDataBean dto = new LeclikeDataBean();
		dto.setId(id);
		dto.setLec_num(lec_num);
		lectureDao.deleteHeart(dto);
		String re=request.getHeader("Referer");
		request.setAttribute("re", re);
		return new ModelAndView("/class365/redirectPage");
	}
}

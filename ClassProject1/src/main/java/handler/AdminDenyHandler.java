package handler;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lecture.LectureDao;
import lecture.LectureDataBean;

@Controller
public class AdminDenyHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/deny")
	public void process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lec_num = Integer.parseInt(request.getParameter("lec_num"));
		LectureDataBean dto = new LectureDataBean();
		dto.setLec_num(lec_num);
		dto.setSta(5);
		lectureDao.changeClass(dto);
	}
	
}
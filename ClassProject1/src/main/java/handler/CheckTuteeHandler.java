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
import tuteemem.TuteememDataBean;


@Controller
public class CheckTuteeHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("checktutee")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int lec_num = Integer.parseInt(request.getParameter("lec_num"));
		List<TuteememDataBean> dtos = lectureDao.getTutee(lec_num);
		request.setAttribute("dtos", dtos);
		return new ModelAndView("/class365/checktutee");
		
	}
}

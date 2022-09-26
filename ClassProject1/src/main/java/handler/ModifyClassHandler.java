package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import lecture.LectureDataBean;

@Controller
public class ModifyClassHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/modifyClass")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
		LectureDataBean dto = lectureDao.getOriginClass(lec_num);
		request.setAttribute("dto", dto);
		return new ModelAndView("class365/modifyClass");
	}
}

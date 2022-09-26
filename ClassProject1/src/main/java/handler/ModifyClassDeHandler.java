package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecde.LecdeDataBean;
import lecture.LectureDao;

@Controller
public class ModifyClassDeHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/modifyClassde")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
		LecdeDataBean dto = lectureDao.getOriginClassde(lec_num);
		request.setAttribute("dto", dto);
		return new ModelAndView("/class365/modifyClassde");
	}
}

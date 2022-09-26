package handler;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import lecture.LectureDataBean;
import refund.RefundDataBean;

@Controller
public class AHideClassHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("hideClass")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			int lec_num=Integer.parseInt(request.getParameter("lec_num"));
			int sta=3;
			LectureDataBean dto=new LectureDataBean();
			dto.setLec_num(lec_num);
			dto.setSta(sta);
			lectureDao.changeClass(dto);
			request.setAttribute("lec_num", lec_num);
			
			return new ModelAndView("/class365/hideClass");
		
	}
}

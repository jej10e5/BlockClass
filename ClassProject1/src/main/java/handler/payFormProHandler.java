package handler;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import tutee.TuteeDataBean;

@Controller
public class payFormProHandler implements CommandHandler{
	
	@Resource 
	LectureDao lectureDao;
	

	@RequestMapping("/payFormPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	String id= (String)request.getParameter("id");
	int lec_num= Integer.parseInt(request.getParameter("lec_num"));

	
	TuteeDataBean dto = new TuteeDataBean();
	dto.setId(id);
	dto.setLec_num(lec_num);
	int result = lectureDao.insertTutee(dto);
	
	
		request.setAttribute("result", result);
		return new ModelAndView("/class365/payFormPro");
	}

}

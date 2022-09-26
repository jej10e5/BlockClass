package handler;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lecture.LectureDao;

@Controller
public class ReviewWriteHandler implements CommandHandler{
	
	@Resource
	LectureDao lectureDao; 
	
	@RequestMapping("/reviewWrite")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lec_num = Integer.parseInt(request.getParameter("lec_num"));
		int re_level = 0;
		//int Gr = 1; 그룹화아이디 시퀀스로 변경 
	
		
		
		//request.setAttribute("Gr", Gr);
		request.setAttribute("re_level", re_level);
		request.setAttribute("lec_num", lec_num);
		return new ModelAndView("class365/reviewWrite");
	}

}

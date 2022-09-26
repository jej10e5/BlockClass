package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecmem.LecmemDataBean;
import lecture.LectureDao;

@Controller
public class NloginProHandler implements CommandHandler{

		@Resource
		LectureDao lectureDao;
		
		@RequestMapping("/NloginPro.do")
		@Override	
		public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String id = (String)request.getParameter("id");
			String email = (String)request.getParameter("email");
			String naver = "N";
			LecmemDataBean dto = new LecmemDataBean();
			
			dto.setId(id);
			dto.setEmail(email);
			
			int result = lectureDao.KidCheck(id);
			
			if (result==0) {
			int insertrs=lectureDao.insertKmem(dto);
				 request.setAttribute("result", insertrs);
				 id += naver;
				 request.setAttribute("id", id);
				}else {
				 request.setAttribute("result", result);
				id += naver;
				 request.setAttribute("id", id);	
					
				}
			
		
		
		return new ModelAndView("class365/NloginOk");
	}

	
	
}

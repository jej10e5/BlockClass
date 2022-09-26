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
public class SignupProHandler implements CommandHandler {

	@Resource	
	private LectureDao lectureDao;
	
	@RequestMapping( "/signupPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding( "utf-8" );
		
		LecmemDataBean dto = new LecmemDataBean();
		dto.setId( request.getParameter( "id" ) );
		dto.setPasswd( request.getParameter( "passwd" ) );
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
			
		int result = lectureDao.insertMember( dto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "class365/signupPro" );
	}
}












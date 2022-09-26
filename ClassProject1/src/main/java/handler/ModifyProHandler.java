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
public class ModifyProHandler implements CommandHandler {

	@Resource
	private LectureDao lectureDao;
	
	@RequestMapping( "/modifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		LecmemDataBean dto = new LecmemDataBean();
		dto.setPasswd( request.getParameter( "passwd" ) );
		dto.setEmail(request.getParameter( "email" ));
		dto.setTel(request.getParameter( "tel" ) );	
		dto.setId( (String) request.getSession().getAttribute( "memid") ); 
	
		int result = lectureDao.modifyMember( dto );

		request.setAttribute( "result", result );	

		return new ModelAndView( "class365/modifyPro" );
	}

}















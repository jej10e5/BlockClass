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
public class ModifyViewHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	
	@RequestMapping( "/modifyView" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = (String) request.getSession().getAttribute( "memid" );
		String passwd = request.getParameter( "passwd" );

		int result = lectureDao.check( id, passwd );
	
		request.setAttribute( "result", result );
		if( result != 0) {
			LecmemDataBean dto = lectureDao.getMember( id );
			request.setAttribute( "dto", dto );
		}
		
		return new ModelAndView( "class365/modifyView" );
	}
}
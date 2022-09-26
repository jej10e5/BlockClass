package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;

@Controller
public class DeleteProHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	
	@RequestMapping( "/deletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = (String) request.getSession().getAttribute( "memid" );
		String passwd = request.getParameter( "passwd" );

		int resultCheck = lectureDao.check( id, passwd );

		request.setAttribute( "resultCheck", resultCheck );
		
		if( resultCheck != 0 ) {
			int result = lectureDao.deleteMember( id );
			request.setAttribute( "result", result );
		}		
		
		return new ModelAndView( "class365/deletePro" );
	}
}
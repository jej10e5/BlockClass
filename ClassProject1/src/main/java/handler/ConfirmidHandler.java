package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;


@Controller
public class ConfirmidHandler implements CommandHandler {

	@Resource
	private LectureDao lectureDao;
	
	@RequestMapping( "/confirmid" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter( "id" );
		int result = lectureDao.check( id );
		
		request.setAttribute( "result", result );
		request.setAttribute( "id", id );
		
		return new ModelAndView( "class365/confirmid" );
	}	
}












package handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import lecture.LectureDataBean;
import review.ReviewDataBean;
import tutee.TuteeDataBean;
import tuteelec.TuteeLecDataBean;

@Controller
public class ReviewFormHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
		
	@RequestMapping("/reviewForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String id = (String)request.getSession().getAttribute("memid");
		List<TuteeLecDataBean> dtos = lectureDao.getTuteeClass(id);

		int count = 0;
		int size = 5;
		int start = 0;
		int end = 0;
		String pageNum = null;
		int currentPage = 0;
		int pageSize = 5;
		 
		count = lectureDao.getReCount(id);
		
		pageNum = request.getParameter( "pageNum" );
		if(pageNum==null) {
			pageNum="1";
			
		}
		currentPage = Integer.parseInt( pageNum );
		start = ( currentPage - 1 ) * size + 1;	
		end = start + size -1;	
		if( end > count ) end = count;
		
		int number = count - ( currentPage -1 ) * size;	
		int startPage = ( currentPage / pageSize ) * pageSize + 1;
		if( currentPage % pageSize == 0 ) startPage -= pageSize;
		int endPage = startPage + pageSize - 1;	
		int pageCount = ( count / size ) + ( count % size > 0 ? 1 : 0 );
		if( endPage > pageCount ) endPage = pageCount;
		
		
		
		request.setAttribute( "count", count );
		request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "currentPage", currentPage );
		request.setAttribute( "pageSize", pageSize );
		request.setAttribute( "startPage", startPage );
		request.setAttribute( "endPage", endPage );
		request.setAttribute( "pageCount", pageCount );
		
		request.setAttribute("dtos", dtos);	
		return new ModelAndView("class365/reviewForm");
	}

}

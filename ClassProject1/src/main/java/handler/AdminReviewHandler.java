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
import review.ReviewDataBean;

@Controller
public class AdminReviewHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("adminReview")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memid");
		if(id==null) id="guest";
		if(id.equals("class365")) {
			List<ReviewDataBean> dtos=lectureDao.getReviewAll();
			request.setAttribute("dtos", dtos);
			return new ModelAndView("/class365/adminReview");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('접근이 제한된 요청입니다.);");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			//history.back()�븣臾몄뿉 �븘�슂�뾾�뒗 遺�遺꾩씠吏�留� return媛믩븣臾몄뿉 �꽔�뼱以�
			String re=request.getHeader("Referer");
			request.setAttribute("re", re);
			return new ModelAndView("/class365/redirectPage");
		}
		
	}
}

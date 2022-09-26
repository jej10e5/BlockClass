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
import lecturede.LectureDeDataBean;

@Controller
public class AdminClassHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("adminClass")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memid");
		if(id==null) id="guest";
		if(id.equals("class365")) {
			List<LectureDeDataBean> dtos=lectureDao.getClassListAll();
			request.setAttribute("dtos", dtos);
			return new ModelAndView("/class365/adminClass");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('접근이 허용되지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			String re=request.getHeader("Referer");
			request.setAttribute("re", re);
			return new ModelAndView("/class365/redirectPage");
		}
		
	}
}

package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import leclike.LeclikeDataBean;
import lecture.LectureDao;
import lecturede.LectureDeDataBean;

@Controller
public class MainResultForm implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/mainResultForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String p = (String) request.getParameter("p");
		String c = (String) request.getParameter("c");
		String id = (String)request.getSession().getAttribute("memid");
		if(p!=null && p!="") {
			request.setAttribute("p", p);
			List<LectureDeDataBean> dtos=lectureDao.getSearchResult(p);
			request.setAttribute("dtos", dtos);
		}else if(c!=null && c!="") {
			if(c.equals("d")) {
				request.setAttribute("c", c);
				List<LectureDeDataBean> dtos=lectureDao.getInactive();
				request.setAttribute("dtos", dtos);
			}else {
				request.setAttribute("c", c);
				List<LectureDeDataBean> dtos=lectureDao.getCategory(c);
				request.setAttribute("dtos", dtos);
			}
		}else {
			p="";
			request.setAttribute("p", p);
		}
		if(id!=null) {
			List<LeclikeDataBean> ldtos = lectureDao.getLikeList(id);
			request.setAttribute("ldtos", ldtos);
			}
		return new ModelAndView("/class365/mainResultForm");
	}
}

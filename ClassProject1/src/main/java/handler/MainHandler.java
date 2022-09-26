package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecdelike.LecdelikeDataBean;
import leclike.LeclikeDataBean;
import lecture.LectureDao;
import lecturede.LectureDeDataBean;
@Controller
public class MainHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/mainForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id = (String)request.getSession().getAttribute("memid");
		if(id==null||id=="") id="geust";
		List<LecdelikeDataBean> dtos = lectureDao.getClassLikeList(id); 
		request.setAttribute("dtos", dtos);
		
		String txid=request.getParameter("Txid");
		if(txid!=""&&txid!=null) {
		request.setAttribute("txid", txid);
		}
		return new ModelAndView("class365/mainForm"); 
	}
}

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
public class LikeListFormHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/likeListForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id=(String) request.getSession().getAttribute("memid");
		List<LeclikeDataBean> ldtos = lectureDao.getLikeList(id);
		request.setAttribute("ldtos", ldtos);
		List<LectureDeDataBean> mldtos = lectureDao.getMemberLikeList(id);
		request.setAttribute("mldtos", mldtos);
		return new ModelAndView("class365/likeListForm");
	}
}

package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import refund.RefundDataBean;

@Controller
public class RefundConfirmHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("refundConfirm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
		RefundDataBean dto = new RefundDataBean();
		dto.setId(id);
		dto.setLec_num(lec_num);
		lectureDao.deleteReReview(dto);
		lectureDao.refundConfirm(dto);
		
		String re=request.getHeader("Referer");
		request.setAttribute("re", re);
		return new ModelAndView("class365/insertHeart");
	}
}

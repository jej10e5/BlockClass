package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import refund.RefundDataBean;

@Controller
public class RefundRequestHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("refundRequest")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("memid");
		if(request.getParameter("lec_num")!=null&&request.getParameter("lec_num")!="") {
			int lec_num=Integer.parseInt(request.getParameter("lec_num"));
			RefundDataBean dto = new RefundDataBean();
			dto.setId(id);
			dto.setLec_num(lec_num);
			if(lectureDao.checkMemRefund(dto)==0) {
				int check=lectureDao.insertRefund(dto); 
				request.setAttribute("check", check);
				List<RefundDataBean> dtos=lectureDao.getMemberRefund(id);
				request.setAttribute("dtos", dtos);
				return new ModelAndView("class365/refundRequest");
			}else {
				int check=0;
				request.setAttribute("check", check);
				List<RefundDataBean> dtos=lectureDao.getMemberRefund(id);
				request.setAttribute("dtos", dtos);
				return new ModelAndView("class365/refundRequest");
			}
		}else {
			List<RefundDataBean> dtos=lectureDao.getMemberRefund(id);
			request.setAttribute("dtos", dtos);
			
			
			return new ModelAndView("class365/refundRequest");
		}

		
	}
}

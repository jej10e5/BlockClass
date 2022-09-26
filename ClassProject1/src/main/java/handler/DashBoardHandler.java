package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import tx.TxDataBean;

@Controller
public class DashBoardHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/dashBoard")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<TxDataBean> dtos=lectureDao.getDashBoard();
		request.setAttribute("dtos", dtos);
		return new ModelAndView("/class365/dashBoard");
	}
}


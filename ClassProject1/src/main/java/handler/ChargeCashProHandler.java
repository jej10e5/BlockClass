package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wallet.WalletDataBean;
import lecture.LectureDao;

@Controller
public class ChargeCashProHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/chargeCashPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id=(String) request.getSession().getAttribute("memid");
		int cash = Integer.parseInt(request.getParameter("cash"));
		int chargeCash = Integer.parseInt(request.getParameter("chargeCash"));
		
		//Ãß°¡
		WalletDataBean dto = lectureDao.getWallet(id);
		dto.setCash(cash+chargeCash);
		
		int result=lectureDao.updateCash(dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("class365/chargeCashPro");
	}
}

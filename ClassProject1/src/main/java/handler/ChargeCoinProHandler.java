package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//import wallet.WalletDataBean;
import reqcharge.ReqChargeDataBean;
import lecture.LectureDao;

@Controller
public class ChargeCoinProHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/chargeCoinPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id=(String) request.getSession().getAttribute("memid");
		int cash = Integer.parseInt(request.getParameter("cash"));
		int coin = Integer.parseInt(request.getParameter("coin"));
		int chargeCoin = Integer.parseInt(request.getParameter("chargeCoin"));
		
		ReqChargeDataBean reqdto = new ReqChargeDataBean();
		reqdto.setId(id);
		reqdto.setReq_coin(chargeCoin);
		reqdto.setStatus(0);
		
		if(cash-chargeCoin>=0) {
			// reqCharge status = 0 (승인 안 받았을 때)
			int result=lectureDao.insertReq(reqdto);
			request.setAttribute("result", result);
				
			return new ModelAndView("class365/chargeCoinPro");
			
		}else return new ModelAndView("class365/chargeCoinProFalse");
		
	}
}

package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wallet.WalletDataBean;
import lecmem.LecmemDataBean;
import lecture.LectureDao;
import tx.TxDataBean;

@Controller
public class sendChargeInfoHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/sendChargeInfo")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		
		//String id=(String) request.getSession().getAttribute("memid");
		String id=lectureDao.getLastCharge();
		
		LecmemDataBean dto = lectureDao.getMember(id);
		request.setAttribute("dto", dto);
		
		WalletDataBean waldto = lectureDao.getWallet(id);
		request.setAttribute("waldto", waldto);
		
		String buyerAddr = lectureDao.getBuyerAddr(id);
		TxDataBean txdto = lectureDao.getTxInfo(buyerAddr);
		request.setAttribute("txdto", txdto);
		
		return new ModelAndView("class365/sendChargeInfo");
	}
}

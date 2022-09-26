package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecmem.LecmemDataBean;
import lecture.LectureDao;
import wallet.WalletDataBean;

@Controller
public class ChargeCoinHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/chargeCoin")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		String id=(String) request.getSession().getAttribute("memid");
		
		LecmemDataBean dto = lectureDao.getMember(id);
		request.setAttribute("dto", dto);
		
		WalletDataBean waldto = lectureDao.getWallet(id);
		request.setAttribute("waldto", waldto);
		
		return new ModelAndView("class365/chargeCoin");
	}
}

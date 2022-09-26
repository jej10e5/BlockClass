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
public class WalletResultHandler implements CommandHandler  {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/walletResult")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String id=(String) request.getSession().getAttribute("memid");
		String adr=(String)request.getParameter("adr");
		String a=(String)request.getSession().getAttribute("memid");
		String pk=(String)request.getParameter("pk");
		request.setAttribute("adr", adr);
		request.setAttribute("a", a);
		
		
		WalletDataBean waldto = new WalletDataBean();
		waldto.setId(a);
		waldto.setWaladdr(adr);
		waldto.setCash(0);
		waldto.setCoin(0);
		lectureDao.createWallet(a);
		lectureDao.insertInit(waldto);
		request.setAttribute("waldto", waldto);
		request.setAttribute("pk",pk);
		
		
		return new ModelAndView("class365/walletResult");
	}
}
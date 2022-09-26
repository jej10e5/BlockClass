package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecture.LectureDao;
import wallet.WalletDataBean;

@Controller
public class WalletCreateHandler implements CommandHandler  {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/walletCreate")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String adr=(String)request.getParameter("adr");
		
		request.setAttribute("adr", adr);
		//request.setAttribute("a", a);
		
		
		WalletDataBean waldto = new WalletDataBean();
		//waldto.setId(a);
		waldto.setWaladdr(adr);
		
		int result=lectureDao.updateWalletAddr(waldto);
		request.setAttribute("result", result);
		
		
		return new ModelAndView("class365/walletCreate");
	}
}
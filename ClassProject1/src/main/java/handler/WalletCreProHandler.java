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
public class WalletCreProHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/walletCrePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id=(String) request.getSession().getAttribute("memid");
		
		int result1=lectureDao.createWallet(id);
		request.setAttribute("result1", result1);
		
		//String adr=(String)request.getParameter("adr");
		//String a=(String)request.getParameter("alias");
		//request.setAttribute("adr", adr);
		//request.setAttribute("a", a);
		
		WalletDataBean waldto = new WalletDataBean();
		//waldto.setId(a);
		waldto.setId(id);
		waldto.setCash(0);
		waldto.setCoin(0);
		waldto.setWaladdr("null");
		
		int result2=lectureDao.insertInit(waldto);
		request.setAttribute("result2", result2);
		
		return new ModelAndView("class365/walletCrePro");
	}
}

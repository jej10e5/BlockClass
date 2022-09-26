package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wallet.WalletDataBean;
import walletcharge.WalletChargeDataBean;
import lecmem.LecmemDataBean;
import lecture.LectureDao;
import reqcharge.ReqChargeDataBean;

@Controller
public class AdminCoinHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/adminCoin")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		String id=(String) request.getSession().getAttribute("memid");
		LecmemDataBean dto = lectureDao.getMember(id);
		request.setAttribute("dto", dto);
		
		WalletDataBean aw=lectureDao.getAdminWallet();
		String admin = aw.getWaladdr();
		List<WalletChargeDataBean> dtos = lectureDao.getChargeReq();
		request.setAttribute("dtos", dtos);
		
		//WalletDataBean waldto = lectureDao.getWallet(id);
		//request.setAttribute("waldto", waldto);
		
		request.setAttribute("admin", admin);
		return new ModelAndView("class365/adminCoin");
	}
}

package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wallet.WalletDataBean;
import lecture.LectureDao;
import lecture.LectureDataBean;



@Controller
public class TxProHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/txPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String fromid=(String) request.getSession().getAttribute("memid");
		String toid=request.getParameter("to");
		int cost=Integer.parseInt(request.getParameter("cost"));
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
		LectureDataBean dto=lectureDao.getLecture(lec_num);
		
		WalletDataBean fromW=lectureDao.getWallet(fromid);
		//int fromCoin = fromW.getCoin();
		//int pay = fromCoin-cost;
		//fromW.setCoin(pay);
		
		WalletDataBean toW=lectureDao.getWallet(toid);
		//int toCoin = toW.getCoin();
		//int income = toCoin+cost;
		//toW.setCoin(income);
		
		request.setAttribute("toW",toW);
		request.setAttribute("fromW",fromW);
		request.setAttribute("dto", dto);
		request.setAttribute("cost", cost);
		
		return new ModelAndView("/class365/txPro");
	}
}

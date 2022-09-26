package handler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wallet.WalletDataBean;
//import reqcharge.ReqChargeDataBean;
import lecture.LectureDao;
import tutee.TuteeDataBean;
import tx.TxDataBean;

@Controller
public class AdminCoinProHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/adminCoinPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int reqid=Integer.parseInt(request.getParameter("reqid"));
		String from=request.getParameter("txfrom");
		String to=request.getParameter("txto");
		String item=request.getParameter("txitem");
		String bacc=request.getParameter("bacc");
		int sacc=Integer.parseInt(request.getParameter("sacc"));
		int price = Integer.parseInt(request.getParameter("txprice"));
		int cash = Integer.parseInt(request.getParameter("cash"));

		//reqeustcharge db
		lectureDao.updateStat(reqid);
		
		//wallet db
		WalletDataBean bw=lectureDao.getAdminWallet();
		int ori=bw.getCash();
		bw.setCash(ori+price);
		bw.setCoin(10000);
		lectureDao.updateCash(bw);
		lectureDao.updateAcc(bw);
		
		WalletDataBean sw=new WalletDataBean();
		sw.setWaladdr(to);
		sw.setCoin(sacc);
		sw.setCash(cash-price);
		lectureDao.updateCash(sw);
		lectureDao.updateAcc(sw);
		
		//tx db
		String tx_id=request.getParameter("txid");
		String blc_id=request.getParameter("blcid");
		String txtime=request.getParameter("txtime");
		String txsig=request.getParameter("txsig");
		TxDataBean tx=new TxDataBean();
		tx.setBlc_id(blc_id);
		tx.setBuyer(from);
		tx.setItem(item);
		tx.setTxtime(txtime);
		tx.setSeller(to);
		tx.setPrice(price);
		tx.setTx_id(tx_id);
		lectureDao.insertTx(tx);

		request.setAttribute("bacc", bacc);
		request.setAttribute("sacc", sacc);
		request.setAttribute("tx_id", tx_id);
		request.setAttribute("blc_id", blc_id);
		request.setAttribute("txtime", txtime);
		request.setAttribute("txsig", txsig);

		
		//lectureDao.updateCash(sw);
		return new ModelAndView("class365/adminCoinPro");
				
	}
}

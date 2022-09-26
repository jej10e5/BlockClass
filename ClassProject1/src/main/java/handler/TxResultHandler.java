package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tx.TxDataBean;
import wallet.WalletDataBean;
import lecture.LectureDao;
import tutee.TuteeDataBean;

@Controller
public class TxResultHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("txResult")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=(String)request.getSession().getAttribute("memid");
		String lec_num=request.getParameter("txitem");
		int price=Integer.parseInt(request.getParameter("txprice"));
		TuteeDataBean dto = new TuteeDataBean();
		dto.setId(id);
		dto.setLec_num(Integer.parseInt(lec_num));
		int result = lectureDao.insertTutee(dto);
		
		String from=request.getParameter("txfrom");
		String to=request.getParameter("txto");

		int bacc=Integer.parseInt(request.getParameter("bacc"));
		int sacc=Integer.parseInt(request.getParameter("sacc"));
		
		WalletDataBean bw=new WalletDataBean();
		bw.setWaladdr(from);
		bw.setCoin(bacc);
		
		WalletDataBean sw=new WalletDataBean();
		sw.setWaladdr(to);
		sw.setCoin(sacc);
		
		lectureDao.updateAcc(bw);
		lectureDao.updateAcc(sw);
		
		String tx_id=request.getParameter("txid");
		String blc_id=request.getParameter("blcid");
		String txtime=request.getParameter("txtime");
		String txsig=request.getParameter("txsig");
		
		TxDataBean tx=new TxDataBean();
		tx.setBlc_id(blc_id);
		tx.setBuyer(to);
		tx.setItem(lec_num);
		tx.setPrice(price);
		tx.setSeller(from);
		tx.setTx_id(tx_id);
		tx.setTxtime(txtime);
		lectureDao.insertTx(tx);
		
		request.setAttribute("bacc", bacc);
		request.setAttribute("tx_id", tx_id);
		request.setAttribute("blc_id", blc_id);
		request.setAttribute("txtime", txtime);
		request.setAttribute("txsig", txsig);
		request.setAttribute("result", result);
	

		return new ModelAndView("/class365/txResult");
	}
}

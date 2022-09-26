package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TxRefHandler implements CommandHandler{
	@RequestMapping("/txRef")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String txid=request.getParameter("Jhs");
		String from=request.getParameter("Jfs");
		String to=request.getParameter("Jts");
		String item=request.getParameter("Jis");
		String sig=request.getParameter("Jss");
		String timestamp=request.getParameter("Jtp");
		int price=Integer.parseInt(request.getParameter("Jpr"));
		request.setAttribute("txid", txid);
		request.setAttribute("from", from);
		request.setAttribute("to", to);
		request.setAttribute("item", item);
		request.setAttribute("sig", sig);
		request.setAttribute("timestamp", timestamp);
		request.setAttribute("price", price);
		return new ModelAndView("/class365/txRef");
	}
}

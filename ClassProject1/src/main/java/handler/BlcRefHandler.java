package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BlcRefHandler implements CommandHandler{
	@RequestMapping("/blcRef")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String blcid=request.getParameter("Bjhs");
		String pre=request.getParameter("Bpjhs");
		String pow=request.getParameter("Bjps");
		String tx=request.getParameter("Bjts");
		int height=Integer.parseInt(request.getParameter("Bht"));
		String timestamp=request.getParameter("Btp");
		request.setAttribute("blcid", blcid);
		request.setAttribute("pre", pre);
		request.setAttribute("pow", pow);
		request.setAttribute("tx", tx);
		request.setAttribute("height", height);
		request.setAttribute("timestamp", timestamp);
		
		return new ModelAndView("/class365/blcRef");
	}
}

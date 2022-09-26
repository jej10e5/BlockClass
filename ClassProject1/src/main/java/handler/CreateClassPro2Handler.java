package handler;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecde.LecdeDataBean;
import lecture.LectureDao;
 
@Controller
public class CreateClassPro2Handler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/createClassPro2")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		LecdeDataBean dto = new LecdeDataBean();
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
//		String lv="���̵�";
//		int pri=1000;
//		int cap=10;
//		String adr="�ּ�";
//		
//		String be="������";
//		String fin="��������";
//		
		String lv=request.getParameter("lv");
		int pri=Integer.parseInt(request.getParameter("pri"));
		int cap=Integer.parseInt(request.getParameter("cap"));
		String adr=request.getParameter("adr");
		String be=request.getParameter("be");
		String fin=request.getParameter("fin");
		
		
		dto.setLec_num(lec_num);
		dto.setLv(lv);
		dto.setPri(pri);
		dto.setCap(cap);
		dto.setAdr(adr);
		dto.setBe(be);
		dto.setFin(fin);
		
		int result=lectureDao.createClass2(dto)+ lectureDao.createFinClass(lec_num);
		request.setAttribute("result", result);
		
		return new ModelAndView("class365/createClassPro2");
	}
}

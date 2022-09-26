package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecde.LecdeDataBean;
import lecture.LectureDao;

@Controller
public class ModifyClassDeProHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/modifyClassdePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		LecdeDataBean dto = new LecdeDataBean();
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
		
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
		int result;
		int check=lectureDao.checkOriginClassde(lec_num);
		if(check==0) {
			lectureDao.createFinClass(lec_num);
			result = lectureDao.createClass2(dto);
		}else {
			lectureDao.createFinClass(lec_num);
			result = lectureDao.modifyClassde(dto);
		}
		request.setAttribute("result", result);
		
		
		return new ModelAndView("/class365/modifyClassdePro");
	}
}

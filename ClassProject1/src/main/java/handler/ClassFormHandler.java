package handler;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lecde.LecdeDataBean;
import lecmem.LecmemDataBean;
import lecture.LectureDao;
import lecture.LectureDataBean;
import review.ReviewDataBean;
import reviewgr.ReviewGrDataBean;
import tutor.TutorDataBean;
import wallet.WalletDataBean;

@Controller
public class ClassFormHandler implements CommandHandler{
	@Resource 
	LectureDao lectureDao;
	
	@RequestMapping("/classForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int lec_num = Integer.parseInt(request.getParameter("lec_num"));
		LectureDataBean dto= lectureDao.getLecture(lec_num);
		LecdeDataBean dcd = lectureDao.getLecde(lec_num);
		String To = dto.getId();
		TutorDataBean dtt = lectureDao.getTutor(To);
		LecmemDataBean dtl = lectureDao.getMember(To);
		List<ReviewDataBean> dros =lectureDao.getTutorReview(lec_num); 
		List<ReviewGrDataBean> dgos = new ArrayList<ReviewGrDataBean>(); 
		

		for(ReviewDataBean dro : dros) {
			int clec_num = dro.getLec_num();
			int gr =  dro.getGr();
			int count =  0;
			ReviewGrDataBean dgo = new ReviewGrDataBean();

			
			count=lectureDao.getGrCount(gr);			
	
			dgo.setRe_num(dro.getRe_num());
			dgo.setLec_num(clec_num);
			dgo.setId(dro.getId());
			dgo.setRe(dro.getRe());
			dgo.setImg(dro.getImg());
			dgo.setReg_date(dro.getReg_date());
			dgo.setRe_level(dro.getRe_level());
			dgo.setGr(gr);
			dgo.setCount(count);
			dgos.add(dgo);
		}
		

		int like=lectureDao.calcLike(lec_num);
		int month = lectureDao.calcMonth(lec_num);
		int m_cost = lectureDao.calcMaxCost(dcd,month);
		int days = lectureDao.calcDays(lec_num);
		int now= lectureDao.getNowTutee(lec_num);
		
		request.setAttribute("dgos", dgos);
		request.setAttribute("lec_num", lec_num);
		request.setAttribute("dto", dto);
		request.setAttribute("dtt", dtt);
		request.setAttribute("dtl", dtl);
		request.setAttribute("dcd", dcd);
		request.setAttribute("days", days);
		request.setAttribute("month", month);
		request.setAttribute("m_cost", m_cost);
		request.setAttribute("now", now);
		request.setAttribute("like", like);
		
		int check;
		if(dto.getSta()==1 || dto.getSta()==2) {
			check=1;
		}else 	check=0;
		String memid=(String)request.getSession().getAttribute("memid");
		if(memid==null||memid=="") memid="guest";
		if(memid.equals("class365")) {//admin
			return new ModelAndView("class365/classForm");
		}else if(check!=1) { 
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('접근이 허용되지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			String re=request.getHeader("Referer");
			request.setAttribute("re", re);
			return new ModelAndView("/class365/redirectPage");
		}else {//member guest
			return new ModelAndView("class365/classForm");
		
		}
	}

}


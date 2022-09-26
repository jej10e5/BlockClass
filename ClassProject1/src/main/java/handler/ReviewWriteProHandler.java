package handler;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lecture.LectureDao;
import review.ReviewDataBean;
import tutee.TuteeDataBean;

@Controller
public class ReviewWriteProHandler implements CommandHandler{
	
	@Resource
	LectureDao lectureDao;
	
	@RequestMapping("reviewWritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding( "utf-8" );
		String path= request.getSession().getServletContext().getRealPath("/classImage");
		new File( path ).mkdir();
		MultipartRequest multi = new MultipartRequest(
				request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());

		String id= (String) request.getSession().getAttribute( "memid" );
		int lec_num = Integer.parseInt(multi.getParameter("lec_num"));
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		
		ReviewDataBean dto = new ReviewDataBean();
		dto.setLec_num(  Integer.parseInt(multi.getParameter("lec_num")));
		dto.setId( (String) request.getSession().getAttribute( "memid" ));
		dto.setRe( (String) multi.getParameter("Re"));
		dto.setImg( multi.getFilesystemName("img"));
		dto.setReg_date(sdf.format(date) );
		dto.setRe_level( Integer.parseInt(multi.getParameter("re_level"))); 
		//dto.setGr( Integer.parseInt(multi.getParameter("Gr"))); �׷�ȭ���̵� �������� ���� 
		
		int result = lectureDao.insertReview(dto);
		
		if (result != 0) {
			ReviewDataBean rev = lectureDao.getReview(dto);
			TuteeDataBean dtt =new TuteeDataBean();
			dtt.setRe_num(rev.getRe_num());
			dtt.setId(id);
			dtt.setLec_num(lec_num);
			lectureDao.insertRenum(dtt);
			
		}
		
		request.setAttribute("result", result);
		return new ModelAndView("class365/reviewWritePro");
	}

}

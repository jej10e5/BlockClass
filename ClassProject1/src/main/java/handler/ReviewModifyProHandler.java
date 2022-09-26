package handler;

import java.io.File;
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
@Controller
public class ReviewModifyProHandler implements CommandHandler{

	@Resource
	LectureDao lectureDao;
	
	@RequestMapping("/reviewModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding( "utf-8" );
		String path= request.getSession().getServletContext().getRealPath("/classImage");
		new File( path ).mkdir();
		MultipartRequest multi = new MultipartRequest(
				request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		ReviewDataBean dto = new ReviewDataBean();
		
		String img = multi.getFilesystemName("img");
		int re_num = Integer.parseInt(multi.getParameter("re_num"));
		String Re =  (String) multi.getParameter("Re");
		String reg_date = sdf.format(date);
		
		dto.setImg(img);
		dto.setRe_num(re_num);
		dto.setRe(Re);
		dto.setReg_date(reg_date);
		
		int result = lectureDao.modifyReview(dto);
		
		request.setAttribute("result", result);
		return new ModelAndView("class365/reviewModifyPro");
	}

}

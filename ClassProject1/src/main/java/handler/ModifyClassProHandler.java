package handler;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lecde.LecdeDataBean;
import lecture.LectureDao;
import lecture.LectureDataBean;

@Controller
public class ModifyClassProHandler implements CommandHandler {
	@Resource
	private LectureDao lectureDao;
	@RequestMapping("/modifyClassPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		LectureDataBean dto = new LectureDataBean();
		int lec_num=Integer.parseInt(request.getParameter("lec_num"));
		String path= request.getSession().getServletContext().getRealPath("/classImage");
		new File( path ).mkdir();
		MultipartRequest multi = new MultipartRequest(
				request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
		String sub = multi.getParameter("lec_sub");
		String con = multi.getParameter("lec_con");
		String intr = multi.getParameter("lec_intr");
		String category = multi.getParameter("category");
		String imgname = multi.getFilesystemName("img");
		String thumbname=multi.getFilesystemName("thumb");
		
		dto.setLec_num(lec_num);
		dto.setSub(sub);
		dto.setCon(con);  
		dto.setIntr(intr);
		dto.setCate(category);
		
		if(imgname != null && imgname !="") {
			dto.setImg(imgname);
			lectureDao.modifyClassImg(dto);
		}
		if(thumbname != null && thumbname !="") {
			dto.setThu(thumbname);
			lectureDao.modifyClassThumb(dto);
		}
		//origin_name저장할 필요 없어서 안함.
		
		
		int result=lectureDao.modifyClass(dto);
		request.setAttribute("result", result);
		request.setAttribute("lec_num", lec_num);
		return new ModelAndView("/class365/modifyClassPro");
	}
}

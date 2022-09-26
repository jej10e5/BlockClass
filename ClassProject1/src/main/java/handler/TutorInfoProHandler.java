package handler;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lecture.LectureDao;
import tutor.TutorDataBean;

@Controller
public class TutorInfoProHandler implements CommandHandler{
	@Resource
	private LectureDao lectureDao;
	
	@RequestMapping("/tutorInfoPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TutorDataBean dto = new TutorDataBean();
		String id=(String) request.getSession().getAttribute("memid");
		String path = request.getSession().getServletContext().getRealPath("/classImage");
		int result =0;
	
		new File(path).mkdir();
		
		MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
		String systempro = multi.getFilesystemName("pro");
		
		
		int compare = lectureDao.tutorCheck(id);
		
		//lectureDao.getTutor(id);
		
		if(compare ==0) {
			dto.setId(id);
			dto.setInfo(multi.getParameter("info"));
			dto.setAcc(multi.getParameter("acc"));		
			dto.setPro(systempro);
			 result = lectureDao.insertTutor(dto);
			
		}else {
			
			dto.setId(id);
			dto.setInfo(multi.getParameter("info"));
			dto.setAcc(multi.getParameter("acc"));	
			if(systempro!=null && systempro!="") {
				dto.setPro(systempro);
				lectureDao.modifyTutorPro(dto);
			}
			
			result = lectureDao.modifyTutor(dto);
		}
		 
			request.setAttribute("result", result);
			return new ModelAndView("class365/tutorInfoPro");
	}

	
	
}

package lecture;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lecde.LecdeDataBean;
import lecdelike.LecdelikeDataBean;
import leclike.LeclikeDataBean;
import lecmem.LecmemDataBean;
import tutee.TuteeDataBean;
import tuteelec.TuteeLecDataBean;

import tuteemem.TuteememDataBean;
import lecturede.LectureDeDataBean;
import map.MapDataBean;
import mem.MemDataBean;
import refund.RefundDataBean;
import reqcharge.ReqChargeDataBean;
import review.ReviewDataBean;
import reviewlec.ReviewLecDataBean;
import tutor.TutorDataBean;
import wallet.WalletDataBean;
import walletcharge.WalletChargeDataBean;
import tx.TxDataBean;

public class LectureDBBean implements LectureDao{
	@Override
	public int insertMember( LecmemDataBean dto ) {		
		return SqlMapClient.getSession().insert( "Lecture.insertMember", dto );
	}
	@Override
	public int createClass(LectureDataBean dto) {
		return SqlMapClient.getSession().
				insert("Lecture.insertClass",dto);
	}
	public int check(String id) {			
		int count = SqlMapClient.getSession().selectOne("Lecture.check",id);
		int result = 0;
		if(count !=0) {
			result = 1;
		} else {
		 result = 0;	
		}
	return result;
	}
	
	public int tutorCheck(String id) {			
		int count = SqlMapClient.getSession().selectOne("Lecture.tutorCheck",id);
		int result = 0;
		if(count !=0) {
			result = 1;
		} else {
		 result = 0;	
		}
	return result;
	}
	
	
	
	
	public int check(String id, String passwd) {
		int count = check(id);
		int result = 0;
		if(count != 0) {
			LecmemDataBean dto = getMember(id);
			if(dto.getPasswd().equals(passwd)) {
				result = 1;
			}else {
				result = 0;
			}
		}	else {
			
			result = -1;
			
		}	
		return result;
	
	}
	
	

	public int deleteMember( String id ) {		
		return SqlMapClient.getSession().delete( "Lecture.deleteMember", id );
	}
	
	
	public int calcMonth(int lec_num) {	
		LecdeDataBean dto = getLecde(lec_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int month =0;

		try {
			Date bdate = sdf.parse(dto.getBe());
			Date  fdate = sdf.parse(dto.getFin());
			
			

			long diff = fdate.getTime()-bdate.getTime(); 
			long diffDays = diff / (24 * 60 * 60 * 1000) ;
			long difMonth = (diffDays+1)/30;
			
			month =(int)difMonth;
			return month;
		} catch (ParseException e) {
			e.printStackTrace();
		}
	
		return month;
	}// 

	public int calcDays(int lec_num) {
		LecdeDataBean dto = getLecde(lec_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int days =0;

		try {
			Date bdate = sdf.parse(dto.getBe());
			Date  fdate = sdf.parse(dto.getFin());
			
			

			long diff = fdate.getTime()-bdate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000) ;
			
			days= (int)diffDays;
		
	}catch (ParseException e) {
		e.printStackTrace();
	}

	return days; 
	}
	
	
	public LecmemDataBean getMember(String id) {	
		return SqlMapClient.getSession().selectOne("Lecture.getMember",id);	
	  }
	public List<MemDataBean> getMemberAll() {	
		return SqlMapClient.getSession().selectList("Lecture.getMemberAll");	
	  }


	public TutorDataBean getTutor(String id) {
		return SqlMapClient.getSession().selectOne("Lecture.getTutor",id);
	}
	@Override
	public int modifyTutor(TutorDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.modifyTutor",dto);
	}

	@Override
	public int insertTutor(TutorDataBean dto) {
		return SqlMapClient.getSession().insert("Lecture.insertTutor",dto);
	}
	@Override
	public List<LectureDeDataBean> getClassList() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectList("Lecture.getClassList");
	}
	@Override
	public List<LecdelikeDataBean> getClassLikeList(String id) {
		return SqlMapClient.getSession().selectList("Lecture.getClassLikeList",id);
	}
	@Override
	public List<LectureDeDataBean> getClassListAll() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectList("Lecture.getClassListAll");
	}
	@Override
	public List<LectureDeDataBean> getClassConfirm() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectList("Lecture.getClassConfirm");
	}
	
	@Override

	public LectureDataBean getLecture(int lec_num) {
		return SqlMapClient.getSession().selectOne("Lecture.getLecture",lec_num);
	}
	@Override
	public LecdeDataBean getLecde(int lec_num) {
		return SqlMapClient.getSession().selectOne("Lecture.getLecde",lec_num);
	}
	


	public int getCreateTutor(String id) {
		return SqlMapClient.getSession().selectOne("Lecture.getTutorClassCount",id);
	}
	

	@Override
	public int getLecNum() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("Lecture.getLecNum");
	}
	@Override
	public int createClass2(LecdeDataBean dto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().insert("Lecture.insertClass2",dto);
	}
	@Override
	public int calcMaxCost(LecdeDataBean dto, int month) {
		int price = dto.getPri();
		int m_cost = price*month;
				
		return m_cost; 
	}
	public int finClass(int lec_num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().update("Lecture.updateFinClass",lec_num);

	}
	public int createFinClass(int lec_num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().update("Lecture.updateCreateClass",lec_num);

	}
	@Override
	public int insertTutee(TuteeDataBean dto) {

	
		return SqlMapClient.getSession().insert("Lecture.insertTutee",dto);
	}

	@Override
	public List<LectureDeDataBean> getTutorClass(String id) { 
		return SqlMapClient.getSession().selectList("Lecture.getTutorClass",id);
	}
	@Override
	public LectureDataBean getOriginClass(int lec_num) {
		return SqlMapClient.getSession().selectOne("Lecture.getOriginClass",lec_num);
	}
	@Override
	public int modifyClass(LectureDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.updateClass",dto);
	}
	@Override
	public int modifyClassImg(LectureDataBean dto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().update("Lecture.updateClassImg",dto);
	}
	@Override
	public int modifyClassThumb(LectureDataBean dto) {
		// TODO Auto-generated method stub
		return  SqlMapClient.getSession().update("Lecture.updateClassThumb",dto);
	}
	@Override
	public LecdeDataBean getOriginClassde(int lec_num) {
		return SqlMapClient.getSession().selectOne("Lecture.getOriginClassde",lec_num);
	}
	@Override
	public int modifyClassde(LecdeDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.updateClassDe",dto);
	}
	@Override
	public int checkOriginClassde(int lec_num) {
		return SqlMapClient.getSession().selectOne("Lecture.checkOriginClassde",lec_num);
	}
	@Override
	public int deleteClass(int lec_num) {
		return SqlMapClient.getSession().delete("Lecture.deleteClass",lec_num);
	}
	@Override
	public int deleteDeClass(int lec_num) {
		return SqlMapClient.getSession().delete("Lecture.deleteDeClass",lec_num);
	}
	@Override
	public int inactiveClass(int lec_num) {
		return SqlMapClient.getSession().update("Lecture.updateInactive",lec_num);
	}

	public int modifyMember(LecmemDataBean dto) {
		return SqlMapClient.getSession().update( "Lecture.modifyMember", dto );
	}
	
	public String findId(String tel) {
		return SqlMapClient.getSession().selectOne( "Lecture.findId", tel);
	}
	
	public String findPasswd(LecmemDataBean dto) {
		return SqlMapClient.getSession().selectOne( "Lecture.findPasswd", dto);
	}
	
	@Override
	public int modifyTutorPro(TutorDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.updateTutorPro",dto);
	}

	@Override
	public ReviewDataBean getReview(ReviewDataBean dto) {
		return SqlMapClient.getSession().selectOne("Lecture.getReview",dto);
	}

	@Override
	public List<TuteeLecDataBean> getTuteeClass(String id) {
		return SqlMapClient.getSession().selectList("Lecture.getTuteeClass",id);
	}
	@Override
	public int insertReview(ReviewDataBean dto) {
		return SqlMapClient.getSession().insert("Lecture.insertReview",dto);
	}
	@Override
	public int insertRenum(TuteeDataBean dtt) {
		return SqlMapClient.getSession().update("Lecture.insertRenum",dtt);
	}
	@Override
	public ReviewDataBean getRe(int re_num) {

		return SqlMapClient.getSession().selectOne("Lecture.getRe",re_num);
	}
	@Override
	public int modifyReview(ReviewDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.modifyReview",dto);
	}
	
	

	
	@Override
	public List<LectureDeDataBean> getCategory(String c) {
		return SqlMapClient.getSession().selectList("Lecture.getCategory",c);
	}
	@Override
	public List<LectureDeDataBean> getSearchResult(String p) {
		return SqlMapClient.getSession().selectList("Lecture.getSearchResult",p);
	}
	@Override
	public List<LectureDeDataBean> getInactive() {
		return SqlMapClient.getSession().selectList("Lecture.getInactive");
	}
	@Override
	public List<LectureDeDataBean> getTuteeClassList(String id) {
		return SqlMapClient.getSession().selectList("Lecture.getTuteeClassList", id);
	}
	@Override
	public List<LeclikeDataBean> getLikeList(String id) {
		return SqlMapClient.getSession().selectList("Lecture.getLikeList",id);
	}
	@Override
	public int deleteHeart(LeclikeDataBean dto) {
		return SqlMapClient.getSession().delete("Lecture.deleteHeart",dto);
	} 
	@Override
	public int insertHeart(LeclikeDataBean dto) {
		return SqlMapClient.getSession().insert("Lecture.insertHeart",dto);
	}
	@Override
	public int getNowTutee(int lec_num) {
		return SqlMapClient.getSession().selectOne("Lecture.getNowTutee",lec_num);
	}
	@Override
	public List<TuteememDataBean> getTutee(int lec_num) {
		return SqlMapClient.getSession().selectList("Lecture.getTutee",lec_num);
	}
	@Override
	public List<LectureDeDataBean> getMemberLikeList(String id) {
		return SqlMapClient.getSession().selectList("Lecture.getMemberLikeList",id);
	}
	@Override
	public int deleteReview(int gr) {
		return SqlMapClient.getSession().delete("Lecture.deleteReview",gr);
	}
	@Override
	public int resetTuteeReviewNum(int re_num) {
		return SqlMapClient.getSession().update("Lecture.resetTuteeReviewNum",re_num);
	}
	@Override
	public int getReCount(String id) {
		return SqlMapClient.getSession().selectOne("Lecture.getReCount",id);
	}
	@Override
	public List<ReviewDataBean> getTutorReview(int lec_num) {

		return SqlMapClient.getSession().selectList("Lecture.getTutorReview",lec_num);
	}
	@Override
	public LectureDataBean getLectureId(String id) {
		return SqlMapClient.getSession().selectOne("Lecture.getLectureId",id);
	}
	@Override
	public int insertTutorReview(ReviewDataBean dto) {

		return SqlMapClient.getSession().insert("Lecture.insertTutorReview",dto);
	}

	@Override
	public List<MapDataBean> getClassMapList() {
		return SqlMapClient.getSession().selectList("Lecture.getClassMapList");
	}
	
	@Override
	public int insertRefund(RefundDataBean dto) {
		return SqlMapClient.getSession().insert("Lecture.insertRefund",dto);
	}
	@Override
	public List<RefundDataBean> getMemberRefund(String id) {
		return SqlMapClient.getSession().selectList("Lecture.getMemberRefund",id);
	}
	@Override
	public int checkMemRefund(RefundDataBean dto) {
		return SqlMapClient.getSession().selectOne("Lecture.checkMemRefund",dto);
	}
	@Override
	public List<RefundDataBean> getRefundList() {
		return SqlMapClient.getSession().selectList("Lecture.getRefundList");
	}
	@Override
	public int refundConfirm(RefundDataBean dto) {
		SqlMapClient.getSession().delete("Lecture.deleteTutee",dto);
		return SqlMapClient.getSession().update("Lecture.updateRefund",dto);
	}
	@Override

	public ReviewLecDataBean getTutorObj(int lec_num) {

		return SqlMapClient.getSession().selectOne("Lecture.getTutorObj",lec_num);
	}
	@Override
	public int getGrCount(int gr) {
		return SqlMapClient.getSession().selectOne("Lecture.getGrCount",gr);
	}
	@Override
	public int modifyTutorReview(ReviewDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.modifyTutorReview",dto);
	}


	public int calcLike(int lec_num) {
		return SqlMapClient.getSession().selectOne("Lecture.calcLike",lec_num);
	}
	@Override
	public int changeClass(LectureDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.changeClass",dto);
	}
	@Override
	public List<ReviewDataBean> getReviewAll() {
		return SqlMapClient.getSession().selectList("Lecture.getReviewAll");
	}
	@Override
	public ReviewDataBean getReview(int re_num) {
		return SqlMapClient.getSession().selectOne("Lecture.getReviewOne",re_num);
	}
	@Override
	public int KidCheck(String id) {
		return SqlMapClient.getSession().selectOne("Lecture.KidCheck",id);
	}
	@Override
	public int insertKmem(LecmemDataBean dto) {
		int count =SqlMapClient.getSession().insert("Lecture.insertKmem",dto);
		int result = 0;
		if(count !=0) {
			result = 1;
		} else {
		 result = 0;	
		}
	return result;
	}
	@Override
	public void deleteAdminReview(int re_num) {
		SqlMapClient.getSession().delete("Lecture.deleteAdminReview",re_num);
		
	}
	@Override
	public int deleteReReview(RefundDataBean dto) {		
	int gr_num=SqlMapClient.getSession().selectOne("Lecture.findReReview",dto);
	return SqlMapClient.getSession().delete("Lecture.deleteReReview",gr_num);
	}
	@Override
	public WalletDataBean getWallet(String id) {
		return SqlMapClient.getSession().selectOne("Lecture.getWallet",id);
	} 
	@Override
	public int createWallet(String id) {
		return SqlMapClient.getSession().update("Lecture.createWallet",id);
	}
	@Override
	public int insertInit(WalletDataBean dto) {
		return SqlMapClient.getSession().insert( "Lecture.insertInit", dto );
	}
	@Override
	public int updateWalletAddr(WalletDataBean dto) {
		return SqlMapClient.getSession().insert( "Lecture.updateWalletAddr", dto );
	}
	@Override
	public int updateCash(WalletDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.updateCash",dto);
	}
	@Override
	public int updateCoin(WalletDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.updateCoin",dto);
	}
	@Override
	public WalletDataBean getAdminWallet() {
		return SqlMapClient.getSession().selectOne("Lecture.getAdminWallet");
	}
	@Override
	public int updateAdminCoin(WalletDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.updateAdminCoin",dto);
	}
	@Override
	public List<WalletChargeDataBean> getChargeReq() {
		return SqlMapClient.getSession().selectList("Lecture.getChargeReq");
	}
	@Override
	public int insertReq(ReqChargeDataBean dto) {
		return SqlMapClient.getSession().insert("Lecture.insertReq", dto);
	}
	@Override
	public int updateStat(int req_no) {
		return SqlMapClient.getSession().update("Lecture.updateStat",req_no);
	}
	@Override
	public int insertTx(TxDataBean dto) {
		return SqlMapClient.getSession().insert("Lecture.insertTx", dto);
	}
	@Override
	public TxDataBean getTxInfo(String id) {
		return SqlMapClient.getSession().selectOne("Lecture.getTxInfo",id);
	}
	@Override
	public String getBuyerAddr(String id) {
		return SqlMapClient.getSession().selectOne("Lecture.getBuyerAddr",id);
	} 
	@Override
	public String getSellerAddr() {
		return SqlMapClient.getSession().selectOne("Lecture.getSellerAddr");
	} 
	@Override
	public String getLastCharge() {
		return SqlMapClient.getSession().selectOne("Lecture.getLastCharge");
	}
	@Override
	public TxDataBean getLastTx() {
		return SqlMapClient.getSession().selectOne("Lecture.getLastTx");
	}
	@Override
	public int updateTx(TxDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.updateTx",dto);
	}
	@Override
	public int updateAcc(WalletDataBean dto) {
		return SqlMapClient.getSession().update("Lecture.updateAcc",dto);
	}
	@Override
	public List<TxDataBean> getDashBoard() {
		return SqlMapClient.getSession().selectList("Lecture.getDashBoard");
	}
}

package lecture;

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
import review.ReviewDataBean;
import reviewlec.ReviewLecDataBean;
import tutor.TutorDataBean;
import wallet.WalletDataBean;
import reqcharge.ReqChargeDataBean;
import walletcharge.WalletChargeDataBean;
import tx.TxDataBean;

public interface LectureDao {
	public int createClass(LectureDataBean dto);
	public int deleteMember( String id );
	
	
	public int insertMember( LecmemDataBean dto );
	public int insertTutee(TuteeDataBean dto);
	
	public int check(String id,String passwd);
	public int check(String id);
	public LecmemDataBean getMember(String id);
	public List<MemDataBean> getMemberAll();

	public TutorDataBean getTutor(String id);
	public int modifyTutor(TutorDataBean dto);
	public int insertTutor(TutorDataBean dto);
	public int tutorCheck(String id);
	public LectureDataBean getLecture(int lec_num);
	public List<LectureDeDataBean> getClassList();
	public List<LectureDeDataBean> getClassListAll();
	public List<LecdelikeDataBean> getClassLikeList(String id);

	public LecdeDataBean getLecde(int lec_num);
	public int calcMonth(int lec_num);
	public int calcMaxCost(LecdeDataBean dto,int month);
	public int calcDays(int lec_num);
	
	public int getCreateTutor(String id);
	public int getLecNum();
	
	public int modifyReview(ReviewDataBean dto);
	public int insertReview(ReviewDataBean dto);
	public ReviewDataBean getReview(ReviewDataBean dto); 
	public ReviewDataBean getRe(int re_num); 
	public int deleteReview(int gr);
	public int resetTuteeReviewNum(int re_num);
	
	public int finClass(int lec_num);
	public int createFinClass(int lec_num);
	public int createClass2(LecdeDataBean dto);
	
	public int getReCount(String id);
	
	public int insertRenum(TuteeDataBean dtt);

	public String findId(String tel);
	public String findPasswd(LecmemDataBean dto);

	
	public List<LectureDeDataBean> getTutorClass(String id);
	public List<TuteeLecDataBean> getTuteeClass(String id);
	public LectureDataBean getOriginClass(int lec_num);
	public int modifyClass(LectureDataBean dto);
	public int modifyClassImg(LectureDataBean dto);
	public int modifyClassThumb(LectureDataBean dto);
	public LecdeDataBean getOriginClassde(int lec_num);
	public int modifyClassde(LecdeDataBean dto);
	public int checkOriginClassde(int lec_num);
	public int deleteClass(int lec_num);
	public int deleteDeClass(int lec_num);
	public int inactiveClass(int lec_num);

	public int modifyMember( LecmemDataBean dto );
	public int modifyTutorPro(TutorDataBean dto);
	
	
	
	public List<LectureDeDataBean> getCategory(String c);
	public List<LectureDeDataBean> getSearchResult(String p);
	public List<LectureDeDataBean> getInactive();
	public List<LectureDeDataBean> getTuteeClassList(String id);
	public LectureDataBean getLectureId(String id);
	public int insertTutorReview(ReviewDataBean dto);
	public ReviewLecDataBean getTutorObj(int lec_num);
	public int getGrCount(int gr);
	public int modifyTutorReview(ReviewDataBean dto);
	
	public int deleteReReview(RefundDataBean dto);
	public List<LeclikeDataBean> getLikeList(String id);
	public int deleteHeart(LeclikeDataBean dto);
	public int insertHeart(LeclikeDataBean dto);
	public int getNowTutee(int lec_num);
	public List<TuteememDataBean> getTutee(int lec_num);
	public List<LectureDeDataBean> getMemberLikeList(String id);

	public List<ReviewDataBean> getTutorReview(int lec_num);
	public List<MapDataBean> getClassMapList();
	
	public int insertRefund(RefundDataBean dto);
	public List<RefundDataBean> getMemberRefund(String id);
	public int checkMemRefund(RefundDataBean dto);
	public List<RefundDataBean> getRefundList();
	public int refundConfirm(RefundDataBean dto);
	public int calcLike(int lec_num);
	
	public List<LectureDeDataBean> getClassConfirm();
	public int changeClass(LectureDataBean dto);

	
	public int KidCheck(String id);
	public int insertKmem(LecmemDataBean dto);

	public List<ReviewDataBean> getReviewAll();
	public ReviewDataBean getReview(int re_num);
	public void deleteAdminReview(int re_num);
	
	// about wallet
	public WalletDataBean getWallet(String id);
	public int createWallet(String id);
	public int insertInit(WalletDataBean dto);
	public int updateWalletAddr(WalletDataBean dto);
	public int updateCash(WalletDataBean dto);
	public int updateCoin(WalletDataBean dto);
	public WalletDataBean getAdminWallet();
	public int updateAdminCoin(WalletDataBean dto);
	public List<WalletChargeDataBean> getChargeReq();
	public int insertReq(ReqChargeDataBean dto);
	public int updateStat(int req_no);
	public int insertTx(TxDataBean dto);
	public TxDataBean getTxInfo(String id);
	public String getBuyerAddr(String id);
	public String getSellerAddr();
	public String getLastCharge();
	public TxDataBean getLastTx();
	public int updateTx(TxDataBean dto);
	public int updateAcc(WalletDataBean dto);
	public List<TxDataBean> getDashBoard();
}

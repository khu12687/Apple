package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.model.Member;

public interface MemberDao {

	void insert(Member member);

	Member loginCheck(Member member);

	int checkId(String id);

	Member checkPhone(Member member);

	void changePw(Member member);

	Member checkPhonetoId(Member member);

	

	

}

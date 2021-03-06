package sr.attend.service;

import java.util.List;

import sr.attend.model.AttenDTO;

public interface AttenService {
	//전체강의목록
	public List<AttenDTO> allList()throws Exception;
	
	//출석부 입력
	public void attenInsert(AttenDTO dto)throws Exception;
	
	//강의번호에 맞는 id조회
	public List<AttenDTO> idList(int n)throws Exception;

	//출석체크
	public void attenCheck(AttenDTO dto)throws Exception;
	
}

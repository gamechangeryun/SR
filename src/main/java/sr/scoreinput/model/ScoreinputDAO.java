package sr.scoreinput.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component("scoreinputDAO")
public class ScoreinputDAO extends SqlSessionDaoSupport{
	//리스트
	public List<ScoreinputDTO> allList()throws Exception{
		return getSqlSession().selectList("scoreinputMapper.allList");
	}
	//학생목록
	public List<ScoreinputDTO> snameList(String snum)throws Exception{
		return getSqlSession().selectList("scoreinputMapper.sname", snum);
	}
	//성적입력
	public void inputScore(ScoreinputDTO dto)throws Exception{
		getSqlSession().update("scoreinputMapper.inputscore", dto);
	}
		
}

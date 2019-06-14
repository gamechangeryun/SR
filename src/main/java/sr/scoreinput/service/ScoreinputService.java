package sr.scoreinput.service;

import java.util.List;

import sr.scoreinput.model.ScoreinputDTO;
import sr.scoreinput.model.ScoreinputDtoList;

public interface ScoreinputService {

	public List<ScoreinputDTO> allList()throws Exception;
	
	public List<ScoreinputDTO> snameList(String snum)throws Exception;
	
	public void inputScore(ScoreinputDTO list)throws Exception;
}

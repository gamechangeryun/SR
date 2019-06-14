package sr.scoreinput.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import net.sf.json.JSONObject;
import sr.scoreinput.model.ScoreinputDTO;
import sr.scoreinput.model.ScoreinputDtoList;
import sr.scoreinput.service.ScoreinputService;

@Controller
public class ScoreinputController {

	@Autowired
	ScoreinputService service;

	public void setService(ScoreinputService service) {
		this.service = service;
	}
	
	//시작
	@RequestMapping("/scoreinput/scoreinputMain.do")
	public String proscoreinputMain()throws Exception{
		//System.out.println("시작화면진입확인");
		return "scoreinput/scoreinputMain";
	}
	
	//강의리스트
	@RequestMapping(value="/scoreinput/scoreinputlectrueList.do", method=RequestMethod.POST)
	public void lectureList(HttpServletResponse resp)throws Exception{
		List<ScoreinputDTO> list = service.allList();
		resp.setContentType("text/html; charset=UTF-8");
		//System.out.println("강의리스트 ::" +list);
		
		JSONObject jso = new JSONObject();
		jso.put("data", list);
		
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
	}
	
	//학생이름순
	@RequestMapping(value = "/scoreinput/scoreinputList.do", method = RequestMethod.POST, produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String cityList(HttpServletResponse resp, @RequestParam("snum")String snum)throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println("sname::"+snum);
		List<ScoreinputDTO> list = service.snameList(snum);
		
		JSONObject jso = new JSONObject();
		jso.put("data1", list);
		
		return jso.toString();
	}
	
	//성적입력
	@RequestMapping(value="/scoreinput/scoreInput.do",method = RequestMethod.POST)
	@ResponseBody
	public String inputScore(HttpServletResponse resp,HttpServletRequest res, ScoreinputDtoList dto)throws Exception{
		
		List<ScoreinputDTO> l = dto.getScoreinputDtoList();
		for(ScoreinputDTO dt : l) {
			System.out.println(dt);
			service.inputScore(dt);
		}
		
		return "success";
	}
}

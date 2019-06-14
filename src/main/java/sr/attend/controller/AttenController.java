package sr.attend.controller;

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
import sr.attend.model.AttenDTO;
import sr.attend.model.AttenListDTO;
import sr.attend.service.AttenService;
import sr.scoreinput.model.ScoreinputDTO;
import sr.scoreinput.model.ScoreinputDtoList;

@Controller
public class AttenController {

	@Autowired
	private AttenService service;

	public void setService(AttenService service) {
		this.service = service;
	}
	
	//출석관리 메인화면
	@RequestMapping("/atten/attenMain.do")
	public String attenMain()throws Exception{
		
		return "atten/attenMain";
	}
	
	//출석부입력폼이동
	@RequestMapping("/atten/attenInsertForm.do")
	public String attenInsertForm()throws Exception{
		return "atten/attenInsertForm";
	}
	
	//출석부입력처리
	@RequestMapping("/atten/attenInsertPro.do")
	public String attenInsert(AttenDTO dto)throws Exception{
		
		service.attenInsert(dto);
		
		return "redirect:attenMain.do";
	}
	
	//학과조회리스트
	@RequestMapping(value="/atten/attenList.do", method=RequestMethod.POST)
	public void attenList(HttpServletResponse resp)throws Exception{
		List<AttenDTO> list = service.allList();
		
		resp.setContentType("text/html; charset=UTF-8");
		
		JSONObject jso = new JSONObject();
		jso.put("data", list);
		
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
	}
	
	//강의번호에 맞는 id리스트
	@RequestMapping("/atten/attenIDList")
	public void attenIdList(@RequestParam("lecture_num") int lecture_num,@RequestParam("day") String day ,HttpServletResponse resp)throws Exception{
		System.out.println("데이::"+day);
		List<AttenDTO> list = service.idList(lecture_num);
		resp.setContentType("text/html; charset=UTF-8");
		
		JSONObject jso = new JSONObject();
		jso.put("data", list);
		
		PrintWriter out = resp.getWriter();
		out.println(jso.toString());
	}
	
	//출석 입력
	@RequestMapping(value="/atten/attenCheck.do",method = RequestMethod.POST)
	@ResponseBody
	public void inputScore(HttpServletResponse resp,HttpServletRequest res, AttenListDTO attenlist)throws Exception{
		
		
		List<AttenDTO> l = attenlist.getAttenListDTO();
		for(AttenDTO dt : l) {
			System.out.println("출석for문::"+dt);
			service.attenCheck(dt);
			
			/*String day = dt.getDay();
			
			for(int i=1; i<32; i++) {
				if(day.equals("day"+i)) {
					System.out.println("day"+i);
					
					
				}
			}*/
		}
	}
}

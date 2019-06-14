package sr.scoreinput.model;

import java.util.List;

public class ScoreinputDTO {
	private int lecture_num;
	private int id;
	private String name;
	//private int studentnum;
	//private String student_name;
	private int score;
	List<ScoreinputDTO> list;
	
	public ScoreinputDTO() {
	}

	public int getLecture_num() {
		return lecture_num;
	}

	public void setLecture_num(int lecture_num) {
		this.lecture_num = lecture_num;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public List<ScoreinputDTO> getList() {
		return list;
	}

	public void setList(List<ScoreinputDTO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ScoreinputDTO [lecture_num=" + lecture_num + ", id=" + id + ", name=" + name + ", score=" + score + "]";
	}
	
	
}

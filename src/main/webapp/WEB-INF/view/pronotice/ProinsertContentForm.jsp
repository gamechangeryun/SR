<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title>글 작성</title>
<script>
	function checkIt(){
		var myform = eval("document.myform");
		
		if(!myform.title.value){
			alert("글제목을 입력하세요");
			return false;
		}

		if(!myform.content.value){
			alert("글내용을 입력하세요");
			return false;
		}
		
		if(!myform.lecture_num.value){
			alert("강의번호를 입력하세요");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form name="myform" action="/SR_mtmt/ProinsertContent.do" method="post" onsubmit="return checkIt()">
		<input type="hidden" name="id" value="${nowId }">
		<input type="hidden" name="readcount" value="0">
		<table border="1">
				<tr>
					<td>글제목</td> 
					<td><input type="text" name="title"></td>
					<td>강의번호</td>
					<td><input type="number" name="lecture_num" /></td>
					<td>
						<select name="isnotice">
							<option value="0" selected="selected">일반글</option>
							<option value="1">중요글</option>
						</select>
					</td>
				</tr>   

				<tr>
					<td><h5>글내용작성</h5></td>
					<td colspan="4"><textarea rows="20" cols="100" name="content" ></textarea></td>
				</tr>
				
				<tr>
					<td colspan="5">
						<input type="button" value="목록으로" onclick="location.href='/SR_mtmt/PronoticeboardMain.do'">
						<input type="submit" value="작성완료">
					</td>
				</tr>
		</table>
	</form>
</body>
</html>
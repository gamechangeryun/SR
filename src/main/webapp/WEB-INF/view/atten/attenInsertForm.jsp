<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String cp = request.getContextPath(); //첫번째 경로를 가져온다
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>출석부입력</title>
<script>
	function checkIt(){
		var myform = eval("document.myform");
		
		if(!myform.lecture_num.value){
			alert("강의번호를 입력하세요");
			return false;
		}
		
		if(!myform.id.value){
			alert("학번을 입력하세요");
			return false;
		}
		
		if(!myform.max_checkin.value){
			alert("최대출석일을 입력하세요");
			return false;
		}
		
		if(!myform.now_checkin.value){
			alert("현재출석일을 입력하세요")
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
<div class="container">
	<form name="myform" action="<%=cp%>/atten/attenInsertPro.do" method="post" onsubmit="return checkIt()">
		
		<div class="form-group">
			<label for="title">강의번호</label>
			<input type="text" class="form-control" id="lecture_num" name="lecture_num">
		</div>
		<div class="form-group">
			<label for="id">학번</label>
			<input type="text" class="form-control" id="id" name="id">
		</div>
		<div class="form-group">
			<label for="maxpeople">최대출석일</label>
			<input type="number" class="form-control" min="1" max="31" id="max_checkin" name="max_checkin">
		</div>
		<div class="form-group">
			<label for="maxpeople">현재출석일</label>
			<input type="number" class="form-control" min="0" max="31" id="now_checkin" name="now_checkin">
		</div>
		<br>
		<div class="form-group">
			<input type="submit" class="btn btn-info btn-xs" value="작성완료">
			<input type="button" class="btn btn-info btn-xs" value="처음화면으로" onclick="location.href='<%=cp%>/atten/attenMain.do'">
		</div>
		
	</form>
</div>
	
	<%@ include file="bootstrap.jsp" %>
</body>
</html>
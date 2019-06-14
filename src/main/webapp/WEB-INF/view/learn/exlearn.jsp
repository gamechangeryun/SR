<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>학습목차</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
p { margin:20px 0px; }
</style>
</head>
  <body>
    <div class="container">
    	<button id="insertbtn">목차입력</button>
      <div class="row">
    	<!--목차 입력칸 생성 및 바로 입력  -->
    	<form name="insertForm" id="insertForm" action="/SR_mtmt/learn/LearnInsert.do" method="post" onsubmit="return checkIt()">
    	<span id="insert"></span>
    	</form>
    	<!--목차 입력 끝  -->
    	
    	<!--DB에 내용 없으면  -->    
		<c:if test="${mainList.size() == 0 }">
			<p> 내용이 없습니다. </p>
		</c:if>
	
		<!--DB에 내용 있으면  -->
		<c:if test="${mainList.size() > 0 }">	        
	        <c:forEach var="item" items="${mainList }">
		        <div class="col-6">
		        	<p></p>
		          <div class="card">
		            <div class="card-header">
		              <span>${item.week }</span>
		            </div>
		            <!-- <img src="images/card-image.png" alt="" /> -->
		            <div class="card-body">
		            <div class="dis">
		              <h5 class="card-title">${item.subject_title }</h5>
		              <div>
		              	<form id="nowMaxForm">
		              	<span class="meter">
		              	진행단계 : 
		              	<meter min="${item.now_study }" max="${item.max_study }"  value="${item.now_study }"></meter>
		              	${item.now_study }/${item.max_study }
		              	<button class="add">증가</button>
		              	<button class="dis">감소</button>
		              	</span>
		              	</form>
		              </div>
		              <p class="card-text">
		              <form id="closeForm" name="closeForm" action="/SR_mtmt/learn/learnDelete.do?" method="post">
			              <input type="hidden" id="lecture_num" name="lecture_num" value="${item.lecture_num}"/> 
			              <input type="hidden" id="week" name="week" value="${item.week}"/> 
		              	  <input type="submit" name="closeSubmit" class="btn btn-primary" value="종료">
		              </form>
		             </div>
		            </div>
		          </div>
		        </div>
	        </c:forEach>
		</c:if>        
        
      </div><!--row  -->
    </div><!--container  -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>

//종료
$("input:submit[name=closeSubmit]").click(function(){
	
	if(confirm("종료하시겠습니까?")){
		return true;
	}
	return false;
});
/* function close(){
	
} */

$(document).ready(function(){
	$(".add").click(function(){
		$(this).on("click", addNow);
	});
});

$(document).ready(function(){
	$(".add").click(function(){
		$(this).on("click", addNow);
	});
});

//단계증가
function addNow(now_study){
   
	var n=now_study;
	n += 1;
	
	$.ajax({
        type:'POST',
        url : "<c:url value='/learn/addNow.do'/>",
        data:{'lecture_num' : lecture_num, 'week' : week, 'now_study' : now_study},
        success : function(data){
            if(data=="success")
            {
            	alert("증가 완료");
            }
        },
        error:function(request,status,error){
       }
    });
	
}

//단계감소
function nowDelete(now_study){
	var n=now_study;
	n -= 1;
	
	$.ajax({
		type : 'POST',
		url : "<c:url value='/learn/deleteNow.do'/>",
		data : {'lecture_num' : lecture_num, 'week' : week, 'now_study' : now_study},
		success : function(data){
			if(data=="success")
			alert("감소 완료");
		}
	});
}



//목차입력빈칸확입
function checkIt(){
	var myform = eval("document.insertForm");
	
	if(!myform.lecture_num.value){
		alert("강의번호를 입력하세요");
		return false;
	}
	
	if(!myform.subject_title.value){
		alert("학습제목을 입력하세요");
		return false;
	}
	
	if(!myform.week.value){
		alert("주차를 입력하세요");
		return false;
	}
	
	if(!myform.max_study.value){
		alert("최대학습량을 입력하세요")
		return false;
	}
	
	if(!myform.now_study.value){
		alert("현재학습량을 입력하세요")
		return false;
	}
	
	return true;
}

$("#insertbtn").click(function(){
	var str = '';

	str += '<div>';
	str += '<span>강의번호 :<input type="number" name="lecture_num"/></span>';
	str += '<span>주 차 :<input type="text" name="week"></span>';
	str += '<span>학습제목 :<input type="text" name="subject_title"></span>';
	str += '<span>최대학습량<input type="number" name="max_study"></span>';
	str += '<span>현재학습량<input type="number" name="now_study"></span>';
	str += '<input type="submit" id="inputinsert" value="등록">';
	str += '</div>';
	
	$("#insert").html(str);
});


//현재페이지불러오기
function getList(){
	$.ajax({
		type : "GET",
		url : "<c:url value='/learn/LearnMain.do'/>",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(args){
        },
        error:function(request,status,error){
        }
	});
}

//글입력폼생성



//전체목록 불러오는 메서드
/* $(function(){
	getnowList();
});

function getnowList(){
	$.ajax({
		trpe : 'GET',
		url : "<c:url value='/learn/LearnList.do'/>",
		data : $("myform").serialize(),
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(args){
			var now = args.data.length;	//현재 단계
			
			var html ="";
			
			/* html += "<div>";
            html += "<input type='hidden' id='now_study' name='now_study' value="+now_study+">";
            html += "</div>";
            
            $("#now").html(now);
		}
	});
}*/

</script>	
</body>
</html>
























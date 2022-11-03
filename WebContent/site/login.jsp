<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	.container-fluid{
		width:40%;
		margin:30%;
	}
	.row{
		border:4px solid lightgray;
		padding:10px;
	}
</style>
</head>
<body>

<a href="/Join.do"></a>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-12"><input id="userId" class="form-control"></div>
			<div class="col-xl-12"><input id="userPw" type="password" class="form-control"></div>
			<div class="col-xl-12">
				<input id="loginBtn" type="button" value="로그인" class="btn btn-success col-xs-12">
			</div>
			<div class="col-xl-12"><a href="/Join.do">회원가입하기</a></div>
		</div>
	</div>
</body>

<script>

	// id=loginBtn인 버튼에 클릭이벤트를 부여
	// 이벤트 실행시 ajax통신으로 loadTest.jsp의 결과를 받아 콘솔에 찍기
	// loadTest.jsp경로 => 1027 폴더 참고
  
	var v_btn = document.querySelector('#loginBtn');
    v_btn.addEventListener('click',function(){
    	
    	var v_uId = document.querySelector('#userId').value;
    	var v_uPw = document.querySelector('#userPw').value;
     	// JSP에서 백틱을 사용해서 변수처리기호 사용시 적용안됌! 주석에서도 쓰면 안된다.
    	var data = "userId=" + v_uId + "&userPw=" + v_uPw;
    	
    	console.log(v_uId);
    	console.log(v_uPw);
    	console.log(data);
		
    	var req = new XMLHttpRequest();
    	req.open('post','../1027/load.jsp',true);
    	req.onreadystatechange = function(){
    		if(req.readyState == 4 && req.status == 200){
    			var jsObj = JSON.parse(req.responseText);
    			if(jsObj.rst == "ok"){
    				// 성공시 페이지 이동
    				location.replace("/index.do");
    			}else{
    				// 실패시 현재페이지 머무르기..
    				location.reload();
    			}
    		}
    	}
    	req.setRequestHeader('content-type','application/x-www-form-urlencoded');
    	req.send(data);
    	
    });

</script>
</html>
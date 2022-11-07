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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/3.2.1/jquery.serializejson.min.js"></script>


</head>
<body>

<%--	

	정규식패턴을 적용해서 validataion체크

	정규식 regular expressions (regex) 패턴
	: 정해진 규칙을 이용해 텍스트에서 정보를 추출하는 패턴

 --%>

	<%-- id중복체크, 주소api적용, 정규식패턴을 적용해서 valiatiaion체크.. --%>
	<div class="col-sm-8">
	  <h4>회원가입</h4>
	  <hr>
	  <form class="form-horizontal" method="post" onsubmit="return valid();"> <%-- return false는 submit 했을 때 이동하는걸 막아준다. --%>
	    <div class="form-group">
	      <label for="id" class="control-label col-sm-2">아이디</label>
	      <span class="sp"></span>
	      <%-- 시작문자는 갯수범위에 포함하지 않음 --%>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="id" placeholder="Enter id" name="mem_id" required pattern="[a-zA-Z][a-zA-Z0-9]{3,7}"> <%-- 필수 입력을 입력하고 넘어가게 지정됨 --%>
	        <%-- [a-zA-Z][a-zA-Z0-9] : 첫자는 무조건 영문으로 그 이후에는 영문과 숫자로 이루어진 3~7글자 --%>
	      </div>
	      <div class="col-sm-6" style="text-align: left;">
            <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button>
            <span id="disp"></span>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="pass" class="control-label col-sm-2">비밀번호</label>
	      <%-- 임의문자(.)를 대상으로 최소 갯수(*?)의 패턴을 찾음 --%>
	      <%-- required pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|].{8,12})" --%>
	      <div class="col-sm-4">
	        <input type="password" class="form-control" id="pass" name="mem_pass" >
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="name" class="control-label col-sm-2">이름</label>
	      <span class="sp"></span>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="name" name="mem_name" required pattern="[가-힣]{2,8}">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="bir" class="control-label col-sm-2">생년월일</label>
	      <div class="col-sm-4">
	        <input type="date" class="form-control" id="bir" name="mem_bir" required>
	        <span class="sp"></span>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="hp" class="control-label col-sm-2">연락처</label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="hp" name="mem_hp" placeholder="010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
	      </div>
	      <span class="sp"></span>
	    </div>
	    
	    <div class="form-group">
	      <label for="mail" class="control-label col-sm-2">이메일</label>
	      <div class="col-sm-4">
	      	<%-- 1004angle@a.co.kr --%>
	        <input type="email" class="form-control" id="mail" name="mem_mail" pattern="[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}">
	      </div>
	      <span class="sp"></span>
	    </div>
	    
	    <div class="form-group">
	      <label for="add1" class="control-label col-sm-2">우편번호</label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="postAddr" name="mem_zip" required>
	      </div>
	      <div class="col-sm-2">
	        <button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="add1" class="control-label col-sm-2" required>주소</label>
	      <div class="col-sm-6">
	        <input type="text" class="form-control" id="addr1" name="mem_add1">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="add2" class="control-label col-sm-2" required>상세주소</label>
	      <div class="col-sm-6">
	        <input type="text" class="form-control" id="addr2" name="mem_add2">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-6">
	        <button class="btn btn-default">가입하기</button>
	        <span id="joinspan"></span>
	      </div>
	    </div>
	  </form>
	</div>
	
<script>
	
	$('#idChk').on('click',function(){
	//$('#id').on('keyup',function(){});	
		var v_id = $('#id').val()
		var v_disp = $('#disp');
		v_disp.text("");
		
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/site/idCheck.jsp',
			data:{userId : v_id.trim()},
			dataType:'json', // 자동 파싱 해준다.
			success:function(rst){
				if(rst.code == "ok"){ 
					v_disp.text(rst.msg);
				}else{					
					v_disp.text(rst.msg);
				}
			},
			error:function(xhr){
				alert(xhr.status);
			}
		});
		
	});
	
	$('#addrBtn').on('click',function(){
		
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postAddr').value = data.zonecode;
                document.getElementById("addr1").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
        
	});
	
	function valid(){
		
		event.preventDefault(); // submit의 기본 기능(=어딘가로 보내려고하는..)차단
		
		// 데이터를 받아와서 ajax로 insert로 서버에 전송(insert)
		
		// 이전 방식으로는 각 필드의 데이터를 변수에 담아서 처리하는 번거로움이 있음
		// var v_id = $('#id').val();
		// var v_pw = $('#pw').val();
		// var v_nm = $('#nm').val();
		// var v_hp = $('#hp').val();
		// var data = "id=" + v_id + "&px=" +  v_pw ....
		// 위를 해결하고자 jQuery에서 제공하는 serialize()를 사용한다.
		
		
		/*
			ajax로 데이터를 보낼 때 서버가 이해할 수 있는 방식으로 데이터 형식을 변환해야 함
			이때 객체를 직렬화하여 데이터를 하나의 덩어리로 전송한다.
			직렬화(Obj => JSON): 자바 내부에서 사용하는 객체 또는 데이터를 외부에서 사용 가능한 byte형태로 변환하는 기술(serializing, marshal, stringify)
			역직렬화(JSON => Obj): byte로 변환된 데이터를 원래의 객체 또는 데이터로 변환하는 기술 (deserializing, unmarshal, parse)
		*/
		
		// var v_data = $('form').serialize();  // urlencoded형식 (key=value&k=v...)
		// var v_data = $('form').serializeArray(); // object array형식([{},{},...])
		var v_data = $('form').serializeJSON(); // json object
		
		
		console.log("직렬화된 데이터 >> " ,v_data);
		
		$.ajax({
			type: 'post',
			url: '<%=request.getContextPath()%>/site/member_json.jsp',
			// 제이쿼리가 아닌 자바스크립트(XHR객체사용)로 AJAX통신시 요청데이터에 컨텐츠타입을 꼭 명시해야 하지만,
			// 제이쿼리는 자동으로 해줌으로 행략가능
			// content-type: 'application/x-www-urlencoded', 
			// data: v_data, // serialize() 사용시 넘겨주는 데이터
			data: JSON.stringify(v_data), // serializeArray() 사용시 데이터 직렬화 필요
			dataType: 'json',
			success:function(rst){
				console.log(rst);
				if(rst == 1){
					alert("가입 성공했습니다.");
					location.href = "<%=request.getContextPath()%>/site/login.jsp";
					$('#joinspan').text("가입성공").css('color','blue');
				}else{					
					$('#joinspan').text("가입실패").css('color','red');
				}
			},
			error:function(xhr){
				alert("상태: " + xhr.status);
			}
		});
		
	}
	

	
</script>

</body>
</html>
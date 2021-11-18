<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
	font-weight: 900; 
	color: black;
}
#passwordCheck, #password{
	margin-top: 10px; 
	width: 350px; 
	height: 45px; 
	border-radius: 5px; 
	border-color: #cccccc;
	background: transparent;
}
</style>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="http://code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="/resources/javascript/regist.js"></script>
<script>
function back(){
	location.href="appleid";
}

</script>
</head>
<body>
<!-- 모달창 -->
    <div class="modal fade" id="defaultModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">알림</h4>
                </div>
                <div class="modal-body">
                    <p class="modal-contents"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!--// 모달창 -->

	<h1 style="margin-top: 4%;">Apple ID</h1>
	<hr>
	<div style="margin-left: 20%; margin-top: 100px;">
		<ul style="display: flex;">
			<li>
				<form method="post" action="/member/changePw" id="pwForm">
					<h2>새 Apple ID 암호를 선택하십시오.</h2>
					<div style="margin-top: 50px;"><h3>Apple ID: ${member.id }</h3></div>
					<input type="hidden" name="id" value="${member.id}">
     	          	
     	           <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label"></label>
                    <div class="col-lg-10">
                        <input type="password" name="password" class="form-control" id="password"  data-rule-required="true" placeholder="새로운 암호" maxlength="30">
                    </div>
              	  </div>
              	  <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label"></label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="암호 확인" maxlength="30">
                    </div>
              	  </div>
                
					<input type="button" value="취소" onclick="back();">
					<input type="submit" value="계속" style="margin-left: 1%;">
				</form>			
			</li>
		</ul>	
	</div>
	<div style="margin-top: 200px;">
		<hr>
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>
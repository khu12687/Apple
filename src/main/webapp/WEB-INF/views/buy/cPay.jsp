<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="http://code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="/resources/javascript/regist.js"></script>

</head>
<body>
<div style="width: 100%; height: 70px;"></div>
<hr>
<div class="container"><!-- 좌우측의 공간 확보 -->
	<div class="form-group">
		<span>결제 </span>
		<span style="text-align: right; width: 100%">${totalPrice}원</span>
	</div>
	<img src="/resources/images/pDelivery.png">
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
     <hr/>
     <!-- 본문 들어가는 부분 -->
	 <form class="form-horizontal" role="form" method="post" action="cPayStep2">
	<div class="form-group" id="divName">
	     <label for="inputName" class="col-lg-2 control-label">이름</label>
	     <div class="col-lg-10">
	         <input type="text" name="nm_name" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
	     </div>
	 </div>
	 
	<div class="form-group" id="divEmail">
	     <label for="inputEmail" class="col-lg-2 control-label">주소</label>
	     <div class="col-lg-10">
	         <input type="text" name="nm_address" class="form-control" id="address" data-rule-required="true" placeholder="주소" maxlength="40">
	     </div>
	</div>
	 
	<div class="form-group" id="divEmail">
	     <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
	     <div class="col-lg-10">
	         <input type="email" name="nm_email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="40">
	     </div>
	</div>
	<div class="form-group" id="divPhoneNumber">
	     <label for="inputPhoneNumber" class="col-lg-2 control-label">전화번호</label>
	     <div class="col-lg-10">
	         <input type="tel" name="nm_phone" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
	     </div>
	</div>
    <div class="form-group">
       <div class="col-lg-offset-2 col-lg-10">
           <button type="submit" class="btn btn-primary">결제 페이지로 이동</button>
       </div>
   	</div>
   	</form>
</div>
	<div style="margin-top: 10%;">
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>
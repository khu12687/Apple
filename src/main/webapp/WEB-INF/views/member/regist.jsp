<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>regist</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
header{
	position: relative;
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

function check_id_Async() {
	const form = document.getElementById("signup_form");
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		
		if(xhr.readyState == XMLHttpRequest.DONE) {
			if(xhr.status == 200) {
				const result = xhr.responseText;
				
				if(result == "OK") {
					alert(` \${form.id.value} 는 사용가능한 아이디 입니다`);
					form.checkId.value = form.id.value;
				} else
					alert(` \${form.id.value} 는 이미 사용중인 아이디 입니다`);			
			}
		}
	}

	xhr.open("GET", `checkId?id=\${form.id.value}`, true);
	
	xhr.send();
}

</script>
</head>
<body>
	<h1 style="margin-top: 2%;">Apple ID</h1>
	<div>
		<img src="/resources/images/apple-id.png" width="100%" >
	</div>
	<div class="container"><!-- 좌우측의 공간 확보 -->
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
            <form class="form-horizontal" role="form" method="post" id="signup_form">
            	<input type="hidden" id="checkId">
                <div class="form-group">
                    <label for="provision" class="col-lg-2 control-label">회원가입약관</label>
                    <div class="col-lg-10" id="provision">
                        <textarea class="form-control" rows="8" style="resize:none">약관동의
							Apple 개인정보 처리방침은 Apple이 고객의 개인 데이터를 수집, 사용 및 공유하는 방법을 설명합니다.
							개인정보 처리방침과 더불어, Apple은 고객의 개인 정보를 사용할 수 있도록 요청하는 Apple 제품 및 특정 기능에 저장된 데이터 및 개인 정보를 제공합니다. 이 제품별 정보에는 데이터 및 개인 정보 보호 아이콘이 표시됩니다.
							이러한 기능을 사용하기 전에 이 제품별 정보를 검토할 수 있는 기회가 제공됩니다. 또한 언제든지 해당 기능에 관련된 설정 및/또는 apple.com/kr/legal/privacy에서 온라인으로 이 정보를 확인할 수 있습니다.
							잠시 시간을 내어 아래의 제목을 통해 접근 가능한 Apple의 개인정보 처리방침을 숙지한 후 궁금한 사항이 있으면 Apple에 문의해 주십시오.
                        </textarea>
                        <div class="radio">
                            <label>
                                <input type="radio" id="provisionYn" name="provisionYn" value="Y" autofocus="autofocus" checked>
                                동의합니다.
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" id="provisionYn" name="provisionYn" value="N">
                                동의하지 않습니다.
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
                    <div class="col-lg-10" id="memberInfo">
                        <textarea class="form-control" rows="8" style="resize:none">개인정보의 항목 및 수집방법
							Apple 개인정보 처리방침은 Apple이 고객의 개인 데이터를 수집, 사용 및 공유하는 방법을 설명합니다.
							개인정보 처리방침과 더불어, Apple은 고객의 개인 정보를 사용할 수 있도록 요청하는 Apple 제품 및 특정 기능에 저장된 데이터 및 개인 정보를 제공합니다. 이 제품별 정보에는 데이터 및 개인 정보 보호 아이콘이 표시됩니다.
							이러한 기능을 사용하기 전에 이 제품별 정보를 검토할 수 있는 기회가 제공됩니다. 또한 언제든지 해당 기능에 관련된 설정 및/또는 apple.com/kr/legal/privacy에서 온라인으로 이 정보를 확인할 수 있습니다.
							잠시 시간을 내어 아래의 제목을 통해 접근 가능한 Apple의 개인정보 처리방침을 숙지한 후 궁금한 사항이 있으면 Apple에 문의해 주십시오.
                        </textarea>
                        <div class="radio">
                            <label>
                                <input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
                                동의합니다.
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
                                동의하지 않습니다.
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" name="id" class="form-control onlyAlphabetAndNumber" id="id" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
	                    <button type="button" onclick="check_id_Async()">중복확인</button>
                    </div>
                </div>
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" name="password" class="form-control" id="password"  data-rule-required="true" placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
               <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" name="name" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" name="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="40">
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">주소</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="address" name = "address" data-rule-required="true" placeholder="주소" maxlength="40">
                    </div>
                </div>
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">전화번호</label>
                    <div class="col-lg-10">
                        <input type="text" name="phone" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputEmailReceiveYn" class="col-lg-2 control-label">이메일 수신여부</label>
                    <div class="col-lg-10">
                        <label class="radio-inline">
                            <input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="Y" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지 않습니다.
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">SMS 수신여부</label>
                    <div class="col-lg-10">
                        <label class="radio-inline">
                            <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="Y" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지 않습니다.
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
						<button type="submit" class="btn btn-primary" >회원가입</button>
                    </div>
                </div>
            </form>
        </div>
	<div style="margin-top: 15%;">
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>
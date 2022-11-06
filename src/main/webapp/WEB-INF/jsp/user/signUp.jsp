<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="sign-up-box">
		
		<form id="signUpForm" method="post" action="/user/sign_up">
			<div id="signUpBox">
				<h3 class="text-center pt-2">새 계정 만들기</h3>
				<h5 class="text-center mt-4">빠르고 쉽습니다.</h5>
				<hr>
				
				<!-- 인풋박스 아이디 , 중복확인 -->
				<div class="d-flex">
					<input type="text" id="loginId" name="loginId" class="form-control col-9" placeholder="아이디">
					<button type="button" id="loginIdCheckBtn" class="btn btn-primary ml-3">중복확인</button>
				</div>
				
				<%-- 아이디 체크 결과 --%>
				<%-- d-none 으로 보이지 않게 한다. --%>
				<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
				<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
				<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
				
				<!-- 인풋박스 비밀번호 -->
				<input type="password" id="password" name="password" class="form-control col-11 mt-3" placeholder="비밀번호">
				
				<!-- 인풋박스 비밀번호 확인 -->
				<input type="password" id=confrimPassword name="confrimPassword" class="form-control col-11 mt-3" placeholder="비밀번호 확인">
				
				<!-- 인풋박스 이름 -->
				<input type="password" id="name" name="name" class="form-control col-11 mt-3" placeholder="이름">
				
				<!-- 회원가입 footer -->
				<span class="sign-up-span">
					저희 서비스를 이용하는 사람이 회원님의 연락처 정보를 Facebook에 업로드했을 수도 있습니다. <br><br>
					더알아보기. 가입하기 버튼을 클릭하면 Facebook의 약관, 개인정보처리방침 및 쿠키 정책에 동의하게 됩니다.
					Facebook으로부터 SMS 알림을 받을 수 있으며 알림은 언제든지 옵트 아웃할 수 있습니다.
				</span>
				
				<!-- 가입하기 버튼 -->
				<div class="d-flex justify-content-center mt-3">
					<button tpye="submit" id="signUpBtn" class="btn form-control col-6 text-white">가입하기</button>				
				</div>
				
				<!-- 이미 계정이 있을 때 -->
				<div class="d-flex justify-content-center">
					<a href="#" class="href-text mt-3">이미 계정이 있으신가요?</a>
				</div>
			</div>
		</form>
	</div>
</div>









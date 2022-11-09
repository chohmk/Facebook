<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
	<header>
		<div
			class="header-box d-flex justify-content-center align-items-center">
			<!-- logo -->
			<div>
				<h1 class="header-logo text-primary">Facebook</h1>
			</div>

		</div>
	</header>
	<section>
		<div class="d-flex justify-content-center">
			<div class="sign-up-box">

				<form id="signUpForm" method="post" action="/user/sign_up">
					<div id="signUpBox">
						<h3 class="text-center pt-2">새 계정 만들기</h3>
						<h5 class="text-center mt-4">빠르고 쉽습니다.</h5>
						<hr>

						<!-- 인풋박스 아이디 , 중복확인 -->
						<div class="d-flex">
							<input type="text" id="loginId" name="loginId"
								class="form-control col-9" placeholder="아이디">
							<button type="button" id="loginIdCheckBtn"
								class="btn btn-primary ml-3">중복확인</button>
						</div>

						<%-- 아이디 체크 결과 --%>
						<%-- d-none 으로 보이지 않게 한다. --%>
						<div id="idCheckLength" class="small text-danger d-none">ID를
							4자 이상 입력해주세요.</div>
						<div id="idCheckDuplicated" class="small text-danger d-none">이미
							사용중인 ID입니다.</div>
						<div id="idCheckOk" class="small text-success d-none">사용 가능한
							ID 입니다.</div>

						<!-- 인풋박스 비밀번호 -->
						<input type="password" id="password" name="password"
							class="form-control col-11 mt-3" placeholder="비밀번호">

						<!-- 인풋박스 비밀번호 확인 -->
						<input type="password" id=confirmPassword name="confirmPassword"
							class="form-control col-11 mt-3" placeholder="비밀번호 확인">

						<!-- 인풋박스 이름 -->
						<input type="text" id="name" name="name"
							class="form-control col-11 mt-3" placeholder="이름">

						<!-- 회원가입 footer -->
						<span class="sign-up-span"> 저희 서비스를 이용하는 사람이 회원님의 연락처 정보를
							Facebook에 업로드했을 수도 있습니다. <br> <br> 더알아보기. 가입하기 버튼을 클릭하면
							Facebook의 약관, 개인정보처리방침 및 쿠키 정책에 동의하게 됩니다. Facebook으로부터 SMS 알림을 받을
							수 있으며 알림은 언제든지 옵트 아웃할 수 있습니다.
						</span>

						<!-- 가입하기 버튼 -->
						<div class="d-flex justify-content-center mt-3">
							<button tpye="submit" id="signUpBtn"
								class="btn form-control col-6 text-white">가입하기</button>
						</div>

						<!-- 이미 계정이 있을 때 -->
						<div class="d-flex justify-content-center">
							<a href="/user/sign_in_view" class="href-text mt-3">이미 계정이
								있으신가요?</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>



	<script>
		// 아이디 중복확인
		$(document).ready(function() {
			$('#loginIdCheckBtn').on('click', function() {
				let loginId = $('#loginId').val().trim();

				if (loginId.length < 4) {
					$('#idCheckLength').removeClass('d-none');
					$('#idCheckOk').addClass('d-none');
					$('#idCheckDuplicated').addClass('d-none');
					return;
				}

				// ajax 중복확인
				$.ajax({
					url : "is_duplicated_id",
					data : {
						"loginId" : loginId
					},
					success : function(data) {
						if (data.result) {
							// 중복이면
							$('#idCheckDuplicated').removeClass('d-none');
							$('#idCheckLength').addClass('d-none');
							$('#idCheckOk').addClass('d-none');
						} else {
							$('#idCheckOk').removeClass('d-none');
							$('#idCheckLength').addClass('d-none');
							$('#idCheckDuplicated').addClass('d-none');
						}
					},
					error : function(e) {
						alert("아이디 중복확인에 실패했습니다.");
					}
				});

			}); // 중복확인 끝

			$('#signUpForm').on('submit', function(e) {
				e.preventDefault(); // submit 기능 중단

				let loginId = $('#loginId').val().trim();
				let password = $('#password').val().trim();
				let confirmPassword = $('#confirmPassword').val().trim();
				let name = $('#name').val().trim();

				// validation 
				if (loginId == "") {
					alert("아이디를 입력해주세요.");
					return false;
				}
				if (password == "" || confirmPassword == "") {
					alert("비밀번호를 입력하세요");
					return false;
				}
				if (password != confirmPassword) {
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				if (name == "") {
					alert("이름을 입력하세요.");
					return false;
				}
				// 아이디 중복확인이 완료되었는지 확인
				if ($('#idCheckOk').hasClass('d-none') == true) {
					alert("아이디 중복확인을 다시 해주세요");
					return false;
				}

				// 회원가입 ajax
				let url = $(this).attr('action');
				let params = $(this).serialize();

				$.post(url, params).done(function(data) {
					if (data.code == 100) {
						alert("가입을 환영합니다.");
						location.href = "/user/sign_in_view";
					} else {
						alert("회원가입에 실패하였습니다.");
					}
				}); // ajax 끝

			}); // 가입하기 버튼 끝
		}); // ready 끝
	</script>
</body>

</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
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
			<div class="login-box">
				<form id="loginForm" action="/user/sign_in" method="post">
					<div id="signInBox">
						<h4 class="text-center pt-2">Facebook에 로그인</h4>

						<div class="login-input-box mt-3 ml-4">
							<input type="text" id="loginId" name="loginId"
								class="form-control" placeholder="아이디"> <input
								type="password" id="password" name="password"
								class="form-control mt-3" placeholder="비밀번호">

							<button type="submit" id="loginBtn" class="btn btn-primary mt-3">로그인</button>
						</div>
						<br>
						<hr>
						<div class="d-flex justify-content-center">
							<a class="btn sign-up-href btn-success mt-2"
								href="/user/sign_up_view">새 계정 만들기</a>
						</div>

					</div>
				</form>
			</div>
		</div>
	</section>


	<script>
		$(document).ready(function() {
			// validation
			$('#loginForm').on('submit', function(e) {
				e.preventDefault();

				let loginId = $('#loginId').val().trim();
				let password = $('#password').val().trim();
				if (loginId == "") {
					alert("아이디를 입력하세요.");
					return false;
				}
				if (password == "") {
					alert("비밀번호를 입력하세요");
					return false;
				}
				// 로그인 ajax
				let url = $(this).attr('action');
				let params = $(this).serialize();

				$.post(url, params).done(function(data) {
					if (data.code == 100) {
						location.href = "/timeline/timeline_view";
					} else {
						alert(data.errorMessage);
					}

				});

			}); // validation 끝

		}); // ready끝
	</script>

</body>
</html>
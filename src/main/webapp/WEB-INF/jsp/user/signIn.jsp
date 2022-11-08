<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="login-box">
		<form id="loginForm" action="/user/sign_in" method="post">
			<div id="signInBox">
				<h4 class="text-center pt-2">Facebook에 로그인</h4>
				
				<div class="login-input-box mt-3 ml-4">
					<input type="text" id="loginId" name="loginId" class="form-control" placeholder="아이디">
					<input type="password" id="password" name="password" class="form-control mt-3" placeholder="비밀번호">
					
					<button type="submit" id="loginBtn" class="btn btn-primary mt-3">로그인</button>
				</div>
				<br>
				<hr>
				<div class="d-flex justify-content-center">
					<a class="btn sign-up-href btn-success mt-2" href="/user/sign_up_view">새 계정 만들기</a>
				</div>
				
			</div>
		</form>
	</div>
</div>    

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
			if (password =="") {
				alert("비밀번호를 입력하세요");
				return false;
			}
			// 로그인 ajax
			let url = $(this).attr('action');
			let params = $(this).serialize();
			
			$.post(url, params)
			.done(function(data) {
				if (data.code == 100) {
					location.href="/timeline/timeline_view";
				} else {
					alert(data.errorMessage);
				}
				
			});
			
		}); // validation 끝
		
	}); // ready끝
</script>


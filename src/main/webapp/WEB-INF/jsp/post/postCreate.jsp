<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
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
<div id="wrap" class="container">
<header>
	<div class="d-flex justify-content-center">
	<div><h3 class="mt-2 ml-5">게시물 만들기</h3></div>
	</div>
</header>
<nav>
	
	<div class="d-flex justify-content-between">
	
	<div class="d-flex">
		<div class="circle"></div>
		<div class="rectangle btn ml-3 pb-4">${userName}</div>
	</div>
		<button type="button" id="upLoadBtn" class="upload-btn btn btn-primary mt-5 mr-3">업로드</button>
	</div>
</nav>
<section>
	<div class="write-box border rounded m-3 ml-5">
			<textarea id="writeTextArea" placeholder="내용을 입력해주세요" class="w-100 border-0" rows="20" ></textarea>
				
			<%-- 이미지 업로드를 위한 아이콘과 업로드 버튼을 한 행에 멀리 떨어뜨리기 위한 div --%>
			<div class="d-flex justify-content-between">
				<div class="file-upload d-flex">
					<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
					<a href="#" id="fileUploadBtn"><img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

					<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
					<div id="fileName" class="ml-2">
					</div>
				</div>
				
			</div>
		</div>

</section>

</div>

<script>
	// 파일 업로드 이미지 클릭 -> 파일 선택창 떠야함
	$(document).ready(function() {
		$('#fileUploadBtn').on('click', function(e) {
			e.preventDefault(); 
			$('#file').click();
		});	// fileUploadBtn 끝
		
		$('#file').on('change', function(e) {
			// alert("체인지");
			let fileName = e.target.files[0].name;
			
			let ext = fileName.split('.').pop().toLowerCase();
			
			// 확장자 유효성 확인
			if (fileName.split('.').length < 2 || 
					(ext != 'gif'
							&& ext != 'png'
								&& ext != 'jpg'
									&& ext != 'jpeg')) {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$(this).val(''); // 파일 태그에 실제 파일 제거
				$('#fileName').text(''); // 파일 이름 비우기
				return;
			}
			// 상자에 업로드 된 이름 노출
			$('#fileName').text(fileName);
		}); // file change 끝
		
		// -org.springframework.web.bind.MissingServletRequestParameterException
		// -java.sql.SQLIntegrityConstraintViolationException
		//  Column 'imagePath' cannot be null
		// 글쓰기
		$('#upLoadBtn').on('click',function() {
			let content = $('#writeTextArea').val();
			console.log(content);
			if (content.length < 1) {
				alert("게시글을 작성해주세요.");
				return;
			}
			let file = $('#file').val();
			if (file == '') {
				alert('파일을 업로드 해주세요');
				return;
			}
			// 파일이 업로드 된 경우 확장자 체크
			let ext = file.split('.').pop().toLowerCase(); // 파일 경로를 .으로 나누고 확장자가 있는 마지막 문자열을 가져온 후 모두 소문자로 변경
			if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
				alert("gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.");
				$('#file').val(''); // 파일을 비운다.
				return;
			}
			
			
			let formData = new FormData();
			formData.append("content", content);
			formData.append("file", $('#file')[0].files[0]);
			
			// ajax
			$.ajax({
			type: "post"
			, url: "/post/create"
			, data: formData
			, enctype: "multipart/form-data"    // 파일 업로드를 위한 필수 설정
			, processData: false    // 파일 업로드를 위한 필수 설정
			, contentType: false    // 파일 업로드를 위한 필수 설정
			, success: function(data) {
				if (data.code == 100) {
					location.href="/timeline/timeline_view";
					alert("성공");
				} else if (data.code == 300) { // 비로그인 일 때
					location.href = "/user/sign_in_view";
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("글 저장에 실패했습니다. 관리자에게 문의해주세요.");
			}
			});
			
		}); // 글쓰기 끝
		
	}); // ready 끝
		
	
	
</script>
	
		
		
		


</body>
</html>
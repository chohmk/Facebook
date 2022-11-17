<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시물</title>
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
	<div><h3 class="mt-2 ml-5">내 게시물</h3></div>
	</div>
</header>
<nav>
	
	<div class="d-flex justify-content-between">
	
	<div class="d-flex">
		<div class="circle"></div>
		<div class="rectangle btn ml-3 pb-4">${userName}</div>
	</div>
	<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
		<a href="#" id="fileUploadBtn" class="detail-file mt-5">
			<img class="detail-image" width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png">
		</a>
		
	</div>
</nav>

<!-- **************************************************** -->
<section>
	<div class="write-div card border rounded">
		<textarea class="form-control"  id="content" placeholder="내용을 입력해주세요">${post.content}</textarea>
		<img src="${post.imagePath}" alt="업로드 이미지" >
	</div>
</section>

<!-- **************************************************** -->
<footer class="detail-footer">
	<div class="img-file-upload d-flex justify-content-end mr-2 pt-2">
	
		<div class="post-detail-file mt-1"></div>
		
		<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
		<div>
			<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
		</div>
		<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
			<div id="fileName" class="file-name">
		</div>

		
		<div class="footer-btn d-flex">
			<button type="button" id="homeBtn" class="detail-btn btn-primary form-control">Home</button>
			<button type="button" id="changeBtn" class="detail-btn btn-success form-control" data-post-id="${post.id}">수정</button>
			<button type="button" id="deleteBtn" class="detail-btn btn-secondary form-control" data-post-id="${post.id}">삭제</button>
		</div>
		
		
	</div>
</footer>
</div>

<script>
	$(document).ready(function() {
		// 홈 버튼
		$('#homeBtn').on('click',function() {
			location.href="/timeline/timeline_view";
		}); // homeBtn 끝
		// 파일업로드 버튼
		$('#fileUploadBtn').on('click', function(e) {
			e.preventDefault(); 
			$('#file').click();
		});	// fileUploadBtn 끝
		
		// 파일 이미지 교체
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
		
		// 수정 버튼
		$('#changeBtn').on('click', function() {
			let content = $('#content').val();
			let file = $('#file').val();
			
			if (file != '') {
				console.log(file.split('.').pop());    // 파일명을 . 기준으로 나눈다. => 확장자만 뽑아낸다.
				let ext = file.split('.').pop().toLowerCase(); // 확장자를 소문자로 변경
				if ($.inArray(ext, ['gif', 'jpg', 'jpeg', 'png']) == -1) {
					alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
					$('#file').val('');  // 파일을 비운다.
					return;
				}
			}
			let postId = $(this).data('post-id');
			let formData = new FormData();
			//alert(postId);
			formData.append("postId", postId)
			formData.append("content", content);
			formData.append("file", $('#file')[0].files[0]);
			
			// 수정 ajax
			$.ajax({
				type:"PUT"
				, url:"/post/update"
				, data:formData
				, enctype:"multipart/form-data"
				, processData:false
				, contentType:false
				, success: function(data) {
					if (data.code == 100) {
						alert("수정이 완료되었습니다.");
						location.href="/timeline/timeline_view";
					} else {
						alert(errorMessage);
					}
				}
			});
		}); // 수정 끝
		// 삭제 
		$('#deleteBtn').on('click', function() {
			let postId = $(this).data('post-id');
			
			// 삭제 ajax
			$.ajax({
				type:"DELETE"
				, url:"/post/delete"
				, data:{"postId":postId}
				, success: function(data) {
					if (data.code == 100) {
						alert("삭제되었습니다.");
						location.href="/timeline/timeline_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("삭제에 실패하였습니다.");
				}
			});
		});	// 삭제 끝
		
		
		
	});	// ready끝
</script>	
	
		


</body>
</html>
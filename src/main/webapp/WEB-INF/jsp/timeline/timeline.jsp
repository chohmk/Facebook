<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
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
<div class="d-flex justify-content-center">
<header id="timelineHeader">
	<div class="d-flex justify-content-between">
		<h2>Facebook</h2>
		<div>
		<button type="button" class="btn">${userName}</button>
		<button type="submit" class="btn ml-4">로그아웃</button>
		</div>
	</div>
</header>
</div>
<div class="d-flex justify-content-center">
<section id="timelineSection">
	<div class="d-flex justify-content-start">
		<div class="circle"></div>
	<!-- 원 옆에 내 게시물, 글쓰기페이지 -->
		<div class="timeline-div1">
		<div class="d-flex justify-content-end">
		<button type="button" id="timelineMyPage" class="btn text-dark">내 게시물</button>
		</div>
		<div class="timeline-write mt-1">
		<a href="/post/post_create_view" class="text-dark">무슨 생각을 하고 계신가요?</a>
		
	<div class="d-flex justify-content-end mr-2 pt-2">
		<a href="#" id="fileUploadBtn"><img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>
	</div>
		</div>
		</div>	
	</div>
	
	<!-- timeline 2  -->
	
	<div class="timeline-div2">
	
	</div>
	
	<div class="timeline-div3 d-flex justify-content-between mt-2">
		<div class="card-like">
			<a href="#" class="like-btn text-dark">
				<img src="https://t1.daumcdn.net/cfile/tistory/2275AE4055E8082C25" width="18px" height="18px" alt="empty heart">				
				좋아요 10개
			</a>
				
		</div>
		<div>
			<a href="#" class="text-dark">
				<img src="https://www.nail25.com/img/footer_mystyle_unactive_icon_jh.png" width="18px" height="18px" alt="empty heart">
				댓글 달기
			</a>
				
		</div>
		<div>댓글개수</div>
	</div>
	
	<%-- 댓글 쓰기 --%>
	<div class="comment-write d-flex border-top mt-2">
	<input type="text" class="form-control border-0 mr-2" placeholder="댓글을 입력하세요..."/> 
	<button type="button" class="comment-btn btn btn-light" data-post-id="${post.id}">게시</button>
	</div>
	

</section>
</div>




</body>
</html>
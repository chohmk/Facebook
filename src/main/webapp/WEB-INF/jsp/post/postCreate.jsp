<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<button type="button" class="upload-btn btn btn-primary mt-5">업로드</button>
	</div>
</nav>
<section>
	<div class="write-div card border rounded">
	<a href="#" class="text-white">무슨 생각을 하고 계신가요?</a>
	</div>

</section>

<footer>
	<div class="img-file-upload d-flex justify-content-start mr-2 pt-2">
		<div class="post-detail-file mt-1"></div>
		
		<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
		<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
		<a href="#" id="fileUploadBtn"><img width="35"
		src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>
		
	</div>
</footer>
</div>
	
		
		
		


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<div class="d-flex justify-content-between mt-3">
		<h2 id="facebook">Facebook</h2>
		<div>
		<!-- 로그인 된 사람들만 보이게 -->
		<c:if test="${not empty userName}">
		<button type="button" class="btn">
		${userName}
		</button>
		<a href="/user/sign_out" class="logout-btn font-weight-bold ml-3 btn">로그아웃</a>
		</c:if>
		<c:if test="${empty userName}">
		<a href="/user/sign_in_view"><button class="btn btn-primary">로그인</button></a>
		</c:if>
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
		</div>
		<div>
		
		<div class="d-flex">
		<a href="/post/post_create_view">
			<div class="timeline-div">무슨 생각을 하고 계신가요?</div>
		</a>
		<div class="ml-5 mt-3">
			<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
			<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
			<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
			<a href="#" id="fileUploadBtn"><img width="35"
			src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

			<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
			<div id="fileName" class="ml-2"></div>
			</div>
		</div>
		</div>
		</div>	
	</div>
	
	<!-- timeline 2  -->
	
	<%-- 타임라인 영역 --%>
		<div class="timeline-box my-5">
			<c:forEach items="${cardList}" var="card">
			<!-- **************************************************** -->
			<%-- 카드1 --%>
			
			<div class="card border rounded mt-3">
				<div>
					<span class="font-weight-bold text-primary">${card.user.loginId}</span>
				</div>
				
				<!-- 카드 내용 -->
				<div class="card-content">
					<span>${card.post.content}</span>
				</div>
				
				<%-- 카드 이미지 --%>
				<div class="image-click card-img" data-post-id="${card.post.id}">
					<img src="${card.post.imagePath}" class="w-100" alt="본문 이미지">
				</div>
				
			<!-- **************************************************** -->
				<%-- 좋아요 --%>
				<div class="card-like m-3">
					<a href="#" class="like-btn" data-user-id="${userId}" data-post-id="${card.post.id}">
					<c:if test="${card.filledLike eq true}">
						<img src="https://www.iconninja.com/files/527/809/128/heart-icon.png" width="18px" height="18px" alt="filled heart">
					</c:if>
					<c:if test="${card.filledLike eq false}">
						<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18px" height="18px" alt="empty heart">
					</c:if>
						좋아요 ${card.likeCount}개
					</a>
				</div>
				
				<%-- 글 --%>
				<div class="card-post m-3">
					<span class="font-weight-bold">${card.user.loginId}</span>
					<span>${card.post.content}</span>
				</div>
				
				<%-- 댓글 --%>
				<div class="card-comment-desc border-bottom">
					<div class="ml-3 mb-1 font-weight-bold">댓글</div>
				</div>
				<div class="card-comment-list m-2">
					<%-- 댓글 목록 --%>
					<c:forEach items="${card.commentList}" var="commentView">
					<div class="card-comment m-1">
						<span class="font-weight-bold">${commentView.user.loginId}:</span>
						<span>${commentView.comment.content}</span>
						
						<%-- 댓글 삭제 버튼 --%>
						<a href="#"  class="commentDelBtn" data-comment-id="${commentView.comment.id}">
							<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
						</a>
					</div>
					</c:forEach>
					<%-- 댓글 쓰기 --%>
					<div class="comment-box d-flex justify-content-start">
					<div class="d-flex">
						<input type="text" class="comment-input form-control border-0 mr-2" placeholder="댓글 달기"/> 
						<button type="button" class="comment-btn btn btn-light" data-post-id="${card.post.id}">게시</button>
					</div>
					</div>
				</div>
			</div> <%--// 카드1 닫기 --%>
			</c:forEach>
		</div> <%--// 타임라인 영역 닫기  --%>
	

</section>
</div>

<script>
	$(document).ready(function() {
		// facebook hover 효과
		$('#facebook').hover(function() {
			$(this).css('color', 'blue');
			$(this).css('cursor', 'pointer');
		},function() {
			$(this).css('color', 'black');
		}); // facebook hover 끝
		
		// facebook 로고 클릭 시 화면 리로드
		$('#facebook').on('click', function() {
			location.reload();
		});	// facebook reload 끝
		
		// 파일 업로드 이미지 클릭 시 글쓰기 페이지로 이동
		$('#fileUploadBtn').on('click', function() {
			location.href="/post/post_create_view";
		});	// 파일 업로드 이미지 끝
		
		
		// 이미지클릭
		$('.image-click').on('click', function() {
			
			let postId = $(this).data('post-id');
			
			location.href="/post/post_detail_view?id=" + postId;
			
		});
		
		// 댓글 게시버튼 클릭
		$('.comment-btn').on('click', function() {
			let postId = $(this).data('post-id');
			// alert(postId);
			let comment = $(this).siblings('input').val().trim();
			// alert(comment);
			if (comment == '') {
				alert("댓글을 입력하세요.");
				return;
			}
			// 댓글 ajax
			$.ajax ({
				type:"POST"
				, url:"/comment/create"
				, data: {"postId":postId, "content":comment}
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else if (data.code == 300) {
						alert("로그인을 해주세요");
						location.href="/user/sign_in_view";
					} 
				}
				, error:function(e) {
					alert("댓글 오류");
				}
			}); 
		}); // 댓글 게시 버튼 끝
		// 댓글 삭제
		$('.commentDelBtn').on('click', function(e) {
			e.preventDefault();
			let commentId = $(this).data('comment-id');
			
			
		
			
			 $.ajax({
				type:"DELETE"
				, url: "/comment/delete"
				, data: {"id":commentId}
				, success: function(data) {
					if (data.code == 100) {
						alert("댓글이 삭제되었습니다.");
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("댓글 삭제 오류");
				}
			});
		}); // 댓글 삭제 끝
	
		// 좋아요/해제 
		$('.like-btn').on('click', function(e) {
			e.preventDefault();
			// 좋아요클릭하기 위해서 userId를 가져온다.
			let userId = $(this).data('user-id');
			// alert(userId);
			// userId가 null 이면 alert
			if (userId == "") {
				alert("로그인을 해주세요");
				return;
			}
			// 좋아요를 클릭하는 글이 어떤건지 알기위해 postId를 가져온다.
			let postId = $(this).data('post-id');
			// alert(postId);
			
			// ajax
			$.ajax({
				url: "/like/" + postId
				, success:function(data) {
					if (data.code == 100) {
						location.reload(true);
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("좋아요/해제 하는데 실패했습니다."); 
				}
			});
			
		}); // 좋아요 끝
		
		
	}); // ready 끝
</script>



</body>
</html>
package com.facebook.comment.bo;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.facebook.comment.dao.CommentDAO;
import com.facebook.comment.model.Comment;
import com.facebook.comment.model.CommentView;
import com.facebook.user.bo.UserBO;
import com.facebook.user.model.User;

@Service
public class CommentBO {
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	

	// 댓글 insert
	public void createComment(int userId, int postId, String content) {
		commentDAO.insertComment(userId, postId, content);
	}
	
	// 글 하나에 해당하는 댓글목록 select
	private List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	// 글 하나에 해당하는 댓글 목록(화면용)
	public List<CommentView> generateCommentViewListByPostId(int postId) {
		
		// 결과물
		List<CommentView> commentViewList = new ArrayList<>();
		
		// 댓글 목록 가져오기
		List<Comment> commentList = getCommentListByPostId(postId);
		
		// 반복문	=> CommentView -> List<CommentView>에 채운다.
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			commentView.setComment(comment);
			
			User user = userBO.getUserById(comment.getUserId());
			commentView.setUser(user); // 댓글쓴이
			
			// 리스트에 담는다.
			commentViewList.add(commentView);
		}
		// 리스트 리턴
		return commentViewList;
	}
	
	// 댓글 삭제
	public void deleteCommentsById(int id) {
		commentDAO.deleteCommentsById(id);
	}
}

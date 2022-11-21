package com.facebook.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.facebook.comment.model.Comment;

@Repository
public interface CommentDAO {
	// 댓글 insert
	public void insertComment(
			@Param("userId") int userId, 
			@Param("postId") int postId, 
			@Param("content") String content);
	// 댓글 목록 select
	public List<Comment> selectCommentListByPostId(int postId);
}

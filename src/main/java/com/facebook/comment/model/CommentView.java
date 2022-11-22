package com.facebook.comment.model;

import com.facebook.user.model.User;

public class CommentView {
	// 댓글 한개
	private Comment comment;

	// 댓글쓴이 정보
	private User user;

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
package com.facebook.post.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.facebook.post.model.Post;

@Repository
public interface PostDAO {
	// 글쓰기 insert
	public int insertPost(
			@Param("userId") int userId, 
			@Param("content") String content, 
			@Param("imagePath") String imagePath);
	
	// 글 목록 select
	public List<Post> selectPostList();
	
	public Post selectPostByPostId(int Id);
}

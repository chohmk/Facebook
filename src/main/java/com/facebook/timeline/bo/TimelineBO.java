package com.facebook.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.facebook.comment.bo.CommentBO;
import com.facebook.post.bo.PostBO;
import com.facebook.post.model.Post;
import com.facebook.timeline.model.CardView;
import com.facebook.user.bo.UserBO;
import com.facebook.user.model.User;

@Service
public class TimelineBO {
	@Autowired
	private PostBO postBO;
	
	@Autowired 
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;

	// cardView
	public List<CardView> generateCardList(Integer userId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 글목록 가져오기
		List<Post> postList = postBO.getPostList();
		
		// 반복문 cardView
		for (Post post : postList) {
			CardView card = new CardView();
			
			// 글 정보
			card.setPost(post);
			
			// 글쓴이 정보
			User user = userBO.getUserById(post.getUserId());
			card.setUser(user);
			
			// 글 하나에 해당하는 댓글 목록
		}
	}
		
	
	
	
	
	

}

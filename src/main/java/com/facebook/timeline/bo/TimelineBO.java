package com.facebook.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.facebook.comment.bo.CommentBO;
import com.facebook.comment.model.CommentView;
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
	// 로그인 안된 사람도 카드 목록이 보여야하기 때문에 Integer userId
	public List<CardView> generateCardList(Integer userId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 2.카드뷰만들기위해 글목록 가져오기
		// 글목록 가져오기
		List<Post> postList = postBO.getPostList();
		
		// 3. 가져온 글목록들을 반복문 돌려서 card에 담기
		// 반복문 cardView
		for (Post post : postList) {
			CardView card = new CardView();
			
			// 글 정보
			card.setPost(post);
			
			// 4-1 글쓴이 정보를 user에 만든다.
			// 4-2. 글쓴이 정보 가져와서 card에 담기
			// 글쓴이 정보
			User user = userBO.getUserById(post.getUserId());
			card.setUser(user);
			
			// 5-1. 글 하나에 해당하는 댓글목록을 가져오기위해 generateCommentViewListByPostId를 만든다.
			// 5-2. 글하나에 해당하는 댓글목록을 가져온다.
			// 글 하나에 해당하는 댓글 목록
			List<CommentView> commentList = commentBO.generateCommentViewListByPostId(post.getId());
			card.setCommentList(commentList);
			
			// 카드 리스트에 채우기
			cardViewList.add(card);
		}
		return cardViewList;
	}
}
		


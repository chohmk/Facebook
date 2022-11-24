package com.facebook.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.facebook.comment.bo.CommentBO;
import com.facebook.comment.model.CommentView;
import com.facebook.like.bo.LikeBO;
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
	
	@Autowired
	private LikeBO likeBO;

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
			
			// 내가 좋아요를 눌렀는지
			// 설명필요
			if (userId == null) {
				card.setFilledLike(false);
			} else {
				int count = likeBO.getLikeCountByPostIdOrUserId(post.getId(), userId);
				card.setFilledLike(count > 0 ? true : false);
			}
			
			// 좋아요 개수
			card.setLikeCount(likeBO.getLikeCountByPostIdOrUserId(post.getId(), null));
		
			
			// 카드 리스트에 채우기
			cardViewList.add(card);
		}
		return cardViewList;
	}
}
// 좋아요 
/**
 * 1. 좋아요 개수 가져오기위해 like BO, DAO, Mapper 만든다.(select)
 * 2. 타임라인화면(카드뷰에서 사용)에 보여야하기 때문에 timelineBO에 좋아요개수를 가져온다.
 * 3. timelineBo에서 내가 좋아요를 눌렀는지 if 문으로 확인 
 *    -> userId == null 이면 filledLike를 card에 담지 않는다.
 *    -> userId != null 이면 int count 변수에 likeBo에 있는 getLikeCountByPostIdOrUserId를 저장한다.
 *    -> 이해안됨
 *    -> 저장한 count를 card에 담는다.
 */
		


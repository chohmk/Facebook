package com.facebook.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.facebook.common.FileManagerService;
import com.facebook.post.dao.PostDAO;
import com.facebook.post.model.Post;



@Service
public class PostBO {
	@Autowired
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private FileManagerService fileManager;
	
	@Autowired 
	private FileManagerService fileManagerService;

	// 글쓰기 insert
	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		return postDAO.insertPost(userId, content, imagePath);
	}

	// 글 목록 select
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	// 글 하나의 postId
	public Post getPostByPostId(int postId) {
		return postDAO.selectPostByPostId(postId);
	}
	
	// 수정 update
	public int updatePost(int postId, int userId, String userLoginId, String content, MultipartFile file ) {
		// 기존 글을 가져온다.
		Post post = getPostByPostId(postId);
		if (post == null) {
			log.warn("[update post] 수정할 게시글이 존재하지 않습니다. postId:{}, userId:{}\", postId, userId");
			return 0;
		}
		// file이 있으면 이미지 수정 => 업로드 (실패시 기존 이미지는 그대로 둔다) => 성공 기존 이미지 제거
		String imagePath = null;
		if (file != null) {
			// 업로드
			imagePath = fileManagerService.saveFile(userLoginId, file);
					
			// 업로드 성공하면 기존 이미지 제거
			if (imagePath != null && post.getImagePath() != null) {
				// 업로드가 실패할 수 있으므로 업로드가 성공한 후 제거
				fileManagerService.deleteFile(post.getImagePath());
			}
		}
				
		// DB에 update => imagePath가 없으면 mybatis에서 업데이트하지 않도록 처리
		// dao 만들차례
	}
}

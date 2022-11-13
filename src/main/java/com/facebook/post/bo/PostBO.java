package com.facebook.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.facebook.common.FileManagerService;
import com.facebook.post.dao.PostDAO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManager;
	
	// 글쓰기 insert
	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		return postDAO.insertPost(userId, content, imagePath);
	}
}

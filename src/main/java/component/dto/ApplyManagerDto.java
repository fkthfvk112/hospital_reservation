package component.dto;

import java.io.File;
import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class ApplyManagerDto implements Serializable{
	private String userId;
	private String title;
	private String content;
	private MultipartFile file;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "ApplyManagerDto [userId=" + userId + ", title=" + title + ", content=" + content + ", file=" + file
				+ "]";
	}

}

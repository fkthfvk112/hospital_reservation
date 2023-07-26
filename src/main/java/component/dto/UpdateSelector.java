package component.dto;

import java.io.Serializable;

public class UpdateSelector implements Serializable {
	private int hosId;
	private String content;
	private int selection; //0:description, 1:time, 2:sort
	public int getHosId() {
		return hosId;
	}
	public void setHosId(int hosId) {
		this.hosId = hosId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSelection() {
		return selection;
	}
	public void setSelection(int selection) {
		this.selection = selection;
	}
	@Override
	public String toString() {
		return "UpdateSelector [hosId=" + hosId + ", content=" + content + ", selection=" + selection + "]";
	}
	
}

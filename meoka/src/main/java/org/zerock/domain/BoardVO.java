package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Integer RECIPENO;
	private String MEMBERID;
	private Integer FOODNO;
	private String RECIPENAME;
	private Date REGDATE;
	private String COOKINGTIME;
	private String PORTION;
	private Integer RANKNO;

	/*
	 * public Integer getNum() { return num; } public void setNum(Integer num) {
	 * this.num = num; } public String getName() { return name; } public void
	 * setName(String name) { this.name = name; } public String getTitle() { return
	 * title; } public void setTitle(String title) { this.title = title; } public
	 * String getContent() { return content; } public void setContent(String
	 * content) { this.content = content; } public Integer getReadCount() { return
	 * readCount; } public void setReadCount(Integer readCount) { this.readCount =
	 * readCount; } public Date getWriteDate() { return writeDate; } public void
	 * setWriteDate(Date writeDate) { this.writeDate = writeDate; }
	 */
	/*
	 * @Override public String toString() { return "BoardVO [num=" + num + ", name="
	 * + name + ", title=" + title + ", content=" + content + ", readCount=" +
	 * readCount + ", writeDate=" + writeDate + "]"; }
	 */

}

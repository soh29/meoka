package org.zerock.domain;

import java.util.Date;
import lombok.*;
@Getter
@Setter
@ToString
public class BoardVO {
	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Integer viewcnt;
	private Integer commentcnt;
	
	private Integer groupno;
	private Integer grouporder;
	private Integer depth;
	
	private String[] files;
}

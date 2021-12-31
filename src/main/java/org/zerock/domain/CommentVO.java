package org.zerock.domain;

import java.util.Date;
import lombok.*;
@Getter
@Setter
@ToString
public class CommentVO {
  private Integer cno;
  private Integer bno;
  private String content;
  private String writer;

  private Date regdate;
  private Date updatedate;
  
  //lab start
  private String ipaddress;
  
  private Integer groupno;
  private Integer grouporder;
  private Integer depth;
  //lab end
}

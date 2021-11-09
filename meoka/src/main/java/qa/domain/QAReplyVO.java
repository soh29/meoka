package qa.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class QAReplyVO {

  private Integer rno;
  private Integer bno;
  private String replytext;
  private String memberid;

  private Date regdate;
  private Date updatedate;
}

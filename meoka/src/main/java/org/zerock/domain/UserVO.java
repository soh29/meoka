package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
  private String name;
  private String memberId;
  private String password;
  private String email;
  private String email2;
  private String phoneNo;
  private String memberType;
  private int rankNo;
}

package org.zerock.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginDTO {
   
   private String memberId;
   private String password;
   private boolean useCookie;
}

package org.zerock.domain;

public class UserVO {

  private String memberId;
  private String password;
  private String memberType;
  private int rankNo;

  public String getMemberId() {
    return memberId;
  }

  public void setMemberId(String memberId) {
    this.memberId = memberId;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }
  
  public String getMemberType() {
	    return memberType;
  }

  public void setMemberType(String memberType) {
	    this.memberType = memberType;
   }
	  
  public int getRankNo() {
		    return rankNo;
  }

  public void setRankNo(int rankNo) {
		    this.rankNo = rankNo;
  }  

 
  @Override
  public String toString() {
    return "UserVO [memberId=" + memberId + ", memberPw=" + password + ", memberType=" + memberType + ", rankNo=" + rankNo + "]";
  }
}

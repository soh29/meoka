package org.zerock.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;



@Controller
@RequestMapping("/user")
public class UserController {
   private static final Logger logger=LoggerFactory.getLogger(UserController.class);

   @Autowired
   private UserService userservice;
   
   // 회원가입 페이지 이름
   @RequestMapping(value="/join", method=RequestMethod.GET)
   public String loginGET() {
      
      logger.info("회원가입 페이지 진입");
      return "user/joinForm";
   }
   
   // 회원가입
   @RequestMapping(value = "/join", method = RequestMethod.POST)
   public String joinPOST(UserVO user) throws Exception {
      logger.info("join 진입");
       
      // 회원가입 서비스 실행
      System.out.println(user.getMemberId() + user.getPassword());
      user.setMemberType("사용자");
      user.setRankNo(1);
      userservice.userJoin(user);
       
      logger.info("join Service 성공");
       
      return "redirect:/home-v3";
   }  
      
   
   // 로그인 페이지 이동
   @RequestMapping(value="/user/login", method=RequestMethod.GET)
   public void login() {
      logger.info("로그인 페이지 진입");
   }
   
   
   @Inject
   private UserService service;
   
   
   @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
   public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
      System.out.println("*******************************");
      System.out.println(dto);
      System.out.println("********************************");
      
     UserVO vo = service.login(dto);
     System.out.println("\n*******************************");
      System.out.println("vo: " + vo);
      System.out.println("********************************");
      
     if (vo == null) {
       return;
     }
      
     model.addAttribute("userVO", vo);

     if (dto.isUseCookie()) {

       int amount = 60 * 60 * 24 * 7;

       Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

       service.keepLogin(vo.getMemberId(), session.getId(), sessionLimit);
     }
   }
     
     
   }
   
   


/*
@Controller
@RequestMapping("/user")
public class UserController {

  @Inject
  private UserService service;

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

  }

  // @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
  // public void loginPOST(LoginDTO dto, HttpSession session, Model model)
  // throws Exception {
  //
  // UserVO vo = service.login(dto);
  //
  // if (vo == null) {
  // return;
  // }
  //
  // model.addAttribute("userVO", vo);
  //
  // }

  @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
  public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

    UserVO vo = service.login(dto);

    if (vo == null) {
      return;
    }

    model.addAttribute("userVO", vo);

    if (dto.isUseCookie()) {

      int amount = 60 * 60 * 24 * 7;

      Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

      service.keepLogin(vo.getMemberId(), session.getId(), sessionLimit);
    }

  }

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(HttpServletRequest request, 
      HttpServletResponse response, HttpSession session) throws Exception {

    Object obj = session.getAttribute("login");

    if (obj != null) {
      UserVO vo = (UserVO) obj;

      session.removeAttribute("login");
      session.invalidate();

      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

      if (loginCookie != null) {
        loginCookie.setPath("/");
        loginCookie.setMaxAge(0);
        response.addCookie(loginCookie);
        service.keepLogin(vo.getMemberId(), session.getId(), new Date());
      }
    }
    
    return "user/logout";
  }

}
*/
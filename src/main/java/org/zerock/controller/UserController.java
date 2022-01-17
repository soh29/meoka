package org.zerock.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.CommentVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.ValuationVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.CommentService;
import org.zerock.service.IngredientService;
import org.zerock.service.RecipeService;
import org.zerock.service.UserService;
import org.zerock.service.UtensilService;
import org.zerock.service.ValuationService;

@Controller
@RequestMapping("/user")
public class UserController {
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userservice;
    @Inject
    ValuationService valuationservice;
   @Inject
   UtensilService utensilservice;
   @Inject
   IngredientService ingredientservice;
   @Inject
    RecipeService recipeservice;
   
   @Inject
   BCryptPasswordEncoder pwdEncoder;

   // 회원가입 페이지 이름
   @RequestMapping(value = "/join", method = RequestMethod.GET)
   public String loginGET() {

      logger.info("회원가입 페이지 진입");
      return "user/joinForm";
   }
   

   // 회원가입
      
   @RequestMapping(value = "/join", method = RequestMethod.POST)
   public String joinPOST(UserVO user) throws Exception {
      logger.info("join 진입");
   
      user.setEmail(user.getEmail()+"@"+user.getEmail2());  // "13@daum.net"
      logger.info("/* user="+user.toString());
      // 회원가입 서비스 실행
      System.out.println("/* user=" + user.getName() + user.getMemberId() + user.getPassword() + user.getEmail()
            + user.getPhoneNo());
      
      String inputPass = user.getPassword();
      String pwd = pwdEncoder.encode(inputPass);
      user.setPassword(pwd);
        

      System.out.println("pwd:"+pwd);
        
      
      user.setMemberType("사용자");
      user.setRankNo(1);
      userservice.userJoin(user);

      logger.info("join Service 성공");

      return "redirect:/";
   }
   
   
   // 아이디 중복 체크
      @ResponseBody
      @RequestMapping(value="/idChk", method = RequestMethod.POST)
      public int idChk(UserVO user) throws Exception {
         System.out.println("/* idChk 실행중...");
         int result = service.idChk(user);
         return result;
      }  

   // 로그인 페이지 이동
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public void login() {
      logger.info("로그인 페이지 진입");
   }

   @Inject
   private UserService service;
   @Inject
   CommentService commentService;

   @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
   public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
      System.out.println("*******************************");
      System.out.println("dto: " + dto);
      System.out.println("********************************");
      
      session.getAttribute("login");
       UserVO vo = service.login(dto);
      System.out.println("*******************************");
      System.out.println("vo: " + vo);
      System.out.println("********************************\n");
      
      boolean pwdMatch = pwdEncoder.matches(dto.getPassword(), vo.getPassword());
      
      if (vo != null && pwdMatch == true) {
            session.setAttribute("login", vo);
         } else {
            session.setAttribute("login", null);
            model.addAttribute("userVO", false);
         }

      
      

      /* if (dto.isUseCookie()) {

         int amount = 60 * 60 * 24 * 7;

         Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

         service.keepLogin(vo.getMemberId(), session.getId(), sessionLimit);
      } */
      
   }

   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
         throws Exception {

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

// 회원정보
   @RequestMapping(value = "/info", method = RequestMethod.GET)
   public String userInfo() throws Exception {
      return "user/info";
   }

   // 회원정보 수정
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public String registerUpdateView() throws Exception {
      return "user/modify";
   }
   
      
   @RequestMapping(value = "/modifyComplete", method = RequestMethod.POST)
   public String registerUpdate(UserVO vo, HttpSession session) throws Exception {
      
      String inputPass = vo.getPassword();
      String pwd = pwdEncoder.encode(inputPass);
      vo.setPassword(pwd);
       
      service.userUpdate(vo);

      return "user/info";
      
   }

// 회원 탈퇴 get
   @RequestMapping(value = "/delete", method = RequestMethod.GET)
   public String dlete() throws Exception {
      return "user/delete";
   }

   // 회원 탈퇴 post
   @RequestMapping(value = "/deleteComplete", method = RequestMethod.POST)
   public String userDelete(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

      // 세션에 있는 login을 가져와 member변수에 대입
      UserVO member = (UserVO) session.getAttribute("login");
      // 세션에있는 비밀번호
      String sessionPass = member.getPassword();
      // vo로 들어오는 비밀번호
      String voPass = vo.getPassword();

      if (!(pwdEncoder.matches(voPass, sessionPass))) {
         rttr.addFlashAttribute("msg", false);
         return "redirect:/user/delete";
      } else {
         rttr.addFlashAttribute("msg", true);
      }
      
      // Q&A 삭제
      List<CommentVO> commentlist = commentService.listComment2(vo.getMemberId());
      for(int i=0;i<commentlist.size();i++) {
        CommentVO comment = commentlist.get(i);
        commentService.removeComment(comment.getCno());         
      }
      
       // 댓글 삭제
      List<ValuationVO> valuationlist = valuationservice.getValuationList2(vo.getMemberId());
      for(int i=0;i<valuationlist.size();i++) {
         ValuationVO valuation = valuationlist.get(i);
         valuationservice.delete(valuation);         
      }
      
      List<RecipeVO> list = recipeservice.getRecipeList2(vo.getMemberId());
      
      for(int i=0;i<list.size();i++) {
         RecipeVO recipe = list.get(i);
         Integer recipeno = recipe.getRECIPENO();
         
         System.out.println("*********레시피후기삭제완료*********");  
          valuationservice.deleteRecipeValuation(recipeno);
          System.out.println("*********도구삭제완료*********");      
          utensilservice.deleteUtensil(recipeno);
          System.out.println("*********재료삭제완료*********");
          ingredientservice.deleteIngredient(recipeno);   
          System.out.println("*********세부내용삭제완료*********");
          recipeservice.deleteRecipeDetail(recipeno);
          System.out.println("*********레시피삭제완료*********");
          recipeservice.delete(recipeno);
      }
      
      service.userDelete(vo);
      session.invalidate();

      return "redirect:/";
      
   }
   
   // 아이디 찾기 페이지 이동
    @RequestMapping(value="findId")
    public String findIdView() {
       return "user/findId";
    }
    
     // 아이디 찾기 실행
    @RequestMapping(value="find_id", method=RequestMethod.POST)
    public String findIdAction(UserVO vo, Model model) {
       UserVO user = service.findId(vo);
       
       if(user == null) { 
          model.addAttribute("check", 1);
       } else { 
          model.addAttribute("check", 0);
          model.addAttribute("id", user.getMemberId());
       }
       
       return "user/findId";
    }
    
    // 내가 작성한 댓글
    @Autowired
    private ValuationService valuationService;  
    
    @RequestMapping(value = "/myValuationList", method = RequestMethod.GET)
    public String getValuationList(HttpSession session, Model model) throws Exception{      
       logger.info("댓글 리스트");

       Object obj = session.getAttribute("login");
       UserVO vo = (UserVO)obj;
       
       System.out.printf("************vo:",vo);
       
       List<ValuationVO> valuationList = valuationService.getValuationList2(vo.getMemberId());
       model.addAttribute("valuationList", valuationList);
       
       return "user/valuationList";
    }
    
    // 내가 작성한 레시피
    @Autowired 
    private RecipeService recipeService;
    
    @RequestMapping(value = "/myRecipeList", method = RequestMethod.GET)
    public String getRecipeList(HttpSession session, Model model) throws Exception{      
       logger.info("레시피 리스트");
       
       Object obj = session.getAttribute("login");
      UserVO vo = (UserVO)obj;

       List<RecipeVO> recipeList = recipeService.getRecipeList2(vo.getMemberId());
       model.addAttribute("recipeList", recipeList);
       
       return "user/recipeList";
    }  
    
    

}

/*
 * @Controller
 * 
 * @RequestMapping("/user") public class UserController {
 * 
 * @Inject private UserService service;
 * 
 * @RequestMapping(value = "/login", method = RequestMethod.GET) public void
 * loginGET(@ModelAttribute("dto") LoginDTO dto) {
 * 
 * }
 * 
 * // @RequestMapping(value = "/loginPost", method = RequestMethod.POST) //
 * public void loginPOST(LoginDTO dto, HttpSession session, Model model) //
 * throws Exception { // // UserVO vo = service.login(dto); // // if (vo ==
 * null) { // return; // } // // model.addAttribute("userVO", vo); // // }
 * 
 * @RequestMapping(value = "/loginPost", method = RequestMethod.POST) public
 * void loginPOST(LoginDTO dto, HttpSession session, Model model) throws
 * Exception {
 * 
 * UserVO vo = service.login(dto);
 * 
 * if (vo == null) { return; }
 * 
 * model.addAttribute("userVO", vo);
 * 
 * if (dto.isUseCookie()) {
 * 
 * int amount = 60 * 60 * 24 * 7;
 * 
 * Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
 * 
 * service.keepLogin(vo.getMemberId(), session.getId(), sessionLimit); }
 * 
 * }
 * 
 * @RequestMapping(value = "/logout", method = RequestMethod.GET) public String
 * logout(HttpServletRequest request, HttpServletResponse response, HttpSession
 * session) throws Exception {
 * 
 * Object obj = session.getAttribute("login");
 * 
 * if (obj != null) { UserVO vo = (UserVO) obj;
 * 
 * session.removeAttribute("login"); session.invalidate();
 * 
 * Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
 * 
 * if (loginCookie != null) { loginCookie.setPath("/");
 * loginCookie.setMaxAge(0); response.addCookie(loginCookie);
 * service.keepLogin(vo.getMemberId(), session.getId(), new Date()); } }
 * 
 * return "user/logout"; }
 * 
 * }
 */
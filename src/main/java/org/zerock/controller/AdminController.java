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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.CommentVO;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.RecipeDetailVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.domain.UtensilVO;
import org.zerock.domain.ValuationVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.CommentService;
import org.zerock.service.IngredientService;
import org.zerock.service.RecipeService;
import org.zerock.service.UserService;
import org.zerock.service.UtensilService;
import org.zerock.service.ValuationService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

   @RequestMapping(value = "/index", method = RequestMethod.GET)
   public String getIndex() throws Exception{
	   logger.info("관리자 페이지");
	   return "admin/index";
   }   
   
   @Inject
   UtensilService utensilService;
   @Inject
   IngredientService ingredientService;
   @Inject
   CommentService commentService;
   
   // 회원관리
   @Autowired 
   private UserService userService;  
   
   @RequestMapping(value = "/getUserList", method = RequestMethod.GET)
   public String getUserList(HttpSession session, Model model) throws Exception{	   
	   logger.info("회원 리스트");

	   List<UserVO> userList = userService.getUserList();
	   model.addAttribute("userList", userList);
	   
	   return "admin/userList";
   }
   
   @RequestMapping(value = "/getUserDetail", method = RequestMethod.GET)
   public String getUserDetail(Model model, String memberId) throws Exception {
	   UserVO user = userService.getUserDetail(memberId);
	   model.addAttribute("user",user);
	   
	   return "admin/userDetail";
   }
   
   // 회원정보 수정
   @RequestMapping(value = "/userModify", method = RequestMethod.POST)
   public String userModify(UserVO vo, HttpSession session) throws Exception {
	   userService.adminUserUpdate(vo);
	   session.invalidate();
	   
	   return "admin/index";
   }
   
   // 회원 탈퇴
   @RequestMapping(value = "/userDelete", method = RequestMethod.POST)
   public String userDelete(UserVO vo, HttpSession session) throws Exception {

	   // Q&A 삭제
	   List<CommentVO> commentlist = commentService.listComment2(vo.getMemberId());
	   for(int i=0;i<commentlist.size();i++) {
		   CommentVO comment = commentlist.get(i);
		   commentService.removeComment(comment.getCno());		   
	   }
	   
	   // 댓글 삭제
	   List<ValuationVO> valuationlist = valuationService.getValuationList2(vo.getMemberId());
	   for(int i=0;i<valuationlist.size();i++) {
		   ValuationVO valuation = valuationlist.get(i);
		   valuationService.delete(valuation);		   
	   }
	   
	   // 레시피 삭제
	   List<RecipeVO> recipelist = recipeService.getRecipeList2(vo.getMemberId());	   
	      
	   for(int i=0;i<recipelist.size();i++) {
		   RecipeVO recipe = recipelist.get(i);
		   Integer recipeno = recipe.getRECIPENO();
	    	  
		   System.out.println("*********후기삭제완료*********");  
		   valuationService.deleteRecipeValuation(recipeno);
		   System.out.println("*********도구삭제완료*********");      
	       utensilService.deleteUtensil(recipeno);
	       System.out.println("*********재료삭제완료*********");
	       ingredientService.deleteIngredient(recipeno);   
	       System.out.println("*********세부내용삭제완료*********");
	       recipeService.deleteRecipeDetail(recipeno);
	       System.out.println("*********레시피삭제완료*********");
	       recipeService.delete(recipeno);
	  }
      
      userService.adminUserDelete(vo);
      session.invalidate();

      return "admin/index";
      
   }
   
   // 레시피 관리
   @Autowired 
   private RecipeService recipeService;
   
   @RequestMapping(value = "/getRecipeList", method = RequestMethod.GET)
   public String getRecipeList(HttpSession session, Model model) throws Exception{	   
	   logger.info("레시피 리스트");

	   List<RecipeVO> recipeList = recipeService.getRecipeList();
	   model.addAttribute("recipeList", recipeList);
	   
	   return "admin/recipeList";
   }  
   @RequestMapping(value = "/getRecipeDetail", method = RequestMethod.GET)
   public String getRecipeDetail(@RequestParam("RECIPENO") int RECIPENO, Model model) throws Exception {
	   RecipeVO recipe = recipeService.view(RECIPENO);
	   model.addAttribute("recipe",recipe);
	   
	   // 세부사항
	   List<RecipeDetailVO> list = recipeService.getRecipeDetailList(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("list", list);
	   System.out.println("***************LIST: " + list);
	   
	   // 썸네일
	   String show = recipeService.show(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("show", show);
	   System.out.println("******썸네일");
	   
	   // 별점 평균
	   int avg = valuationService.avg(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("avg", avg);
	   
	   // 도구
	   List<UtensilVO> getUtensilList = utensilService.getUtensilList(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("getUtensilList", getUtensilList);
	   
	   // 재료
	   List<IngredientVO> getIngredientList = ingredientService.getIngredientList(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("getIngredientList", getIngredientList);		
		
	   
	   return "admin/recipeDetail";
   }
      
   // 댓글관리
   @Autowired
   private ValuationService valuationService;  
   
   @RequestMapping(value = "/getValuationList", method = RequestMethod.GET)
   public String getValuationList(HttpSession session, Model model) throws Exception{	   
	   logger.info("댓글 리스트");

	   List<ValuationVO> valuationList = valuationService.getValuationList();
	   model.addAttribute("valuationList", valuationList);
	   
	   return "admin/valuationList";
   }
   @RequestMapping(value = "/getValuationDetail", method = RequestMethod.GET)
   public String getValuationDetail(Model model, String comments) throws Exception {
	   ValuationVO valuation = valuationService.getValuationDetail(comments);
	   model.addAttribute("valuation",valuation);
	   
	   return "admin/valuationDetail";
   }
   
   // 댓글규제
   @RequestMapping(value = "/valuationRestrict", method = RequestMethod.POST)
   public String valuatinoRestrict(ValuationVO vo, HttpSession session) throws Exception {
	   System.out.println("***********댓글규제");
	   System.out.println("***********vo:"+vo);
	   
	   valuationService.valuationRestrict(vo);
	   session.invalidate();
	   
	   return "admin/index";
   }	
}
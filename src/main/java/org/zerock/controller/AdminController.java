package org.zerock.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.CommentVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.RecipeDetailVO;
import org.zerock.domain.RecipeRequest;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.domain.UtensilVO;
import org.zerock.domain.ValuationVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.CommentService;
import org.zerock.service.FoodService;
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
	   logger.info("????????? ?????????");
	   return "admin/index";
   }   
   
   @Inject
   UtensilService utensilService;
   @Inject
   IngredientService ingredientService;
   @Inject
   CommentService commentService;
   
   // ????????????
   @Autowired 
   private UserService userService;  
   
   @RequestMapping(value = "/getUserList", method = RequestMethod.GET)
   public String getUserList(HttpSession session, Model model) throws Exception{	   
	   logger.info("?????? ?????????");
	   
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
   
   // ???????????? ??????
   @RequestMapping(value = "/userModify", method = RequestMethod.POST)
   public String userModify(UserVO vo, HttpSession session) throws Exception {
	   userService.adminUserUpdate(vo);
	   
	   return "admin/index";
   }
   
   // ?????? ??????
   @RequestMapping(value = "/userDelete", method = RequestMethod.POST)
   public String userDelete(UserVO vo, HttpSession session) throws Exception {

	   // Q&A ??????
	   List<CommentVO> commentlist = commentService.listComment2(vo.getMemberId());
	   for(int i=0;i<commentlist.size();i++) {
		   CommentVO comment = commentlist.get(i);
		   commentService.removeComment(comment.getCno());		   
	   }
	   
	   // ?????? ??????
	   List<ValuationVO> valuationlist = valuationService.getValuationList2(vo.getMemberId());
	   for(int i=0;i<valuationlist.size();i++) {
		   ValuationVO valuation = valuationlist.get(i);
		   valuationService.delete(valuation);		   
	   }
	   
	   // ????????? ??????
	   List<RecipeVO> recipelist = recipeService.getRecipeList2(vo.getMemberId());	   
	      
	   for(int i=0;i<recipelist.size();i++) {
		   RecipeVO recipe = recipelist.get(i);
		   Integer recipeno = recipe.getRECIPENO();
	    	  
		   System.out.println("*********??????????????????*********");  
		   valuationService.deleteRecipeValuation(recipeno);
		   System.out.println("*********??????????????????*********");      
	       utensilService.deleteUtensil(recipeno);
	       System.out.println("*********??????????????????*********");
	       ingredientService.deleteIngredient(recipeno);   
	       System.out.println("*********????????????????????????*********");
	       recipeService.deleteRecipeDetail(recipeno);
	       System.out.println("*********?????????????????????*********");
	       recipeService.delete(recipeno);
	  }
      
      userService.adminUserDelete(vo);
      session.invalidate();

      return "admin/index";
      
   }
   
   // ????????? ??????
   @Autowired 
   private RecipeService recipeService;
   
   @RequestMapping(value = "/getRecipeList", method = RequestMethod.GET)
   public String getRecipeList(HttpSession session, Model model) throws Exception{	   
	   logger.info("????????? ?????????");

	   List<RecipeVO> recipeList = recipeService.getRecipeList();
	   model.addAttribute("recipeList", recipeList);
	   
	   return "admin/recipeList";
   }  
   @RequestMapping(value = "/getRecipeDetail", method = RequestMethod.GET)
   public String getRecipeDetail(@RequestParam("RECIPENO") int RECIPENO, Model model) throws Exception {
	   RecipeVO recipe = recipeService.view(RECIPENO);
	   model.addAttribute("recipe",recipe);
	   System.out.println("recipe:   " + recipe);
	   // ????????????
	   List<RecipeDetailVO> list = recipeService.getRecipeDetailList(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("list", list);
	   System.out.println("***************LIST: " + list);
	   
	   // ?????????
	   String show = recipeService.show(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("show", show);
	   System.out.println("******?????????");
	   
	   // ?????? ??????
	   int avg = valuationService.avg(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("avg", avg);
	   
	   // ??????
	   List<UtensilVO> getUtensilList = utensilService.getUtensilList(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("getUtensilList", getUtensilList);
	   
	   // ??????
	   List<IngredientVO> getIngredientList = ingredientService.getIngredientList(RECIPENO);
	   model.addAttribute("RecipeVO", recipe);
	   model.addAttribute("getIngredientList", getIngredientList);		
		
	   
	   return "admin/recipeDetail";
   }
   
   // ????????? ??????
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("RECIPENO") int recipeno, ValuationVO vo) throws Exception {

		System.out.println("recipeno******" + vo.getRecipeno());
		valuationService.deleteRecipeValuation(recipeno);
		System.out.println("?????? ?????? ??????");
		utensilService.deleteUtensil(recipeno);
		System.out.println("?????? ?????? ??????");
		ingredientService.deleteIngredient(recipeno);
		System.out.println("?????? ?????? ??????");
		recipeService.deleteRecipeDetail(recipeno);
		System.out.println("?????? ?????? ?????? ?????? ******************");

		recipeService.delete(recipeno);
		System.out.println("????????? ?????? ?????? *******************");

		return "redirect:/admin/index";
	}
  
      
   // ????????????
   @Autowired
   private ValuationService valuationService;  
   
   @RequestMapping(value = "/getValuationList", method = RequestMethod.GET)
   public String getValuationList(HttpSession session, Model model) throws Exception{	   
	   logger.info("?????? ?????????");

	   List<ValuationVO> valuationList = valuationService.getValuationList();
	   model.addAttribute("valuationList", valuationList);
	   
	   return "admin/valuationList";
   }
   @RequestMapping(value = "/getValuationDetail", method = RequestMethod.GET)
   public String getValuationDetail(ValuationVO vo, Model model) throws Exception {	   
	   ValuationVO valuation = valuationService.getValuationDetail(vo);	
	   
	   System.out.println("**********valuation:"+valuation);
	   
	   model.addAttribute("valuation",valuation);
	   
	   return "admin/valuationDetail";
   }
   
   // ????????????
   @RequestMapping(value = "/valuationRestrict", method = RequestMethod.POST)
   public String valuationRestrict(ValuationVO vo) throws Exception {
	   System.out.println("***********????????????");
	   System.out.println("***********vo:"+vo);
	   
	   valuationService.valuationRestrict(vo);
	   
	   return "admin/index";
   }	
   
   // ????????????
   @RequestMapping(value = "/valuationDelete", method = RequestMethod.POST)
   public String valuationDelete(ValuationVO vo, HttpSession session) throws Exception {
	   valuationService.delete(vo);			   
	   
	   return "admin/index";
   }	
}
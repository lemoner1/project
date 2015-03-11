package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(method = RequestMethod.POST)
public class Common 
{
	
	@RequestMapping("/common/reg.do")
	protected ModelAndView Reg(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("Reg 페이지 가기...");		
		String function = request.getParameter("func");
		System.out.println("function : "+function);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("Frame");		// 처리 결과를 보여주는 페이지의 별칭
		mav.addObject("mainUrl", "/Main.jsp");

		return mav;
	}
	
	@RequestMapping("/common/product.do")
	protected ModelAndView ProdZuct(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("product 페이지 가기...");		
	
		String function = null;
		System.out.println("function : "+function);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("Frame");		// 처리 결과를 보여주는 페이지의 별칭
		mav.addObject("mainUrl", "Main.jsp");
		
		return mav;
	}

}

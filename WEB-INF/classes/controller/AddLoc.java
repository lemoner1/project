package controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import vo.daum.Daum;
import dao.daum.DaumDao;


public class AddLoc extends AbstractController
{
	public AddLoc()
	{}
	
	private DaumDao daumDao;
	private Daum daumVo;

	public void setDaumDao(DaumDao daumDao) {
		this.daumDao = daumDao;
	}

	public void setDaumVo(Daum daumVo) {
		this.daumVo = daumVo;
	}

	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("AddLoc page 가기...");
		
		String[] LAT = request.getParameterValues("LAT");
		String[] LNG = request.getParameterValues("LNG");
		
		System.out.println("LAT : " +LAT);
		System.out.println("LNG : " +LNG);

		ModelAndView mav=new ModelAndView();
		mav.setViewName("Frame");		// 처리 결과를 보여주는 페이지의 별칭
		mav.addObject("mainUrl", "/Main.jsp");

		return mav;
	}

}

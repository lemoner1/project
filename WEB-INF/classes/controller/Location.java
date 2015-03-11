package controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import vo.daum.Daum;
import vo.school.School;
import dao.daum.DaumDao;
import dao.school.SchoolDao;


public class Location extends AbstractController
{
	public Location()
	{}
	
	private SchoolDao schoolDao;
	private School schoolVo;


	public void setSchoolDao(SchoolDao schoolDao) {
		this.schoolDao = schoolDao;
	}


	public void setSchoolVo(School schoolVo) {
		this.schoolVo = schoolVo;
	}


	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("Location page ����...");
		
		ArrayList school_address = (ArrayList)schoolDao.getAddress();
		System.out.println(school_address);

		ModelAndView mav=new ModelAndView();
		mav.setViewName("location_control");		// ó�� ����� �����ִ� �������� ��Ī
		mav.addObject("mainUrl", "/location_control.jsp");
		mav.addObject("daum_address", school_address);

		return mav;
	}

}

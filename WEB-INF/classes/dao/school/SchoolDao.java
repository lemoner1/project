package dao.school;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class SchoolDao 
{
	private SqlMapClientTemplate smct;

	public SchoolDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}
	

	public ArrayList getAddress()
	{
		System.out.println("===============================");
		System.out.println("get School");
		return (ArrayList)smct.queryForList("getSchool");
	}

}

package com.wt.loc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.wt.frame.Biz;
import com.wt.vo.Loc;

public class Test {
	
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("spring-view.xml");
		
		Biz biz = (Biz) ctx.getBean("locBiz");
		
		List<Loc> list = null; 
		try {
			list = biz.get();
			for(Loc u : list) {
				System.out.println(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

}







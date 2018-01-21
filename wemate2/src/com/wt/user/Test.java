package com.wt.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.AbstractXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.wt.frame.Biz;
import com.wt.frame.Dao;
import com.wt.vo.User;

public class Test {
	
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("spring-view.xml");
		
		Biz biz = (Biz) ctx.getBean("userBiz");
		
		//User user = new User("dudtj", "dudtj", "±è¿µ¼­", 1);
		
		
		/*try {
			biz.register(user);
			User user2 = (User) biz.get("dudtj");
			System.out.println(user2);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
		/*User user2 = new User("dudtj", "dudtj22", "±è¿µ¼­", 1);
		
		try {
			biz.modify(user2);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
		
		/*try {
			biz.remove("dudtj");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
/*		List<User> list = null; 
		try {
			list = biz.get();
			for(User u : list) {
				System.out.println(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}*/

	}

}







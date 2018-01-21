package com.wt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wt.frame.Biz;
import com.wt.vo.Pref_Loc;
import com.wt.vo.User;

@Controller
public class AdminController {
	
	@Resource(name="userBiz")
	Biz<User, String> userBiz;
	
	@Resource(name="preflocBiz")
	Biz<Pref_Loc, Integer> prefBiz;
	
	// ���� ��ü ��� ���
	@RequestMapping("adminlist.wt")
	public String adminlist(Model model) {
		List<User> userList = new ArrayList<>();
		userList = userBiz.get();
		
		model.addAttribute("userlist", userList);
		model.addAttribute("center", "admin/userlist");
		
		return "main";
	}
	
	// ȸ������ �� ������ ��ȣ ���� ��� ���
	@RequestMapping("adminpref.wt")
	public String adminpref(Model model) {
		
		List<Pref_Loc> prefList = new ArrayList<>();
		prefList = prefBiz.get();
		
		model.addAttribute("preflist", prefList);
		model.addAttribute("center", "admin/preflist");
		
		return "main";
	}
	
	// ������Ʈ�� ���� ���� �� ���
	@RequestMapping("adminupdateuser.wt")
	public String adminupdateuser(Model model, String id) {
		User user = userBiz.get(id);
		model.addAttribute("user", user);
		model.addAttribute("center", "admin/userdetail");
		return "main";
	}
	
	// ������ ADMIN�� ������Ʈ
	@RequestMapping("adminuser.wt")
	public String adminuser(User u) {
		System.out.println(u);
		userBiz.modify(u);
		return "redirect:adminlist.wt";
	}

}

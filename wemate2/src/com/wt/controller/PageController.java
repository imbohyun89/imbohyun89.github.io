package com.wt.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.frame.Biz;
import com.wt.vo.Loc;
import com.wt.vo.Pref_Loc;
import com.wt.vo.User;

@Controller
public class PageController {
	
	@Resource(name="locBiz")
	Biz<Loc, Integer> locBiz;
	@Resource(name="preflocBiz")
	Biz<Pref_Loc, String> prefBiz;
	
	@RequestMapping("/main.wt")
	public String main(Model model, HttpServletRequest request) {
		System.out.println("here is main.wt");
		
		/*---- �α��� ���ο� ���� �ؿ� �� ���� 4�� ���� �ڵ�---- */
		// �α��� ����
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginuser");
		int count = 0;
		List<Loc> loclist1 = new ArrayList<>(); //���� ��ȣ ����
		List<Loc> loclist2 = new ArrayList<>(); //��ũ ��ȣ ����
		List<Pref_Loc> preflist = new ArrayList<>();
		
		if (user != null) { // �α��� �� ���
			preflist = prefBiz.getId(user.getId()); //�����Ѽ�ȣ����
			
			List<Loc> likeyLoc = locBiz.joinlikey(user.getId());
	        System.out.println(likeyLoc);
	        session.setAttribute("likeyLoc", likeyLoc);
			
			for(Pref_Loc p : preflist) {
				Loc loc = locBiz.get(p.getCity_num());
				loclist1.add(loc);
				count++;
			}
			if(count == 1) {
				loclist2 = locBiz.getPrefRank(3);
			} else if(count == 2) {
				loclist2 = locBiz.getPrefRank(2);
			} else {
				loclist2 = locBiz.getPrefRank(1);
			}
		} else { // �α��� ���� ���
			loclist2 = locBiz.getPrefRank(4);	
		}
		/*----------------------------------------*/
		
		/*--------------main ū���� ���--------------*/
		List<Loc> mainlist = new ArrayList<>();
		mainlist = locBiz.getPrefRank(1);
		mainlist.add(locBiz.get(54511));
		/*----------------------------------------*/
		
		
		model.addAttribute("preflist", loclist1);
		model.addAttribute("ranklist", loclist2);
		model.addAttribute("mainlist", mainlist);
		model.addAttribute("pagename","WE ARE MATE");
		return "main";
	}
	
	@RequestMapping("/aboutus.wt")
	public String support(Model model) {
		model.addAttribute("center","aboutus");
		model.addAttribute("pagename","Support");
		return "main";
	}

	@RequestMapping("/compare.wt")
	public String compare(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		List<Loc> myLoc = locBiz.joinloc(id);
		List<Loc> likeyLoc = locBiz.joinlikey(id);
		int checkboxLength = (myLoc.size()+likeyLoc.size());
		model.addAttribute("checkBoxLength", checkboxLength);
		
		model.addAttribute("myLoc", myLoc);
		model.addAttribute("likeyLoc", likeyLoc);
		model.addAttribute("center","compare");
		model.addAttribute("pagename","For Better Choice");
		return "main";
	}
	
	@RequestMapping("/search.wt")
	public String search(Model model) {
		model.addAttribute("center","search");
		model.addAttribute("pagename","Find your place");
		return "main";
	}
	
	@RequestMapping("/mainprefrank.wt")
	public String mainprefrank(Model model) {
		model.addAttribute("center","charts/mainprefrank");
		model.addAttribute("pagename","Prefer Location Rank");
		return "main";
	}

	@RequestMapping("/main_searchrank.wt")
	public String mainsearchrank(Model model) {
		model.addAttribute("center", "charts/main_searchrank");
		model.addAttribute("pagename", "Search Rank");
		return "main";
	}

	@RequestMapping("/maindepart.wt")
	public String maindepart(Model model) {
		model.addAttribute("center","charts/maindepartrank");
		model.addAttribute("pagename","Departure Population Rank");
		return "main";
	}
	
}

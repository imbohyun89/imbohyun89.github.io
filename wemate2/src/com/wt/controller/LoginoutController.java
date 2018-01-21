package com.wt.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wt.frame.Biz;
import com.wt.vo.ContiCountry;
import com.wt.vo.Likey;
import com.wt.vo.Loc;
import com.wt.vo.Pref_Loc;
import com.wt.vo.User;

@Controller
public class LoginoutController {
	
	@Resource(name = "userBiz")
	Biz<User, String> biz;
	@Resource(name = "locBiz")
	Biz<Loc, Integer> lbiz;
	@Resource(name = "preflocBiz")
	Biz<Pref_Loc, String> pfbiz;
	@Resource(name = "contiCountryBiz")
	Biz<ContiCountry, String> ccbiz;
	@Resource(name = "likeyBiz")
	Biz<Likey, String> likeyBiz;
	
	// LOGIN 버튼 클릭시
	@RequestMapping("/login.wt")
	public String login(Model model) {
		model.addAttribute("center", "login");
		model.addAttribute("pagename","Login");
		return "main";
	}
	
	// login.jsp 에서 로그인 시
	@RequestMapping("/loginimpl.wt")
	public String loginimpl(HttpServletRequest request, String id, String pwd, 
							Model model) {
		User user = null;
		try {
			user = biz.get(id);
			if(pwd.equals(user.getPwd())) { // 패스워드가 맞을 때
				HttpSession session = request.getSession();
				session.setAttribute("loginuser", user);
				List<Loc> likeyLoc = lbiz.joinlikey(user.getId());
	            System.out.println(likeyLoc);
	            session.setAttribute("likeyLoc", likeyLoc);
			} else { // 패스워드 틀릴 때
				model.addAttribute("nopwd", "nopwd");
				model.addAttribute("center", "login");
				System.out.println("pwd틀림");
			}
		} catch(Exception e) { // 아이디가 db에 존재하지 않을 때
			model.addAttribute("noid", "noid");
			model.addAttribute("center", "login");
			System.out.println("id없음");
		}
		return "redirect:main.wt";
	}
	
	// 로그아웃
	@RequestMapping("/logout.wt")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		return "redirect:main.wt";
	}
	// 회원가입 화면에서 선호하는 대륙 선택 -> 해당하는 나라 출력
	@RequestMapping("/prefer_cty_print.wt")
	@ResponseBody
	public void prefer_cty_print(HttpServletRequest request, HttpServletResponse response) {
		String conti_name = request.getParameter("conti_name");
		List<ContiCountry> list = null;
		System.out.println("select box : prefer_cty_print.wt");
		try {
			list = ccbiz.getCty(conti_name);
			JSONArray ja = new JSONArray();
			
			for(ContiCountry cc : list) {
				JSONObject jo = new JSONObject();
				jo.put("country_name_kor", cc.getCountry_name_kor());
				jo.put("country_name_eng", cc.getCountry_name_eng());
				ja.add(jo);
			}
			
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			out.print(ja.toJSONString());
			out.close();

		} catch(Exception e) {
			e.printStackTrace();
		}// try~catch
		
		
	}
	
	// 회원가입 화면에서 선호하는 나라 선택 -> 해당하는 지역 출력
	@RequestMapping("/prefer_loc_print.wt")
	public void prefer_loc_print(HttpServletRequest request, HttpServletResponse response) {
		String country_name = request.getParameter("country_name");
		List<ContiCountry> list = null;
		try {
			list = ccbiz.getLoc(country_name.toUpperCase());
			JSONArray ja = new JSONArray();
			
			for(ContiCountry cc : list) {
				System.out.println("cc : " + cc);
				
				JSONObject jo = new JSONObject();
				jo.put("city_name_kor", cc.getCity_name_kor());
				jo.put("city_name_eng", cc.getCity_name_eng());
				jo.put("city_num", cc.getCity_num());
				ja.add(jo);
			}
			
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			out.print(ja.toJSONString());
			out.close();

		} catch(Exception e) {
			e.printStackTrace();
		}// try~catch
	}
}

package com.wt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.wt.frame.Biz;
import com.wt.vo.Loc;
import com.wt.vo.Pref_Loc;
import com.wt.vo.User;

@Controller
public class UserController {
	@Resource(name = "userBiz")
	Biz<User, String> biz;
	@Resource(name = "locBiz")
	Biz<Loc, Integer> lbiz;
	@Resource(name = "preflocBiz")
	Biz<Pref_Loc, String> pfbiz;

	@RequestMapping("/userlist.wt")
	public String getUser(Model model) {
		List<User> list;
		try {
			list = biz.get();
			model.addAttribute("ulist", list);
			System.out.println("here is userlist.hw");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "main";
	}
	
	// REGISTER 버튼 클릭시
	@RequestMapping("/register.wt")
	public String register(Model model) {
		model.addAttribute("center", "register");
		model.addAttribute("pagename","Register");
		return "main";
	}
	
	// register.jsp 에서 회원가입 시
	@RequestMapping("/useraddimpl.wt")
	public String useraddimpl(HttpServletRequest request, User user) throws UnsupportedEncodingException {
		int cnt = Integer.parseInt(request.getParameter("i"));
		ArrayList<String> locStrList = new ArrayList<>();
		for(int i=0; i<cnt; i++) {
			String str = request.getParameter("preferloc"+i);
			System.out.println(str);
			locStrList.add(str);
		}
		
		ArrayList<Loc> locList = new ArrayList<>();
		for(String strCC : locStrList) {
			System.out.println(strCC);
			int cc = Integer.parseInt(strCC);
			Pref_Loc pfl = new Pref_Loc(cc, user.getId());
			pfbiz.register(pfl);
		}
		
		biz.register(user);
		return "redirect:main.wt";
	}
	// userdetail.jsp
	@RequestMapping("/userdetail.wt")
	public String getUserDetail(@RequestParam(value = "id", defaultValue = "", required = true) String id,
			Model model) {
		User user = biz.get(id);
		System.out.println(user.getId());

		List<Loc> loc_list = new ArrayList<>();
		loc_list = lbiz.joinloc(user.getId());
		System.out.println(loc_list);

		model.addAttribute("user", user);
		model.addAttribute("loc_list", loc_list);
		model.addAttribute("center", "user/userdetail");
		return "main";
	}

	// userdetail.jsp 에서 선호지역 삭제
	@RequestMapping("/preflocdelete.wt")
	public String getPrefLocDelete(int num, Model model, HttpServletRequest request) {
		pfbiz.remove(Integer.toString(num));
		String id = request.getParameter("id");
		User user = biz.get(id);
		model.addAttribute("user", user);
		return "redirect:userdetail.wt?id=" + id;
	}

	// userdetail.jsp 에서 update
	@RequestMapping("/userupdate.wt")
	public String userUpdate(HttpServletRequest request, User user, String newpwd) throws UnsupportedEncodingException {
		// 선호지역 변경시
		if (!(request.getParameter("i") == null || request.getParameter("i").equals("null")
				|| request.getParameter("i").equals(""))) {
			int cnt = Integer.parseInt(request.getParameter("i"));
			System.out.println(cnt);
			ArrayList<String> locStrList = new ArrayList<>();
			for (int i = 0; i < cnt; i++) {
				String str = request.getParameter("preferloc" + i);
				System.out.println(str);
				locStrList.add(str);
			}

			ArrayList<Loc> locList = new ArrayList<>();
			for (String strCC : locStrList) {
				System.out.println(strCC);
				int cc = Integer.parseInt(strCC);
				Pref_Loc pfl = new Pref_Loc(cc, user.getId());
				pfbiz.register(pfl);
			}

		}

		// 비밀번호 변경 확인
		if (newpwd.equals("")) {
			System.out.println(1 + user.getId());
			biz.modify(user);
		} else {
			System.out.println(2 + user.getId());
			user.setPwd(newpwd);
			biz.modify(user);
		}

		System.out.println(user.getId());
		return "redirect:userdetail.wt?id=" + user.getId();
	}

	@RequestMapping("/userdelete.wt")
	public String userDelete(HttpServletRequest request, String id) {
		// 회원삭제
		biz.remove(id);
		// 로그인해제
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		// 선호지역 삭제
		List<Pref_Loc> preflist = pfbiz.getId(id);
		for(Pref_Loc prefloc : preflist) {
			pfbiz.remove(Integer.toString(prefloc.getnum()));
		}
		return "main";
	}

	@RequestMapping("/prefloc_delete.wt")
	public void prefloc_Delete(int num, HttpServletRequest request, HttpServletResponse response) {
		try {
			// 지역번호로 user_id가져오기
			String id = pfbiz.get(Integer.toString(num)).getUser_id();
			System.out.println(id);
			// 선호지역 삭제
			pfbiz.remove(Integer.toString(num));
			// 삭제 후 유저의 선호지역 목록 조회
			List<Loc> list = lbiz.joinloc(id);
			System.out.println(list);
			JSONArray ja = new JSONArray();
			for (Loc loc : list) {
				JSONObject jo = new JSONObject();
				jo.put("city_name_kor", loc.getCity_name_kor());
				System.out.println(loc.getCity_name_kor());
				jo.put("num", loc.getNum());
				/*jo.put("id", loc.getId());*/
				ja.add(jo);
			}
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print(ja.toJSONString());
			out.close();
		} catch (IOException e) {
			System.out.println("b");
			e.printStackTrace();
		}

	}

	

}

package com.wt.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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

import com.wt.frame.Biz;
import com.wt.vo.ContiCountry;
import com.wt.vo.Likey;
import com.wt.vo.Loc;
import com.wt.vo.Pref_Loc;
import com.wt.vo.User;

@Controller
public class CompareController {
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

	Connection con;
	ResultSet rset;
	Statement stmt;
	
	//compare.jsp 에서 사용. 불쾌지수
	@RequestMapping("/thichart.wt")
	public void thichart(String locA, String locB, String monthA, String monthB, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		System.out.println("thichart start");
		System.out.println(locA);
		System.out.println(locB);
		ContiCountry ccA = ccbiz.get(locA.toUpperCase());
		ContiCountry ccB = ccbiz.get(locB.toUpperCase());
		String preferA = ccA.getConti_name_eng();
		String preferB = ccB.getConti_name_eng();
		int loc_numA = ccA.getCity_num();
		int loc_numB = ccB.getCity_num();

		connectionHive();
		String sql = "";
		sql = "select loc_num, loc, substr(period,6,5) as period, round((1.8*avg(temp)),1)-round(0.55*(1-(avg(humid))/100)*((1.8*avg(temp))-26),1)+32 as THI from "
				+ preferA + " where loc_num=" + loc_numA
				+ " and substr(period,12,2) in ('09','12','15','18') and temp < 50 and substr(period, 6,2)=" + monthA
				+ " group by loc_num, loc, substr(period,6,5)";
		rset = stmt.executeQuery(sql);
		JSONArray ja = new JSONArray();
		JSONObject jo = new JSONObject();
		JSONArray ja2 = new JSONArray();
		int cnt=0;
		while (rset.next()) {
			
			if(cnt==0) {
				jo.put("name", rset.getString(2));
				cnt++;
			}
			ja2.add(rset.getDouble(4));
		}
		jo.put("data", ja2);
		ja.add(jo);
		rset.close();
		
		sql = "select loc_num, loc, substr(period,6,5) as period, round((1.8*avg(temp)),1)-round(0.55*(1-(avg(humid))/100)*((1.8*avg(temp))-26),1)+32 as THI from "
				+ preferB + " where loc_num=" + loc_numB
				+ " and substr(period,12,2) in ('09','12','15','18') and temp < 50 and substr(period, 6,2)=" + monthB
				+ " group by loc_num, loc, substr(period,6,5)";
		rset = stmt.executeQuery(sql);
		JSONObject jjo = new JSONObject();
		JSONArray ja22 = new JSONArray();
		int cnt2=0;
		while (rset.next()) {
			if(cnt2==0) {
				jjo.put("name", rset.getString(2));
				cnt2++;
			}
			ja22.add(rset.getDouble(4));
		}
		jjo.put("data", ja22);
		
		ja.add(jjo);
		
		con.close();
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.print(ja.toJSONString());
		out.close();
		System.out.println("Success....");
	}
	
	// compare.jsp 에서 사용
	@RequestMapping("/likeydelete.wt")
	public void likeydelete(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		HttpSession session = request.getSession();
		String sq_num = request.getParameter("sq_num");
		String next = request.getParameter("next");
		Likey ll = likeyBiz.get(sq_num);
		// 아이디를 가지고 와서 String에 저장시킨다
		String id = ll.getUser_id();

		// 관심지역 삭제
		likeyBiz.remove(sq_num);
		User user = biz.get(id);
		session.setAttribute("loginuser", user);
		List<Loc> likeyLoc = lbiz.joinlikey(id);
		session.setAttribute("likeyLoc", likeyLoc);

		JSONArray ja = new JSONArray();
		JSONObject jo = new JSONObject();

		jo.put("ok", 1);
		ja.add(jo);

		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.print(ja.toJSONString());
		out.close();
	}
	
	public void connectionHive() {
		try {
			Class.forName("org.apache.hive.jdbc.HiveDriver");

			con = DriverManager.getConnection("jdbc:hive2://192.168.111.200:10000/default", "root", "111111");
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// connectionHive
}

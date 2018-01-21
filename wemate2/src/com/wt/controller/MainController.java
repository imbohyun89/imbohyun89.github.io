package com.wt.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.frame.Biz;
import com.wt.vo.ContiCountry;
import com.wt.vo.Likey;
import com.wt.vo.Loc;
import com.wt.vo.Pref_Loc;
import com.wt.vo.User;

@Controller
public class MainController {
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
	
	// 서치 바 자동완성 기능
	@RequestMapping(value = "/autosearchbar.wt", method = RequestMethod.GET)
	public void autosearchbar(String searchbar, String term, HttpServletResponse response) {
		List<ContiCountry> ccList = null;
		ContiCountry cc2 = null;
		try {
			ccList = ccbiz.getLoc(term.toUpperCase());
			JSONArray ja = new JSONArray();
			if (ccList.size() == 0) { // 지역검색
				cc2 = ccbiz.get(term.toUpperCase());

				JSONObject jo = new JSONObject();
				jo.put("city_num", cc2.getCity_num());
				jo.put("city_name_kor", cc2.getCity_name_kor());
				jo.put("city_name_eng", cc2.getCity_name_eng());
				jo.put("country_name_kor", cc2.getCountry_name_kor());
				jo.put("country_name_eng", cc2.getCountry_name_eng());
				jo.put("num", 0);
				ja.add(jo);
			} else { // 나라검색
				for (ContiCountry cc : ccList) {
					JSONObject jo = new JSONObject();
					jo.put("city_num", cc.getCity_num());
					jo.put("city_name_kor", cc.getCity_name_kor());
					jo.put("city_name_eng", cc.getCity_name_eng());
					jo.put("country_name_kor", cc.getCountry_name_kor());
					jo.put("country_name_eng", cc.getCountry_name_eng());
					jo.put("num", 1);
					ja.add(jo);

				}
			}

			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print(ja.toJSONString());
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// center.jsp 세개 중 두번째 박스 클릭
	@RequestMapping("/mainprefcontirank.wt")
	public void mainprefcontirank(HttpServletResponse response) throws Exception {
		List<Loc> loclist1 = new ArrayList<>(); // 대륙 수

		loclist1 = lbiz.getPrefContiCnt();

		JSONArray outputJa = new JSONArray();
		JSONObject outputJo = new JSONObject();

		outputJo.put("name", "Conti");
		outputJo.put("colorByPoint", true);

		JSONArray inputJa = new JSONArray();
		int total = 0;
		for (Loc loc : loclist1) {
			total += loc.getCnt();
		}
		for (Loc loc : loclist1) {
			JSONObject inputJo = new JSONObject();
			inputJo.put("name", loc.getConti_name_kor());
			inputJo.put("y", loc.getCnt() / (total*1.0) * 100);
			inputJo.put("drilldown", loc.getConti_name_eng());
			inputJa.add(inputJo);
		}

		outputJo.put("data", inputJa);
		outputJa.add(outputJo);

		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.print(outputJa.toJSONString());
		out.close();
		System.out.println("Success....");
	}// mainprefcontirank

	@RequestMapping("/mainprefcityrank.wt")
	public void mainprefcityrank(HttpServletResponse response) throws Exception {
		List<Loc> loclist = new ArrayList<>(); // 지역 수
		List<Loc> loclist2 = new ArrayList<>(); // 대륙 수
		loclist = lbiz.getPrefCityCnt();
		loclist2 = lbiz.getPrefContiCnt();

		JSONObject outputJo = new JSONObject();
		JSONArray outputJa = new JSONArray();

		for (Loc loc : loclist2) {
			JSONObject jo = new JSONObject();
			JSONArray inputJa1 = new JSONArray();

			jo.put("name", loc.getConti_name_eng());
			int cnt = 0;
			int total = loc.getCnt();
			String str = loc.getConti_name_kor();
			for (Loc loc2 : loclist) {
				JSONArray inputJa2 = new JSONArray();
				if (str.equals(loc2.getConti_name_kor())) {
					if (cnt == 0) {
						jo.put("id", loc.getConti_name_eng());
						cnt++;
					}
					inputJa2.add(loc2.getCity_name_kor());
					inputJa2.add(loc2.getCnt() / (total * 1.0) * 100);
					inputJa1.add(inputJa2);
				}
			} // for

			jo.put("data", inputJa1);

			outputJa.add(jo);
		}

		outputJo.put("series", outputJa);

		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.print(outputJo.toJSONString());
		out.close();
		System.out.println("Success....");
	}// mainprefcityrank

	
	// main 첫번째 칸
	@RequestMapping("searchrank.wt")
	public void searchrank(HttpServletResponse response) throws Exception {
		RConnection rc = new RConnection();
		rc.setStringEncoding("utf8");
		rc.eval("source('D:/rtest/wemate/wemate_1.R', encoding='UTF-8')"); // 자바에서 원격으로 R을 핸들링
		String func = "rank()";
		RList rl = rc.eval(func).asList();
		System.out.println("rl.size : " + rl.size());
		String[] citys = rl.at("city").asStrings();
		int[] count = rl.at("count").asIntegers();
		JSONArray ja = new JSONArray();
		JSONObject jo = new JSONObject();
		JSONArray ja2 = new JSONArray();
		System.out.println("locs.length : " + citys.length);
		for (int i = 0; i < citys.length; i++) {
			JSONObject jo2 = new JSONObject();
			jo2.put("drilldown", citys[i]);
			jo2.put("name", citys[i]);
			jo2.put("y", count[i]);
			ja2.add(jo2);
		}
		jo.put("data", ja2);
		jo.put("colorByPoint", true);
		ja.add(jo);
		System.out.println(ja);
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		rc.close();
		out.print(ja.toJSONString());
		out.close();

	}

	
	@RequestMapping("/maindepartrank.wt")
	public void maindepartrank(HttpServletResponse response) throws Exception {
		System.out.println("maindepartrank");
		RConnection rc = new RConnection();
		
		rc.setStringEncoding("utf8"); // 결과값을 한글로 가져옴
		rc.eval("source('D:/rtest/wemate/wemate_1.R',encoding='UTF-8')"); // 자바에서 원격으로 R을 핸들링
							//encoding은 R 스크립트에있는 한글문제 해결
		RList rl = rc.eval("top5dept").asList();
		int [] sums = rl.at("sum").asIntegers();

        JSONArray ja = new JSONArray();
        
        String str[] = {"China", "Japan", "United States of America", "Thailand", "Philippine"};
        double result=0.0;
        for(int i=0;i<sums.length;i++) {
        	result += sums[i];
        }
        for(int i=0;i<sums.length;i++) {
        	JSONObject jo = new JSONObject();
        	jo.put("name", str[i]);
        	jo.put("y", sums[i]/(result*1.0)*100);
        	
        		
        	ja.add(jo);
        }
        JSONArray outputJa = new JSONArray();
        JSONObject outputJo = new JSONObject();
        
        outputJo.put("name", "population");
        outputJo.put("colorByPoint", true);
        outputJo.put("data", ja);
        outputJa.add(outputJo);
        
        response.setContentType("text/json;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.print(outputJa.toJSONString());
		out.close();
		System.out.println("Success....");
	}//maindepartrank
}

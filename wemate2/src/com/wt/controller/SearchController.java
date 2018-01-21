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
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wt.frame.Biz;
import com.wt.vo.ContiCountry;
import com.wt.vo.Likey;
import com.wt.vo.Loc;
import com.wt.vo.Pref_Loc;
import com.wt.vo.User;

@Controller
public class SearchController {

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
	

	
	// �˻���->search.jsp �� �̵�
	@RequestMapping("/searchtabreturn.wt")
	public String searchtabreturn(String searchbar, Model model) {
		List<ContiCountry> ccList = null; 	// ���� �˻��� ��� ����Ʈ
		ContiCountry cc = null;				// ���� �˻��� ���
		ContiCountry cc2 = null;			// ���� �˻��� ��� (����,����� ���)
		try {
			System.out.println(searchbar);
			ccList = ccbiz.getLoc(searchbar.toUpperCase());
			if (ccList.size() == 0) { // �����˻�
				cc = ccbiz.get(searchbar.toUpperCase());
				model.addAttribute("searchloc", cc);
			} else { // ����˻�
				for (ContiCountry co : ccList) {
					cc2 = co;
					break;
				}
				model.addAttribute("searchcty", cc2);
				model.addAttribute("city_select_alert", "���ø� �������ּ���.");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("center", "search");
		model.addAttribute("pagename","Find your place");
		return "main";
	}
	
	// search.jsp ���� CITY �˻���ư Ŭ�� ��  putLog()���� ����
	@RequestMapping("/searchbtnreturn.wt")
	public void searchbtnreturn(String loc, HttpServletResponse response) {
		ContiCountry cc = ccbiz.get(loc.toUpperCase());
		
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		
		try {
				jo.put("temp", 1);
				ja.add(jo);
			
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print(ja.toJSONString());
			out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// main �������� ��ȣ���� [SEE INFO] �Ǵ� [SEE MORE] -> search.jsp �̵�
	@RequestMapping("/mainlistreturn.wt")
	public String mainlistreturn(HttpServletRequest request, Model model) {
		ContiCountry cc = null;	// ���� �˻�
		String city_name = request.getParameter("city_name_eng");
		try {
			
			cc = ccbiz.get(city_name.toUpperCase());
			model.addAttribute("searchloc", cc);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("center", "search");
		model.addAttribute("pagename","Find your prefer location");
		return "main";
	}
	
	@RequestMapping(value="/whatclicksearchbtn.wt", method = RequestMethod.GET)
	public void whatclicksearchbtn(HttpServletResponse response, int num) {
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		
		try {
			if(num%2 == 0) {
				jo.put("temp", 0);
				ja.add(jo);
			} else if(num%2 == 1) {
				jo.put("temp", 1);
				ja.add(jo);
			}
			
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print(ja.toJSONString());
			out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * �������� WT_LIKEY ���� ��Ʈ�ѷ� ��� : search.jsp �ۼ��� : ����
	 */
	@RequestMapping(value = "/likeyinsert.wt", method = RequestMethod.GET)
	public void likeyinsert(String city_name_eng, HttpServletRequest request, HttpServletResponse response) {
		ContiCountry cc = ccbiz.get(city_name_eng.toUpperCase());
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginuser");
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		try {
			if (user != null) {
				Likey likey = new Likey(user.getId(), cc.getCity_num());
				List<Likey> lklist = likeyBiz.getId(likey.getUser_id());
				int cnt = 0;
				if (lklist.size() != 0) {
					for (Likey lk : lklist) {
						if (likey.getCity_num() == lk.getCity_num())
							cnt++;
					}
					if (cnt != 0) { // �̹� ��ϵǾ��ִ� ��������
						jo.put("temp", 2);
						ja.add(jo);
					} else { // ��� �ȵǾ����� => ����Ѵ�
						likeyBiz.register(likey);
						jo.put("temp", 1); // �α����� �Ǿ������� �������� DB�� ����� 1�� �Ѱ���
						ja.add(jo);
					}
				} else { // WT_LIKEY �� ���̵� ��ϵǾ� ���� ����
					likeyBiz.register(likey);
					jo.put("temp", 1);
					ja.add(jo);
				}
			} else {
				jo.put("temp", 0); // �α����� �ȵǾ������� 0�� �Ѱ��־� �α����� ������
				ja.add(jo);
			}
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print(ja.toJSONString());
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// likeyinsert
	
	/*
	 * ��� : search.jsp ���� CITY SEARCH ������ highcharts �� ����
	 */
	@RequestMapping("/cityajax.wt")
	public void cityajax(String loc, int btn, HttpServletResponse response) {
		ContiCountry cc = ccbiz.get(loc.toUpperCase());

		connectionHive();

		String sql = "";
		try {
			sql = "select loc_num, loc, SUBSTRING(period,1,2) as period, round(avg(min),1) as avg_min, round(avg(max),1) as avg_max from(select loc_num, loc, SUBSTRING(period, 6, 5) as period, min(temp) as min, max(temp) as max from "
					+ cc.getConti_name_eng() + " where loc_num=" + cc.getCity_num()
					+ " group by loc_num, loc, SUBSTRING(period, 6, 5)) as tbl group by loc_num, loc, SUBSTRING(period,1,2)";

			rset = stmt.executeQuery(sql);
			JSONArray outputJa = new JSONArray();
			JSONArray ja = new JSONArray();
			JSONObject jo1 = new JSONObject();

			int i = 1;
			while (rset.next()) {
				JSONObject jo = new JSONObject();
				if (i < 10) {
					jo.put("drilldown", "MONTH 0" + rset.getInt(3));
					i++;
				} else {
					jo.put("drilldown", "MONTH " + rset.getInt(3));
				}

				if (btn == 1) { // max
					jo.put("y", rset.getDouble(5));
				} else if (btn == -1) { // min
					jo.put("y", rset.getDouble(4));
				}
				jo.put("name", "MONTH " + rset.getInt(3));

				ja.add(jo);
			}
			jo1.put("data", ja);
			jo1.put("colorByPoint", true);
			outputJa.add(jo1);
			con.close();
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print(outputJa.toJSONString());
			out.close();
			System.out.println("Success....");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// cityajax

	@RequestMapping("/cityajax2.wt")
	public void cityajax2(String loc, int btn, HttpServletResponse response) {
		ContiCountry cc = ccbiz.get(loc.toUpperCase());

		connectionHive();
		String sql = "select loc_num, loc, SUBSTRING(period, 6, 5) as period, min(temp) as min, max(temp) as max from "
				+ cc.getConti_name_eng() + " where loc_num=" + cc.getCity_num()
				+ " group by loc_num, loc, SUBSTRING(period, 6, 5)";
		try {
			JSONArray outputJa = new JSONArray();
			rset = stmt.executeQuery(sql);
			int mon = 1;

			for (int i = 1; i < 13; i++) {
				JSONObject jo = new JSONObject();

				JSONArray innerJa2 = new JSONArray();

				if (i < 10) {
					jo.put("id", "MONTH 0" + i);
				} else
					jo.put("id", "MONTH " + i);

				rset.beforeFirst();
				while (rset.next()) {
					JSONArray innerJa1 = new JSONArray();

					if (mon == Integer.parseInt(rset.getString(3).substring(0, 2))) {
						innerJa1.add(rset.getString(3).substring(3, 5));
						if (btn == 1) { // max
							innerJa1.add(rset.getDouble(5));
						} else if (btn == -1) { // min
							innerJa1.add(rset.getDouble(4));
						}

						innerJa2.add(innerJa1);
					}
				}
				mon++;
				jo.put("data", innerJa2);
				outputJa.add(jo);
			}

			con.close();
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print(outputJa.toJSONString());
			out.close();
			System.out.println("Success....");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// cityajax2

	

	/*
	 * durationajax : �ְ��� ���� 
	 * durationajax2 : ������� ����
	 * durationajax3 : �ϱ��� ���� ����
	 * durationajax4 : Ư�� ���� ������ ���� ����
	 */

	@RequestMapping("/durationajax.wt")
	public void durationajax(String conti, String month, HttpServletResponse response) throws Exception {
		
		connectionHive();
		System.out.println("durationajax1 ");
		String sql = "";
		try {
			// �ְ� ��� ����
			sql = "select * from (select loc_num, loc, SUBSTRING(period,1,2) as period, round(avg(max),1) as avg_max, row_number() over(order by round(avg(max),1) desc) as rank from(select loc_num, loc, SUBSTRING(period, 6, 5) as period, max(temp) as max from "
					+ conti + " where SUBSTRING(period,6,2)=" + month
					+ " group by loc_num, loc, SUBSTRING(period, 6, 5)) as tbl group by loc_num, loc, SUBSTRING(period,1,2)) as tbl2 where rank <= 5";
			rset = stmt.executeQuery(sql);
			JSONArray ja = new JSONArray();

			while (rset.next()) {
				JSONObject jo = new JSONObject();
				jo.put("loc_num", rset.getInt(1));
				jo.put("loc", rset.getString(2));
				jo.put("period", rset.getString(3));
				jo.put("avg_max", rset.getDouble(4));
				jo.put("rank", rset.getInt(5));
				ja.add(jo);
			}

			con.close();
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print(ja.toJSONString());
			out.close();
			System.out.println("Success....");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// durationajax

	@RequestMapping("/durationajax2.wt")
	public void durationajax2(String conti, String month, HttpServletResponse response) throws Exception {

		connectionHive();
		System.out.println("durationajax2");

		String sql = "";
		try {
			// ���� ��� ����
			sql = "select * from (select loc_num, loc, SUBSTRING(period,1,2) as period, round(avg(min),1) as avg_min, row_number() over(order by round(avg(min),1)) as rank from(select loc_num, loc, SUBSTRING(period, 6, 5) as period, min(temp) as min from "
					+ conti + " where SUBSTRING(period,6,2)=" + month
					+ " group by loc_num, loc, SUBSTRING(period, 6, 5)) as tbl group by loc_num, loc, SUBSTRING(period,1,2)) as tbl2 where rank <= 5";
			rset = stmt.executeQuery(sql);
			JSONArray ja = new JSONArray();

			while (rset.next()) {
				JSONObject jo = new JSONObject();
				jo.put("loc_num", rset.getInt(1));
				jo.put("loc", rset.getString(2));
				jo.put("period", rset.getString(3));
				jo.put("avg_min", rset.getDouble(4));
				jo.put("rank", rset.getInt(5));
				ja.add(jo);
			}

			con.close();
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print(ja.toJSONString());
			out.close();
			System.out.println("Success....");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// durationajax2

	@RequestMapping("/durationajax3.wt")
	public void durationajax3(String conti, String month, HttpServletResponse response) throws Exception {

		connectionHive();
		System.out.println("durationajax3");

		String sql = "";
		try {
			// �ϱ���
			sql = "select * from (select loc_num, loc, SUBSTRING(period,1,2) as period, round(avg(daily_range),1) as avg_range, round(avg(min), 1) as min, round(avg(max), 1) as max, row_number() over(order by round(avg(daily_range),1)) as rank from(select loc_num, loc, SUBSTRING(period, 6, 5) as period, max(temp)-min(temp) as daily_range, min(temp) as min, max(temp) as max from "
					+ conti + " where SUBSTRING(period,6,2)=" + month
					+ " group by loc_num, loc, SUBSTRING(period, 6, 5)) as tbl group by loc_num, loc, SUBSTRING(period,1,2)) as tbl2 where rank <= 5";
			rset = stmt.executeQuery(sql);
			JSONArray ja = new JSONArray();

			while (rset.next()) {
				JSONObject jo = new JSONObject();
				jo.put("loc_num", rset.getInt(1));
				jo.put("loc", rset.getString(2));
				jo.put("period", rset.getString(3));
				jo.put("avg_range", rset.getDouble(4));
				jo.put("min", rset.getDouble(5));
				jo.put("max", rset.getInt(6));
				jo.put("rank", rset.getInt(6));
				ja.add(jo);
			}

			con.close();
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print(ja.toJSONString());
			out.close();
			System.out.println("Success....");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// durationajax3

	@RequestMapping("/durationajax4.wt")
	public void durationajax4(String conti, String month, HttpServletResponse response) throws Exception {

		connectionHive();
		System.out.println("durationajax4");

		String sql = "";
		try {
			// ������
			sql = "select * from (select loc_num,  loc, SUBSTRING(period,1,2) as period, round(avg((case when prcp<=0.5 then null else prcp end)),1) as avg_prcp, round(avg(humid),1) as avg_humid, rank() over(order by round(avg((case when prcp<=0.5 then null else prcp end)),1) desc) as rank from(select loc_num, loc, SUBSTRING(period, 6, 5) as period, avg((case when prcp<=0.5 then null else prcp end)) as prcp, avg(humid) as humid from "
					+ conti + " where SUBSTRING(period,6,2)=" + month
					+ " group by loc_num, loc, SUBSTRING(period, 6, 5)) as tbl group by loc_num, loc, SUBSTRING(period,1,2)) as tbl2 where rank <= 5";
			rset = stmt.executeQuery(sql);
			JSONArray ja = new JSONArray();

			while (rset.next()) {
				JSONObject jo = new JSONObject();
				jo.put("loc_num", rset.getInt(1));
				jo.put("loc", rset.getString(2));
				jo.put("period", rset.getString(3));
				jo.put("avg_prcp", rset.getDouble(4));
				jo.put("avg_humid", rset.getDouble(5));
				jo.put("rank", rset.getInt(6));
				ja.add(jo);
			}

			con.close();
			response.setContentType("text/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print(ja.toJSONString());
			out.close();
			System.out.println("Success....");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// durationajax4
	
	@RequestMapping("cityprcpajax.wt")
	public void cityprcpajax(String loc, HttpServletResponse response) throws Exception {
		ContiCountry cc = ccbiz.get(loc.toUpperCase());
		System.out.println(loc);
		
		RConnection rc = new RConnection();
		rc.eval("source('D:/rtest/wemate/wemate_1.R',encoding='UTF-8')");
		rc.setStringEncoding("utf8");
		String func = "prcp('" + cc.getConti_name_eng() +"'," +  + cc.getCity_num() + ")";
		
		System.out.println(func);
		RList rl = rc.eval(func).asList();
		String [] loc_nums = rl.at("loc_num").asStrings();
		String [] locs = rl.at("loc").asStrings();
		String [] periods = rl.at("period").asStrings();
		double [] avg_prcps = rl.at("avg_prcp").asDoubles();
		JSONArray ja = new JSONArray();
		JSONObject jo = new JSONObject();
		JSONArray ja2 = new JSONArray();
		for(int i = 0 ; i < locs.length ; i++) {
			JSONObject jo2 = new JSONObject();
			jo2.put("drilldown", "MONTH "+ periods[i]);
			jo2.put("name", "MONTH "+ periods[i]);
			jo2.put("y", avg_prcps[i]);
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

	}// cityprcpajax
	
	
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

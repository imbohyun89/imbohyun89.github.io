package com.wt.frame;

public class Sql {
	public static String insertUser = 
			"INSERT INTO T_USER VALUES(?,?,?,?)";
	public static String deleteUser = 
			"DELETE FROM T_USER WHERE ID=?";
	public static String updateUser = 
			"UPDATE T_USER SET PWD=?,NAME=? WHERE ID=?";
	public static String selectUser = 
			"SELECT * FROM T_USER WHERE ID=?";
	public static String selectallUser = 
			"SELECT * FROM T_USER";

	public static String insertProduct = 
			"INSERT INTO T_PRODUCT VALUES(SEQ_ID.nextVal,?,?,SYSDATE,?,?)";
	public static String deleteProduct = 
			"DELETE FROM T_PRODUCT WHERE ID=?";
	public static String updateProduct = 
			"UPDATE T_PRODUCT SET NAME=?,PRICE=?,IMGNAME=?, CATEGORY=? WHERE ID=?";
	public static String selectProduct = 
			"SELECT * FROM T_PRODUCT WHERE ID=?";
	public static String selectallProduct =
			"SELECT * FROM T_PRODUCT";
	public static String selectallOrderProduct =
			"SELECT * FROM T_PRODUCT ORDER BY ID DESC";
	

	public static String insertOrders = 
			"INSERT INTO T_ORDERS VALUES(SEQ_ORDERS.nextVal,?,?,?,?,SYSDATE)";
	public static String deleteOrders = 
			"DELETE FROM T_ORDERS WHERE ID=?";
	public static String updateOrders = 
			"UPDATE T_ORDERS SET CNT=? WHERE ID=?";
	public static String selectOrders = 
			"SELECT * FROM T_ORDERS WHERE ID=?";
	public static String selectallOrders = 
			"SELECT * FROM T_ORDERS";
	public static String selectPopularOrders =
			"select id, name, price, regdate, imgname, category, cnt, rank\r\n" + 
			"from\r\n" + 
			"(select t_product.id as id, name, price, regdate, imgname, t_product.category as category, sum(cnt) as cnt, ROW_NUMBER() OVER (ORDER BY sum(cnt) desc) as rank\r\n" + 
			"         from t_product, t_orders\r\n" + 
			"         where t_product.id = t_orders.p_id\r\n" + 
			"         group by t_product.id, name, price, regdate, imgname, t_product.category)\r\n" + 
			"where rank <= 4";
	public static String selectTime = 
			"select substr(to_char(buy_date, 'YYYY/MM/DD HH:MI:SS'), 15,2) as REGDATE, CATEGORY from t_orders";
}

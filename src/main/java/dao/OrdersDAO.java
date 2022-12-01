package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import bean.Account;
import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;
import model.ProductOrders;

public class OrdersDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// Insert information of Order to data source, that including list of
	// products in cart (c) and information of buyer in Orders o
	public void insertOrder(Orders o, Cart c) {
		List<Product> listProducts = c.getItems();
		String query1 = "select top 1 order_id from Orders_detail order by order_id desc";
		String query2 = "set IDENTITY_INSERT Orders ON \r\n insert into Orders(user_mail, order_id, order_status, order_date, order_discount_code, order_address)\r\n"
				+ "values(? ,? , ? , ?, ?, ?)\r\n set IDENTITY_INSERT Orders OFF ;";
		String query3 = "insert into Orders_detail values(?, ?, ?, ?)";
		Date date = new Date(Calendar.getInstance().getTime().getTime());

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query1);
			rs = ps.executeQuery();

			int id = 0;
			while (rs.next()) {
				id = rs.getInt("order_id");
			}
			id++;

			ps.close();

			ps = conn.prepareStatement(query2);
			ps.setString(1, o.getUserMail());
			ps.setString(2, "" + id);
			ps.setString(3, "" + o.getStatus());
			ps.setDate(4, date);
			ps.setString(5, o.getDiscount());
			ps.setString(6, o.getAddress());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement(query3);
			for (Product p : listProducts) {
				ps.setString(1, "" + id);
				ps.setString(2, "" + p.getId());
				ps.setString(3, "" + p.getAmount());
				ps.setString(4, "" + p.getPrice());
				ps.executeUpdate();
			}
			ps.close();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Account login(String user, String pass, int role) {
		String query = "  select * from Account\r\n" + "  where user_mail = ? and password = ? and account_role = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.setInt(3, role);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), 0);
			}

		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Account checkAccount(String user) {
		String query = "  select * from Account\r\n" + "  where user_mail = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), 0);
			}

		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void register(String user, String pass, String name) {
		String query = "insert into Account(user_mail, [password], account_role, [user_name])\r\n"
				+ "  values(?, ?, 0, ?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.setString(3, name);
			ps.executeUpdate();

		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<ProductOrders> getProductOrders(int idOrders) throws Exception {
		List<ProductOrders> l = new ArrayList<>();
		String sql = "select od.order_id, od.product_id, p.product_name, od.amount_product from Orders_detail od, Products p\n"
				+ "where od.product_id= p.product_id and od.order_id = " + idOrders;

		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				double amount = Double.parseDouble(rs.getString(4)) ;
				l.add(new ProductOrders(rs.getInt(1), rs.getInt(2), amount, rs.getNString(3)));
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l;
	}

	public List<Orders> getOrdersByMail(String user) throws Exception {
		List<Orders> l = new ArrayList<>();
		String sql = "select distinct o.user_mail, o.order_id from Orders o\r\n"
				+ "join Orders_detail od\r\n"
				+ "on o.order_id = od.order_id\r\n"
				+ "where o.user_mail = '" + user +"'";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				l.add(new Orders(rs.getInt(2), rs.getString(1)));
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l;
	}
	
	public static void main(String[] args) throws Exception {
		OrdersDAO od = new OrdersDAO();
		List<ProductOrders> list = od.getProductOrders(3);
		for (ProductOrders o : list) {
			System.out.println(o);
		}

	}
}

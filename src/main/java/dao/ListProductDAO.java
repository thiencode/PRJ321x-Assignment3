package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class ListProductDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	//Return the list of products by product name
	public List<Product> search(String characters) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products where product_name like '%" + characters + "%'";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//Return the list of products by product name
	public List<Product> searchPaging(String characters, int index) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products where product_name like '%" + characters + "%' order by product_id\r\n"
				+ "offset ? rows fetch next 8 rows only";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, (index-1)*8);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//Count number of the products are searched
	public int getCount(String characters) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products where product_name like '%" + characters + "%'";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list.size();
	}
	
	//Get the product
	public Product getProduct(String characters) {
		Product product = new Product();
		String query = "select * from Products where product_id=" + characters;
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setPrice(rs.getFloat(4));
				product.setSrc(rs.getString(5));;
				product.setType(rs.getString(6));
				product.setBrand(rs.getString(7));
				
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return product;
		
	}
	
	public List<Product> pagingProduct(int index){
		List<Product> list = new ArrayList<>();
		String query = "select * from Products\r\n"
				+ "order by product_id\r\n"
				+ "offset ? rows fetch next 8 rows only";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, (index-1)*8);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7)));
				
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Product> getAllProduct(){
		List<Product> list = new ArrayList<>();
		String query = "select * from Products";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	//Get count product
	public int getTotalProduct() {
		String query = "select count(*) from Products";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);				
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//Delete a product
	public void deleteProduct(String id) {
		String query = "delete from Products\r\n"
				+ "where product_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.executeUpdate();
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertProduct(String name, String desc, float price, String img, String type, String brand) {
		String query = "insert into Products([product_name],[product_des],[product_price],[product_img_source],[product_type],[product_brand])\r\n"
				+ "values(?, ?, ?, ?, ?, ?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, desc);
			ps.setFloat(3, price);
			ps.setString(4, img);
			ps.setString(5, type);
			ps.setString(6, brand);
			ps.executeUpdate();
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void editProduct(String id, String name, String desc, float price, String img, String type, String brand) {
		String query = "update Products\r\n"
				+ "set [product_name] = ?,\r\n"
				+ "[product_des] = ?,\r\n"
				+ "[product_price] = ?,\r\n"
				+ "[product_img_source] = ?,\r\n"
				+ "[product_type] = ?,\r\n"
				+ "[product_brand] = ?\r\n"
				+ "where [product_id] = " + id;
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, desc);
			ps.setFloat(3, price);
			ps.setString(4, img);
			ps.setString(5, type);
			ps.setString(6, brand);
			ps.executeUpdate();
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	 public static void main(String[] args) { 
		 ListProductDAO ld = new ListProductDAO(); 
//		 System.out.println(ld.getTotalProduct());
			String name = "iPhone 13 128GB";
			String desc = "Máy mới 100% , chính hãng Apple Việt Nam.\r\n"
					+ "CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam ";
			float price = Float.parseFloat("35.35");
			String img = "https://cdn2.cellphones.com.vn/358x/media/catalog/product/i/p/iphone-13-01.jpg";
			String type = "cellphone";
			String brand = "apple";
			 ld.insertProduct(name, desc, price, img, type, brand);
			 List<Product> list = ld.search(name);
			 for (Product p : list) {
				 System.out.println(p); 
				 System.out.println("-----------------"); 
			 }
			 
		 System.out.println(ld.getCount("iphone"));
		 
		 
	 }

}

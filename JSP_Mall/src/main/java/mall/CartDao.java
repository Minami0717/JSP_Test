package mall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
	private static CartDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/mall";
	
	private CartDao() {
		try {
			Class.forName(driver);
			System.out.println("MySQL 드라이버 검색 성공...");
			
			conn = DriverManager.getConnection(dbURL, user, pass);
			System.out.println("MySQL 연결 성공...\n");
		}
		catch (ClassNotFoundException e) {
			System.out.println("MySQL 드라이버 검색 오류");
		}
		catch (SQLException e) {
			System.out.println("MySQL 연결 객체 생성 실패" + e);
		}
	}
	
	public static CartDao getInstance() {
		if (instance == null)
			instance = new CartDao();
		return instance;
	}
	
	public List<Cart> selectAll() {
		List<Cart> list = new ArrayList<Cart>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM cart");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Cart cart = new Cart();
				cart.setId(rs.getString("id"));
				cart.setProduct(rs.getString("product"));
				cart.setPrice(rs.getInt("price"));
				cart.setCount(rs.getInt("count"));
				list.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(Cart cart) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into cart(id,product,price,count) values(?,?,?,?)");
			pstmt.setString(1, cart.getId());
			pstmt.setString(2, cart.getProduct());
			pstmt.setInt(3, cart.getPrice());
			pstmt.setInt(4, cart.getCount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Cart selectOne(String id) {
		Cart cart = new Cart();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM cart where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cart.setId(rs.getString("id"));
				cart.setProduct(rs.getString("product"));
				cart.setPrice(rs.getInt("price"));
				cart.setCount(rs.getInt("count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cart;
	}
}

package mc_delivery;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class McDAO {

	private static McDAO instance = new McDAO();

	public static McDAO getInstance() {
		return instance;
	}

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private DataSource ds;
	private Context init;

	private McDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("생성자 예외 : " + e);

		} finally {
			close();
		}
	}

	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

	public List<MemberDTO> selectList_mem() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from mc_Member order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO ob = new MemberDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setId(rs.getString("id"));
				ob.setPassword(rs.getString("password"));
				ob.setName(rs.getString("name"));
				ob.setPhonenum(rs.getString("phonenum"));
				ob.setEmail(rs.getString("email"));
				ob.setGender(rs.getString("gender"));
				ob.setPoint(rs.getInt("point"));
				ob.setAge(rs.getInt("age"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_mem에서 예외 발생: " + e);
		} finally {
			close();
		}
		return list;
	}

	public List<OrderDTO> selectList_ord() {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from mc_Order order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO ob = new OrderDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setMem_idx(rs.getInt("mem_idx"));
				ob.setSales(rs.getInt("sales"));
				ob.setOrd_date(rs.getDate("ord_date"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}

	public List<OrderDTO> selectList_ordForMem(int idx) {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from mc_Order where mem_idx=" + idx +" order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO ob = new OrderDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setMem_idx(rs.getInt("mem_idx"));
				ob.setSales(rs.getInt("sales"));
				ob.setOrd_date(rs.getDate("ord_date"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}
	
	public List<OrderDTO> selectList_ord_yearly(String date){
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from mc_Order where to_char(ord_date,'yyyy') = '" + date + "' order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO ob = new OrderDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setMem_idx(rs.getInt("mem_idx"));
				ob.setSales(rs.getInt("sales"));
				ob.setOrd_date(rs.getDate("ord_date"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}
	
	public List<OrderDTO> selectList_ord_monthly(String date){
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from mc_Order where to_char(ord_date,'yyyy-mm') = '" + date + "' order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO ob = new OrderDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setMem_idx(rs.getInt("mem_idx"));
				ob.setSales(rs.getInt("sales"));
				ob.setOrd_date(rs.getDate("ord_date"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}
	
	public List<OrderDTO> selectList_ord_daily(String date){
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from mc_Order where to_char(ord_date,'yyyy-mm-dd') = '" + date + "' order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO ob = new OrderDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setMem_idx(rs.getInt("mem_idx"));
				ob.setSales(rs.getInt("sales"));
				ob.setOrd_date(rs.getDate("ord_date"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}
	
	public List<OrderDTO> selectList_ord_between(String dateStart, String dateEnd){
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from mc_Order where to_char(ord_date,'yyyy-mm-dd') between '" + dateStart + "' and '" + dateEnd + "' order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO ob = new OrderDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setMem_idx(rs.getInt("mem_idx"));
				ob.setSales(rs.getInt("sales"));
				ob.setOrd_date(rs.getDate("ord_date"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}

	public int totalSales(){
		int sales = 0;
		String sql = "select sum(sales) as sales from mc_order";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sales = rs.getInt("sales");
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return sales;
	}
	
	public int yearlySales(String date){
		int sales = 0;
		String sql = "select sum(sales) as sales from mc_order where to_char(ord_date,'yyyy') = '"+ date + "'";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sales = rs.getInt("sales");
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return sales;
	}

	public int dailySales(String date){
		int sales = 0;
		String sql = "select sum(sales) as sales from mc_order where to_char(ord_date,'yyyy-mm-dd') = '"+ date + "'";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sales = rs.getInt("sales");
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return sales;
	}
	
	public int betweenSales(String dateStart, String dateEnd){
		int sales = 0;
		String sql = "select sum(sales) as sales from mc_order where to_char(ord_date,'yyyy-mm-dd') between '" + dateStart + "' and '" + dateEnd + "'";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sales = rs.getInt("sales");
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return sales;
	}
	
	public int monthlySales(String date){
		int sales = 0;
		String sql = "select sum(sales) as sales from mc_order where to_char(ord_date,'yyyy-mm') = '"+ date + "'";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sales = rs.getInt("sales");
			}
		} catch (SQLException e) {
			System.out.println("selectList_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return sales;
	}
	
	public List<ProductDTO> selectList_pro() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from mc_Product order by idx";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO ob = new ProductDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setCategory(rs.getString("category"));
				ob.setName(rs.getString("name"));
				ob.setPrice(rs.getInt("price"));
				ob.setImgPath(rs.getString("imgPath"));
				ob.setCount(rs.getInt("count"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_pro에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}
	
	public List<ProductDTO> selectList_proByCount() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from mc_Product order by count";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO ob = new ProductDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setCategory(rs.getString("category"));
				ob.setName(rs.getString("name"));
				ob.setPrice(rs.getInt("price"));
				ob.setImgPath(rs.getString("imgPath"));
				ob.setCount(rs.getInt("count"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_pro에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}
	
	public List<ProductDTO> selectList_proByCountDesc() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from mc_Product order by count desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO ob = new ProductDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setCategory(rs.getString("category"));
				ob.setName(rs.getString("name"));
				ob.setPrice(rs.getInt("price"));
				ob.setImgPath(rs.getString("imgPath"));
				ob.setCount(rs.getInt("count"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_pro에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}
	
	public List<ProductDTO> selectList_proRec() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from mc_product where category='버거'  order by count desc FETCH first 6 ROWS ONLY";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO ob = new ProductDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setCategory(rs.getString("category"));
				ob.setName(rs.getString("name"));
				ob.setPrice(rs.getInt("price"));
				ob.setImgPath(rs.getString("imgPath"));
				ob.setCount(rs.getInt("count"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_pro에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}
	
	public List<ProductDTO> selectList_proByCat(String category) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from mc_Product where category= '" + category + "' order by idx";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO ob = new ProductDTO();
				ob.setIdx(rs.getInt("idx"));
				ob.setCategory(rs.getString("category"));
				ob.setName(rs.getString("name"));
				ob.setPrice(rs.getInt("price"));
				ob.setImgPath(rs.getString("imgPath"));
				ob.setCount(rs.getInt("count"));
				list.add(ob);
			}
		} catch (SQLException e) {
			System.out.println("selectList_pro에서 예외 발생" + e);
		} finally {
			close();
		}
		return list;
	}

	public int insert_mem(MemberDTO memDto) {
		int row = 0;
		String sql = "insert into mc_Member (id, password, name, phonenum, email, gender, age) values(?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memDto.getId());
			pstmt.setString(2, memDto.getPassword());
			pstmt.setString(3, memDto.getName());
			pstmt.setString(4, memDto.getPhonenum());
			pstmt.setString(5, memDto.getEmail());
			pstmt.setString(6, memDto.getGender());
			pstmt.setInt(7, memDto.getAge());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert_mem에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}

	public int insert_ord(int mem_idx, int sales) {
		int row = 0;
		String sql = "insert into mc_Order(mem_idx,sales) values (?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_idx);
			pstmt.setInt(2, sales);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}

	public int insert_pro(ProductDTO proDto) {
		int row = 0;
		String sql = "insert into mc_Product" + "(category, name, price, imgPath) values (?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proDto.getCategory());
			pstmt.setString(2, proDto.getName());
			pstmt.setInt(3, proDto.getPrice());
			pstmt.setString(4, proDto.getImgPath());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert_pro에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}

	public int delete_mem(int idx) {
		int row = 0;
		String sql = "delete from mc_Member where idx=" + idx;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete_mem에서 예외 발생" + e);

		} finally {
			close();
		}
		return row;
	}

	public int delete_ord(int idx) {
		int row = 0;
		String sql = "delete from mc_Order where idx=" + idx;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete_ord에서 예외 발생" + e);

		} finally {
			close();
		}
		return row;
	}

	public int delete_pro(int idx) {
		int row = 0;
		String sql = "delete from mc_Product where idx=" + idx;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete_pro에서 예외 발생" + e);

		} finally {
			close();
		}
		return row;
	}

	public int update_mem(MemberDTO ob) {
		int row = 0;
		String sql = "update mc_Member set id=?, password=?, name=?, age=?, phonenum=?, email=?, gender=? where idx="
				+ ob.getIdx();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ob.getId());
			pstmt.setString(2, ob.getPassword());
			pstmt.setString(3, ob.getName());
			pstmt.setInt(4, ob.getAge());
			pstmt.setString(5, ob.getPhonenum());
			pstmt.setString(6, ob.getEmail());
			pstmt.setString(7, ob.getGender());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update_mem에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}
	
	public int update_memPoint(MemberDTO ob, int point) {
		int row = 0;
		String sql = "update mc_Member set point=? where idx=" + ob.getIdx();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (ob.getPoint()+point));
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update_mem에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}
	
	public int use_memPoint(MemberDTO ob, int point) {
		int row = 0;
		String sql = "update mc_Member set point=? where idx=" + ob.getIdx();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (ob.getPoint()-point));
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update_mem에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}
	
	public int update_memPassword(int idx, String password) {
		int row = 0;
		String sql = "update mc_Member set password=? where idx="+ idx;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update_mem에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}

	public int update_ord(OrderDTO ob) {
		int row = 0;
		String sql = "update mc_Order set sales=? where idx=" + ob.getIdx();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ob.getSales());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}

	public int update_pro(ProductDTO ob) {
		int row = 0;
		String sql = "update mc_Product set category=?, name=?, price=?, imgPath=? where idx=" + ob.getIdx();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ob.getCategory());
			pstmt.setString(2, ob.getName());
			pstmt.setInt(3, ob.getPrice());
			pstmt.setString(4, ob.getImgPath());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update_pro에서 예외 발생" + e);
		} finally {
			close();
		}
		return row;
	}

	public MemberDTO selectOne_mem(int idx) {

		String sql = "select * from mc_Member where idx=" + idx;
		MemberDTO dto = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new MemberDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setPhonenum(rs.getString("phonenum"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setPoint(rs.getInt("point"));
			}
		} catch (SQLException e) {
			System.out.println("selectOne_mem에서 예외 발생" + e);
		} finally {
			close();
		}
		return dto;
	}

	public OrderDTO selectOne_ord(int idx) {
		String sql = "select * from mc_Order where idx=" + idx;
		OrderDTO dto = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new OrderDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setMem_idx(rs.getInt("mem_idx"));
				dto.setSales(rs.getInt("sales"));
				dto.setOrd_date(rs.getDate("ord_date"));
			}
		} catch (SQLException e) {
			System.out.println("selectOne_ord에서 예외 발생" + e);
		} finally {
			close();
		}
		return dto;
	}

	public ProductDTO selectOne_pro(int idx) {
		String sql = "select * from mc_Product where idx=" + idx;
		ProductDTO dto = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new ProductDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setImgPath(rs.getString("imgPath"));
				dto.setCount(rs.getInt("count"));
			}
		} catch (SQLException e) {
			System.out.println("selectOne_pro에서 예외 발생" + e);
		} finally {
			close();
		}
		return dto;
	}
	
	public MemberDTO login(MemberDTO user) {
		MemberDTO login = null;
		String sql = "select * from mc_Member where id=" + "'" + user.getId() + "'"+ " and password="+ "'" + user.getPassword() + "'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
		while(rs.next()) {
			login = new MemberDTO();
			login.setIdx(rs.getInt("idx"));
			login.setId(rs.getString("id"));
			login.setPassword(rs.getString("password"));
			login.setName(rs.getString("name"));
			login.setPhonenum(rs.getString("phonenum"));
			login.setEmail(rs.getString("email"));
			login.setGender(rs.getString("gender"));
			login.setPoint(rs.getInt("point"));
			login.setAge(rs.getInt("age"));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {close();}
		return login;
	}
	
	public MemberDTO selectOne_memByEmail(String email) {

		String sql = "select * from mc_Member where email=" + "'"+ email+ "'";
		MemberDTO dto = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new MemberDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setPhonenum(rs.getString("phonenum"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setPoint(rs.getInt("point"));
			}
		} catch (SQLException e) {
			System.out.println("selectOne_mem에서 예외 발생" + e);
		} finally {
			close();
		}
		return dto;
	}
	
	public MemberDTO findOne_mem(String email, String id, String name) {

		String sql = "select * from mc_Member where email='" + email+ "' and name='" + name + "' and id='" + id+ "'";
		MemberDTO dto = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new MemberDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setPhonenum(rs.getString("phonenum"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setPoint(rs.getInt("point"));
			}
		} catch (SQLException e) {
			System.out.println("selectOne_mem에서 예외 발생" + e);
		} finally {
			close();
		}
		return dto;
	}
	
	public List<ProductDTO> basketList(List<ProductDTO> items, int idx){
		ProductDTO dto = new ProductDTO();
		
		items.add(dto); 
		
		return items;
	}
	
	public void deleteBasketitem(int listIdx) {
		
	}
	
	public void countUp_pro(ArrayList<String> list) {
		
		for(String s : list) {
			String sql = "update mc_product set count=(count+1) where idx=" + s;
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("update_pro에서 예외 발생" + e);
			} finally {
				close();
			}
		}
		return;
	}
}










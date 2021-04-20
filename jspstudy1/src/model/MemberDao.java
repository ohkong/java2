package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	public int insert(Member mem) {
		//���ᰴü ����
		Connection conn = DbConnection.getConnection();
		//������ �غ��ϴ� ��ü
		PreparedStatement pstmt = null;
		String sql="insert into member"
				+ "(id,pass,name,gender,email,tel,picture)"
				+ "values(?,?,?,?,?,?,?)";
		try {
			//sql ������ dbms�� ����. �Ķ���� ������ ����
			pstmt = conn.prepareStatement(sql);
			//1 : ù��° ?�� �� ���� 
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPass());
			pstmt.setString(3, mem.getName());
			pstmt.setInt(4, mem.getGender());
			pstmt.setString(5, mem.getEmail());
			pstmt.setString(6, mem.getTel());
			pstmt.setString(7, mem.getPicture());
			// int executeUpdate() : select ������ ������ sql ����
			//					     ����� ���
			//					     ���ڵ尡 ����� ���� ����
			return pstmt.executeUpdate(); //1����
		}catch(SQLException e) {
			e.printStackTrace();
		} finally{
			DbConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	// id : ȭ�鿡�� �Էµ� id��
	public Member selectOne(String id) {
		Connection conn = DbConnection.getConnection();
		String sql = "select * from member where id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); //db�� ������ �Ķ����(?)�� ����
			rs = pstmt.executeQuery();
			if(rs.next()) { //id�� �ش��ϴ� Member������ ����
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;	//id�� �ش��ϴ� db�� ���� ����.
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt,rs);
		}
		return null;
	}
	//m : ȭ�鿡 �Էµ� ���� �����ϰ� �ִ� ��ü
	public int update(Member m) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql ="update member set name=?,"
				+ " gender=?, email=?, tel=?, picture=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getGender());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getTel());
			pstmt.setString(5, m.getPicture());
			pstmt.setString(6, m.getId());
			return pstmt.executeUpdate(); //����� ���ڵ��� ���� ����
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	public int updatePass(String id, String pass) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql ="update member set pass=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	public int delete(String id) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from member where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	public List<Member> list() {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				m.setEmail(rs.getString("email"));
				m.setPicture(rs.getString("picture"));
				list.add(m);
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	public String idSearch(String email,String tel) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from member where email=? and tel=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("id");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	public String pwSearch(String id, String email,String tel) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pass from member where id=? and email=? and tel=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("pass");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return null;
	}
}

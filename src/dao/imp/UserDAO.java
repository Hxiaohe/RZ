package dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import domain.User;
import dao.IUserDAO;

public class UserDAO implements IUserDAO {
	
	
	
	/**
	 * 往数据中添加数据
	 */
	public void addUser(User user) {
		
		Connection conn = new DatabaseDAO().getConnection();
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into user(userName,passWord,gender,touxiang,qianming) " +
					"values('"+user.getUserName()+"','"+user.getPassWord()+"','"+user.getGender()+"','"+user.getTouxiang()+"','"+user.getQianming()+"')";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		

	}
public void alterUser(User user) {
		
		Connection conn = new DatabaseDAO().getConnection();
		Statement pstmt = null;
		
		try {
			String sql = "update user set gender='"+user.getGender()+"', touxiang='"+user.getTouxiang()+"', qianming='"+user.getQianming()+
					"' where userName='"+user.getUserName()+"'";
			pstmt = conn.createStatement();
			
			pstmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		

	}
	
	/**
	 * 从数据库中查询id为参数值id的用户
	 */
	public User getUserById(String id) {
		
		Connection conn = new DatabaseDAO().getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User us = new User();
		try {
			String sql = "select * from user where id="+id+"";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				us.setId(rs.getString("id"));
				us.setGender(rs.getString("gender"));
				us.setPassWord(rs.getString("passWord"));
				us.setTouxiang(rs.getString("touxaing"));
				us.setUserName(rs.getString("userName"));
				us.setQianming(rs.getString("qianming"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return us;
		
	}
	
	
	
	
	public List<User> getUserByUserName(String userName) {
		DatabaseDAO myDB = new DatabaseDAO();
		User user = new User();
		List<User> list = new ArrayList<User>();
		String sql = "select * from user where username ='"+userName+"'";
		try
		{
			ResultSet mySet = myDB.getResultSet(sql);
			while(mySet.next())
			{
				user.setId(mySet.getString("Id"));
				user.setUserName(mySet.getString("userName"));
				user.setPassWord(mySet.getString("passWord"));
				user.setGender(mySet.getString("gender"));
				user.setQianming(mySet.getString("qianming"));
				user.setTouxiang(mySet.getString("touxiang"));
				list.add(user);
			}
		}
		catch(SQLException sqlEx)
		{
			sqlEx.printStackTrace();
		}
		catch(ClassNotFoundException cnfEx)
		{
			cnfEx.printStackTrace();
		}
		finally
		{
			try
			{
				myDB.releaseConnection();
			}
			catch(SQLException sqlEx)
			{
				sqlEx.printStackTrace();
			}
		}
		return list;
	}


	
	




}

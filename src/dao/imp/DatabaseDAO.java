package dao.imp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseDAO {
	 private Connection conn = null;
     /**
     * 获取数据库连接对象
     * @return 数据库连接对象
     * @throws ClassNotFoundException
     * @throws SQLException
     */
	 public Connection getConnection()  {	
		 Connection conn = null;
         //加载数据库驱动
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost/guji", "root", "h520520...");
			  	}catch(Exception e){
				e.printStackTrace();
			}

			  	System.out.println("数据库连接成功！");
			return conn;
	}
     /**
	  * 关闭类中的连接对象
	  * @throws SQLException
	  */
	 public void releaseConnection()
			throws SQLException {
		this.conn.close();
		this.conn = null;
	}
	/**
	 * 执行一个SQL查询语句，并返回查询的结果集
	 * @param
	 * @return 数据库查询结果集
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public ResultSet getResultSet(String querySQL) throws SQLException, ClassNotFoundException
	{
		System.out.println("sql语句"+querySQL);
		if(conn == null)
		{
			this.conn = getConnection();
		}
		Statement stm = conn.createStatement();

        //执行SQL查询语句并返回查询结果集
		ResultSet thisRST = stm.executeQuery(querySQL);
		return thisRST;
	}
    /**
	 * 直接执行一条对数据库修改（包括增删改）的SQL语句
	 * @param
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public void executeSQL(String SQL) throws SQLException,
 ClassNotFoundException
	{
		if(conn == null)
		{
			this.conn = getConnection();
		}
		Statement stm = conn.createStatement();

		//执行给定的SQL语句
		stm.executeUpdate(SQL);

        //关闭连接对象
		this.conn.close();
		this.conn = null;
	}

}


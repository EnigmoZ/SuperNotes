package com.supernotes.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.supernotes.model.Content;
import com.supernotes.model.UserDetails;


public class UserDAO {
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Register");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/supenotes", "root", "Strange@1491");
			System.out.println(con);
			System.out.println("DB Connection");		
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static int addUser(UserDetails user) {
		int status=0;
		System.out.println("adduser");
		Connection connection = UserDAO.getConnection();
		try {
			PreparedStatement ps= connection.prepareStatement("insert into user (fullname, username, password) values(?,?,?)");
			ps.setString(1, user.getFullname());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
			
			status= ps.executeUpdate();
		    System.out.println("Status = "+status);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static UserDetails userLoginValidate(UserDetails userlogin) {
		Connection connection=UserDAO.getConnection();
		UserDetails user=null;
		try {
			PreparedStatement ps=connection.prepareStatement("select * from user where username=? and password=?");
			ps.setString(1, userlogin.getUsername());
			ps.setString(2, userlogin.getPassword());
		
			ResultSet rs = ps.executeQuery(); 
			System.out.println("ResultSet="+rs);
		
			if(rs.next())
			{
				user=new UserDetails();
				user.setId(rs.getInt("userid"));
				user.setFullname(rs.getString("fullname"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public static int addNotes(String title, String content, int uid) {
		int status=0;
		Connection connection=UserDAO.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("insert into notes(title,content,userid) values(?,?,?)");
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, uid);
			
			status=ps.executeUpdate();
		} 
		catch (SQLException e) {
				e.printStackTrace();
		}
		return status;
	}
	
	public static List<Content> getNotes(int id){
		List<Content> list=new ArrayList<Content>();
		Content cont=null;
		Connection connection=UserDAO.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("select * from notes where userid=? order by notes_id DESC");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{	cont=new Content();
				cont.setId(rs.getInt("notes_id"));
				cont.setTitle(rs.getString("title"));
				cont.setContent(rs.getString("content"));
				cont.setDate(rs.getTimestamp("date"));
				list.add(cont);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Content getDataById(int noteid)
	{	
		Connection connection=UserDAO.getConnection();
		Content cont=null;
		try {
			PreparedStatement ps= connection.prepareStatement("select * from notes where notes_id=?");
			ps.setInt(1, noteid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				cont=new Content();
				cont.setId(rs.getInt("notes_id"));
				cont.setTitle(rs.getString("title"));
				cont.setContent(rs.getString("content"));
			}	
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return cont;
	}
	
	public static int deleteNotes(int nid)
	{
		int status=0;
		Connection connection=UserDAO.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("delete from notes where notes_id=?");
			ps.setInt(1, nid);
			
			status=ps.executeUpdate();
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	public static int updateNotes(int nid, String title, String content)
	{
		int status=0;
		Connection connection=UserDAO.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("update notes set title=?, content=? where notes_id=?");
			ps.setString(1,title);
			ps.setString(2, content);
			ps.setInt(3, nid);
			
			status=ps.executeUpdate();
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return status;
	}

}

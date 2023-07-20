

package com.servlet.fetch;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/fetch")
public class fetchservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String SELECT_QUERY ="SELECT * FROM members_register WHERE memberId = '" + memberId + "'";
		Connection con = null;
		RequestDispatcher dispatcher = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            //Class.forName("com.mysql.jdbc.Driver");   
            con = DriverManager.getConnection("jdbc:mysql:///member","root","annu11");
            System.out.println("Connection made");
            try { 
            	Connection c=con;
              Statement stmt = c.createStatement();
              ResultSet rs = stmt.executeQuery(SELECT_QUERY);
              System.out.println("Query Executed");
              if(rs.next()) {
            	  String firstName = rs.getString("firstName");
                  String lastName = rs.getString("lastName");
                  String dob = rs.getString("dob");
                  String contact = rs.getString("contact");
                  String address = rs.getString("address");
                  String gender = rs.getString("gender");
                  String email = rs.getString("email");
                  double insuredAmount = rs.getDouble("insuredAmount");
                  dispatcher = request.getRequestDispatcher("update.jsp");
                  System.out.println(gender);
                  
                  request.setAttribute("memberId", memberId);
                  request.setAttribute("firstName", firstName);
                  request.setAttribute("lastName", lastName);
                  request.setAttribute("dob", dob);
                  request.setAttribute("gender", gender);
                  request.setAttribute("address", address);
                  request.setAttribute("contact", contact);
                  request.setAttribute("email", email);
                  request.setAttribute("insuredAmount", insuredAmount);
                  dispatcher.forward(request, response);
              }
              
              }catch(Exception e){
            	  e.getMessage();
              }
            } catch (Exception e) {
        	
            throw new RuntimeException(e);
        }
            
        

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



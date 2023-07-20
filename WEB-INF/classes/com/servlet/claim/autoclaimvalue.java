package com.servlet.claim;
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



@WebServlet("/autoclaimvalue")
public class autoclaimvalue extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String SELECT_QUERY ="SELECT firstName, lastName, NomineeCount, maximumClaimableAmount, InsuranceType, insuredAmount FROM members_register WHERE memberId = '" + memberId + "'";
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
              System.out.println(rs);
             // int count = rs;
              if(rs.next()) {
            	  String firstName = rs.getString("firstName");
                  String lastName = rs.getString("lastName");
                  String NomineeCount = rs.getString("nomineeCount");
                  String maximumClaimableAmount = rs.getString("maximumClaimableAmount");
                  String InsuranceType = rs.getString("InsuranceType");
                  String insuredAmount = rs.getString("insuredAmount");  
//                  double insuredAmount = rs.getDouble("insuredAmount");
                  
                  dispatcher = request.getRequestDispatcher("claim.jsp");
                  System.out.println(firstName);
                  
                  request.setAttribute("memberId", memberId);
                  request.setAttribute("firstName", firstName);
                  request.setAttribute("lastName", lastName);
                  request.setAttribute("nomineeCount", NomineeCount);
                  request.setAttribute("maximumClaimableAmount", maximumClaimableAmount);
                  request.setAttribute("insuranceType", InsuranceType);
                  request.setAttribute("insuredAmount", insuredAmount);
//                  request.setAttribute("insuredAmount", insuredAmount);
                  
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

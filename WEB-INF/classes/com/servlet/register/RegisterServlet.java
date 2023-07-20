//package com.servlet.register;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/register")
//public class RegisterServlet extends HttpServlet{
//
//    //create the query
//    private static final String INSERT_QUERY ="INSERT INTO USER(NAME,CITY,MOBILE,DOB) VALUES(?,?,?,?)";
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        //get PrintWriter
//        PrintWriter pw = res.getWriter();
//        //set Content type
//        res.setContentType("text/hmtl");
//        //read the form values
//        String name = req.getParameter("name");
//        String city = req.getParameter("city");
//        String mobile = req.getParameter("mobile");
//        String dob = req.getParameter("dob");
//
//        //load the jdbc driver
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//        } catch (ClassNotFoundException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        //create the connection
//        try(Connection con = DriverManager.getConnection("jdbc:mysql:///firstdb","root","root");
//                PreparedStatement ps = con.prepareStatement(INSERT_QUERY);){
//            //set the values
//            ps.setString(1, name);
//            ps.setString(2, city);
//            ps.setString(3, mobile);
//            ps.setString(4, dob);
//
//            //execute the query
//            int count = ps.executeUpdate();
//
//            if(count==0) {
//                pw.println("Record not stored into database");
//            }else {
//                pw.println("Record Stored into Database");
//            }
//        }catch(SQLException se) {
//            pw.println(se.getMessage());
//            se.printStackTrace();
//        }catch(Exception e) {
//            pw.println(e.getMessage());
//            e.printStackTrace();
//        }
//
//        //close the stream
//        pw.close();
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // TODO Auto-generated method stub
//        doGet(req, resp);
//    }
//}



package com.servlet.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

    //create the query
    private static final String INSERT_QUERY ="INSERT INTO members_register(memberId,firstName,lastName,dob,address,contact,email,gender,nomineeCount,insuranceType,insuredAmount,maximumClaimableAmount) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    int id_count=0;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //get PrintWriter
        PrintWriter pw = res.getWriter();
        //set Content type
        res.setContentType("text/html");
        //read the form values
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String dob = req.getParameter("dob");
        String address = req.getParameter("address");
        String contact = req.getParameter("contact");
        String email = req.getParameter("email");
        String gender = req.getParameter("gender");
        String nomineeCount = req.getParameter("nomineeCount");
        String insuranceType = req.getParameter("insuranceType");
        double insuredAmount = Double.parseDouble(req.getParameter("insuredAmount"));
        
        double maximumClaimableAmount = Double.parseDouble(req.getParameter("max"));
        RequestDispatcher dispatcher = null;
   
        System.out.println(req.getSession().getAttribute("userName"));
        
        System.out.println("First Name: "+firstName);
        System.out.println("Last Name: "+lastName);
        System.out.println("Date of Birth: "+dob);
        System.out.println("Address: "+address);
        System.out.println("Contact: "+contact);
        System.out.println("Email: "+email);
        System.out.println("Gender: "+gender);
        System.out.println("Nominee Count: "+nomineeCount);
        System.out.println("Insurance Type: "+insuranceType);
        System.out.println("Insured Amount: "+insuredAmount);
        System.out.println("Maximum Claimable Amount: "+maximumClaimableAmount);
        //load the jdbc driver
        Connection con = null;
        try {
            //registering the jdbc driver here, your string to use 
            //here depends on what driver you are using.
        	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            //Class.forName("com.mysql.jdbc.Driver");   
            con = DriverManager.getConnection("jdbc:mysql:///member","root","annu11");
            System.out.println("Connection made");
        } catch (Exception e) {
        	
            throw new RuntimeException(e);
        }
        
      //  try {
       //     Class.forName("com.mysql.cj.jdbc.Driver");
      //  } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
       //     e.printStackTrace();
      //  }
        //create the connection
            try { 
            	Connection c=con;
              PreparedStatement ps = c.prepareStatement(INSERT_QUERY);
            //set the values
              String memberId="";
//              ResultSet generatedKeys = ps.getGeneratedKeys();
//              if (generatedKeys.next()) {
//                  id_count = generatedKeys.getInt(1);
//                 
//                  
//                  pw.println("Record Stored into Database. Member ID: " + memberId);
//              }
              int l=0;
              if(id_count<10) l=4;
              else if(id_count>=10 && id_count<100) l=3;
              else if(id_count>=100 && id_count<1000) l=2;
              else if(id_count>=1000 && id_count<10000) l=1;
              String Z="";
              for(int i=0;i<l;i++) Z+="0";
              memberId="MBC-"+Z+(++id_count);
      
            ps.setString(1, memberId);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, dob);
            ps.setString(5, address);
            ps.setString(6, contact);
            ps.setString(7, email);
            ps.setString(8, gender);
            ps.setString(9, nomineeCount);
            ps.setString(10, insuranceType);
            ps.setDouble(11, insuredAmount);
            ps.setDouble(12, maximumClaimableAmount);
            //execute the query
            dispatcher = req.getRequestDispatcher("register.jsp");
            int count = ps.executeUpdate();

            if(count==0) {
                req.setAttribute("status", "failed");
                
                System.out.println("Failed");
            }else {
            	req.setAttribute("status", "success");
            	req.setAttribute("member", memberId);
            	System.out.println("Success");
            }
           
            dispatcher.forward(req, res);
        }catch(SQLException se) {
            pw.println(se.getMessage());
            se.printStackTrace();
        }catch(Exception e) {
            pw.println(e.getMessage());
            e.printStackTrace();
        }

        //close the stream
        pw.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(req, resp);
    }
}




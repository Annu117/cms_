package com.servlet.claim;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@SuppressWarnings("serial")
@WebServlet("/claim")
public class ClaimServlet extends HttpServlet{
	private static final String INSERT_QUERY ="INSERT INTO member_claim_request(member_id,first_name,last_name,nominee_count, maximum_claim_amount, insurence_type, request_date, claim_reason, final_claim_amount) VALUES(?,?,?,?,?,?,?,?,?)";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //get PrintWriter
        PrintWriter pw = res.getWriter();
        
        //set Content type
        res.setContentType("text/hmtl");
        //read the form values
        String MemberIDString = req.getParameter("Member ID");
        System.out.println("Member is " + MemberIDString + ".");
        String FirstName = req.getParameter("First Name");
        String LastName = req.getParameter("Last Name");
        String NomineeCountString = req.getParameter("nomineeCount");
        System.out.println("NomineeCount " + NomineeCountString + ".");
        String MaximumClaimAmountString = req.getParameter("maximumClaimableAmount");
        String InsuranceType = req.getParameter("insuranceType");
        String RequestDateString = req.getParameter("requestDate");
        String ClaimReason = req.getParameter("Claim Reason");
        String finalClaimAmount = req.getParameter("finalClaimAmount");
        
        
        double MaximumClaim = Double.parseDouble(MaximumClaimAmountString);
        Double finalclaimableAmount= calculateFinalClaimAmount(ClaimReason, InsuranceType, MaximumClaim);
        String finalClaimAmount1= Double.toString(finalclaimableAmount);
        		
        System.out.println("Member ID: " + MemberIDString);

        RequestDispatcher dispatcher = null;
        //System.out.println("finalClaimAmout:"+finalClaimAmount);

        System.out.println("Member ID: " + FirstName);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try(Connection con = DriverManager.getConnection("jdbc:mysql:///member","root","annu11");
                PreparedStatement ps = con.prepareStatement(INSERT_QUERY);){
            //set the values
        	ps.setString(1, MemberIDString);
        	ps.setString(2, FirstName);
        	ps.setString(3, LastName);
        	ps.setString(4, NomineeCountString);
        	ps.setString(5, MaximumClaimAmountString);
        	ps.setString(6, InsuranceType);
        	ps.setString(7, RequestDateString);
        	ps.setString(8, ClaimReason);
        	ps.setString(9, finalClaimAmount1);
        	dispatcher = req.getRequestDispatcher("Home.jsp");
            int count = ps.executeUpdate();

            if(count==0) {
            	req.setAttribute("status", "failed");
            	req.getRequestDispatcher("claim.jsp").forward(req, res);
            }else {
            	LocalDate req1=LocalDate.now().plusDays(45);
            	req.setAttribute("status", "success");
            	req.setAttribute("member", MemberIDString);
            	req.setAttribute("date1", req1);
            
                req.setAttribute("msg", "Dear Admin,The claim request for " + MemberIDString +" has been posted. Your claim will be processed before "+ (req1));
          
//                req.getRequestDispatcher("Home.jsp").forward(req, res);
            }
            dispatcher.forward(req, res);
        }catch(SQLException se) {
            pw.println(se.getMessage());
            se.printStackTrace();
        }
        pw.close();
    }

private double calculateFinalClaimAmount(String claimReason, String insuranceType, double maxClaimAmount) {
    double finalClaimAmount = 0;

    if (insuranceType.equals("vehicle")) {
        if (claimReason.equals("repair")) {
            finalClaimAmount = 0.4 * maxClaimAmount;
        } else if (claimReason.equals("stolen")) {
            finalClaimAmount = 0.7 * maxClaimAmount;
        }
    } else if (insuranceType.equals("home")) {
        if (claimReason.equals("renovate")) {
            finalClaimAmount = 0.5 * maxClaimAmount;
        } else if (claimReason.equals("destroyed")) {
            finalClaimAmount = 0.7 * maxClaimAmount;
        }
    } else if (insuranceType.equals("life")) {
        if (claimReason.equals("treatment-claim")) {
            finalClaimAmount = maxClaimAmount - (0.05 * maxClaimAmount);
        } else if (claimReason.equals("death-claim")) {
            finalClaimAmount = maxClaimAmount;
        }
    }

    return finalClaimAmount;
}
}
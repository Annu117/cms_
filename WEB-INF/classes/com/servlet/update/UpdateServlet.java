package com.servlet.update;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        res.setContentType("text/html");

        // Read the form values
        String memberId = req.getParameter("memberId");
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
        double maximumClaimableAmount = Double.parseDouble(req.getParameter("maximumClaimableAmount"));
        // Database connection setup
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member", "root", "annu11");
            System.out.println("Connection made");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        try {
            Connection c = con;

            // Retrieve the existing details from the database
            String selectQuery = "SELECT * FROM members_register WHERE memberId=?";
            PreparedStatement selectStatement = c.prepareStatement(selectQuery);
            selectStatement.setString(1, memberId);
            ResultSet resultSet = selectStatement.executeQuery();

            if (resultSet.next()) {
                // Existing details found, update with new values
                firstName = resultSet.getString("firstName");
                lastName = resultSet.getString("lastName");
                dob = resultSet.getString("dob");
                address = resultSet.getString("address");
                contact = resultSet.getString("contact");
                email = resultSet.getString("email");
                gender = resultSet.getString("gender");
                nomineeCount = resultSet.getString("nomineeCount");
                insuranceType = resultSet.getString("insuranceType");
                insuredAmount = resultSet.getDouble("insuredAmount");
                maximumClaimableAmount = resultSet.getDouble("maximumClaimableAmount");

                // Update the database with new values
                String updateQuery = "UPDATE members_register SET firstName=?, lastName=?, dob=?, address=?, contact=?, email=?, gender=?, nomineeCount=?, insuranceType=?, insuredAmount=?, maximumClaimableAmount=? WHERE memberId=?";
                PreparedStatement updateStatement = c.prepareStatement(updateQuery);
                updateStatement.setString(1, firstName);
                updateStatement.setString(2, lastName);
                updateStatement.setString(3, dob);
                updateStatement.setString(4, address);
                updateStatement.setString(5, contact);
                updateStatement.setString(6, email);
                updateStatement.setString(7, gender);
                updateStatement.setString(8, nomineeCount);
                updateStatement.setString(9, insuranceType);
                updateStatement.setDouble(10, insuredAmount);
                updateStatement.setDouble(11, maximumClaimableAmount);
                updateStatement.setString(12, memberId);

                int count = updateStatement.executeUpdate();

                if (count == 0) {
                    pw.println("Record not updated in the database");
                } else {
                    pw.println("Record updated in the database");
                }

                updateStatement.close();
            } else {
                pw.println("Member ID not found in the database");
            }

            selectStatement.close();
            resultSet.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

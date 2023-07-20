package com.servlet.login;

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

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve the username and password from the request parameters
        String uname = request.getParameter("username");
        String psw = request.getParameter("password");


        request.getSession().setAttribute("userName", request.getParameter("userName"));
        request.getSession().setAttribute("password", request.getParameter("password"));
        // Check if the username and password are valid
        if (isValidCredentials(uname, psw)) {
            out.println("<h1>Login Successful</h1>");
        } else {
            out.println("<h1>Username or Password Incorrect</h1>");
            out.println("<a href=\"index.html\">Go back to Login Page</a");
        }
        out.close();
    }

    private boolean isValidCredentials(String uname, String psw) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a connection to the database
            conn = DriverManager.getConnection("jdbc:mysql:///member","root","annu11");

            // Prepare the SQL statement to check the credentials
            String sql = "SELECT * FROM members_info WHERE uname = ? AND psw = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uname);
            stmt.setString(2, psw);
            

            // Execute the query
            rs = stmt.executeQuery();

            // Check if the query returned any results
            if (rs.next()) {
                // Credentials are valid
                return true;
            }
           
           
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Credentials are invalid
        return false;
    }
}
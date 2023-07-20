package com.servlet.searchClaim;

import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/Search_claim/name")
public class ScarchByName extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			// registering the jdbc driver here, your string to use
			// here depends on what driver you are using.
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			// Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql:///member","root","annu11");
			System.out.println("Connection made");
		} catch (Exception e) {

			throw new RuntimeException(e);
		}

		try {

			String name = request.getParameter("name");
			System.out.println(name);
			String query = "SELECT mr.memberId, mr.firstName, mr.lastName, mr.insuredAmount, mr.insuranceType, cr.request_date, cr.claim_reason FROM members_register AS mr JOIN member_claim_request AS cr ON mr.firstName = '"
					+ name + "'";
			statement = connection.prepareStatement(query);
			resultSet = statement.executeQuery();

			List<ClaimData> claimDataList = new ArrayList<>();

			while (resultSet.next()) {
				String id = resultSet.getString("memberId");
				String firstName = resultSet.getString("firstName");
				String lastName = resultSet.getString("lastName");
				double insurance = resultSet.getDouble("insuredAmount");
				String insuranceType = resultSet.getString("insuranceType");
				String claimRequestDate = resultSet.getString("request_date");
				String claimReason = resultSet.getString("claim_reason");
				// String details = resultSet.getString("details");

				ClaimData claimData = new ClaimData(id, firstName, lastName, insurance, insuranceType, claimRequestDate,
						claimReason);
				claimDataList.add(claimData);
			}

			String jsonData = new Gson().toJson(claimDataList);

			response.setCharacterEncoding("UTF-8");
			out.print(jsonData);
			out.flush();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private class ClaimData {
		private String id;
		private String firstName;
		private String lastName;
		private double insurance;
		private String insuranceType;
		private String claimRequestDate;
		private String claimReason;

		public ClaimData(String id, String firstName, String lastName, double insurance, String insuranceType,
				String claimRequestDate, String claimReason) {
			this.id = id;
			this.firstName = firstName;
			this.lastName = lastName;
			this.insurance = insurance;
			this.insuranceType = insuranceType;
			this.claimRequestDate = claimRequestDate;
			this.claimReason = claimReason;
		}

	

		// Getters and setters
	}
}

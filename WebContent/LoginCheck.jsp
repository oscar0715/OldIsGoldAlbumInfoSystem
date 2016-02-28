<%@ page import="java.sql.*"%>
<%
	try {
		String username = request.getParameter("userID");
		String password = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/oldisgold?"
						+ "user=oscar&password=wolf");
		PreparedStatement pst = conn
				.prepareStatement("Select user_id, password from User where user_id=? and password=?");
		pst.setString(1, username);
		pst.setString(2, password);
		ResultSet rs = pst.executeQuery();
		if (rs.next())
			response.sendRedirect("Album.jsp");
		else
			response.sendRedirect("Login.jsp");
	} catch (Exception e) {

		out.println("Something went wrong !! Please try again..!!...\n");
		out.println(e.getMessage() + ".....");
		e.printStackTrace();
	}
%>
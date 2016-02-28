<%@ page import="java.sql.*"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Date"%>
<%
	try {
		String customerID = request.getParameter("cName");
		String[] albumList = request.getParameterValues("checkalbum");

		// Database connection
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/oldisgold?"
						+ "user=oscar&password=wolf");

		//calculate the order ID
		PreparedStatement pst = conn
				.prepareStatement("Select count(*) as count from orders");

		ResultSet rs = pst.executeQuery();
		rs.next();
		int order_id = Integer.parseInt(rs.getString("count")) + 1;

		// get customer ID
		int customer_id = Integer.parseInt(customerID);

		// get Date
		String date = new Date() + "";

		// get Discount 
		PreparedStatement pstDiscount = conn
				.prepareStatement("Select discount from clients where client_id =?");
		pstDiscount.setString(1, customer_id + "");
		ResultSet rsDiscount = pstDiscount.executeQuery();
		rsDiscount.next();

		double discount = rsDiscount.getDouble("discount");

		// Calculate Price
		int i = 0;
		double totalPrice = 0;
		i = 0;
		while (i < albumList.length) {
			PreparedStatement pstAlbum = conn
					.prepareStatement("Select * from albums where album_id=?;");
			pstAlbum.setString(1, albumList[i]);
			ResultSet rsAlbum = pstAlbum.executeQuery();
			while (rsAlbum.next()) {
				PreparedStatement pstCondition = conn
						.prepareStatement("Select price from conditions where condition_id=?");
				pstCondition.setString(1,
						rsAlbum.getString("condition_id"));

				ResultSet rsPrice = pstCondition.executeQuery();
				rsPrice.next();
				int price = Integer
						.parseInt(rsPrice.getString("price"));
				totalPrice += price;
				i++;
			}
		}

		totalPrice = totalPrice * discount;

		// insert Order
		PreparedStatement pstNewOrder = conn
				.prepareStatement("INSERT INTO orders VALUES ( ?, ?,?,? );");
		pstNewOrder.setInt(1, order_id);
		pstNewOrder.setInt(2, customer_id);
		pstNewOrder.setString(3, date);
		pstNewOrder.setDouble(4, totalPrice);
		pstNewOrder.executeUpdate();

		// update Album
		i=0;
		while (i < albumList.length) {
			PreparedStatement pstAlbumUpdate = conn
					.prepareStatement(" update albums set sold='2' where album_id=?;");
			pstAlbumUpdate.setString(1, albumList[i]);
			pstAlbumUpdate.executeUpdate();
			i++;
		}

		// insert orderItems
		i = 0;
		while (i < albumList.length) {
			PreparedStatement pstOrderItems = conn
					.prepareStatement(" INSERT INTO orderItems VALUES ( ?,? )");
			pstOrderItems.setInt(1, order_id);
			pstOrderItems.setInt(2, Integer.parseInt(albumList[i]));
			pstOrderItems.executeUpdate();
			i++;
		}

		response.sendRedirect("Order.jsp");

	} catch (Exception e) {

		out.println("Something went wrong !! Please try again");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
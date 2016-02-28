<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>Old Is Gold</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body onLoad=navActive(5)>

	<jsp:include page="Head.jsp" flush="true" />
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-striped table-hover ">
					<caption>
						<h1>Order List</h1>
					</caption>
					<thead>
						<tr>
							<th>Order ID</th>
							<th>Client Name</th>
							<th>Albums Name</th>
							<th>Order Date</th>
							<th>Order Price</th>
						</tr>
					</thead>
					<tbody>
						<%
							Connection conn = null;
							ResultSet rs = null;
							ResultSet rs1 = null;
							ResultSet rs2 = null;
							ResultSet rs3 = null;
							//sqlserver:com.microsoft.sqlserver.jdbc.SQLServerDriver
							Class.forName("com.mysql.jdbc.Driver");
							//sqlserver:jdbc:sqlserver://127.0.0.1:1433;DatabaseName=CETTICBusinessSystemDB
							conn = DriverManager
									.getConnection("jdbc:mysql://localhost:3306/oldisgold?"
											+ "user=oscar&password=wolf");
							PreparedStatement pst = conn
									.prepareStatement("Select * from orders");
							rs = pst.executeQuery();
							while (rs.next()) {
								PreparedStatement pst1 = conn
										.prepareStatement("Select * from clients where client_id=?");
								pst1.setString(1, rs.getString("client_id"));
								rs1 = pst1.executeQuery();
								rs1.next();
						%>
						<tr>
							<td><%=rs.getString("order_id")%></td>
							<td><%=rs1.getString("client_name")%></td>
							<td>
								<table class="table ">
									<%
										PreparedStatement pst2 = conn
													.prepareStatement("Select * from orderItems where order_id=?");
											pst2.setString(1, rs.getString("order_id"));
											rs2 = pst2.executeQuery();
											while (rs2.next()) {
												PreparedStatement pst3 = conn
														.prepareStatement("Select * from albums where album_id=?");
												pst3.setString(1, rs2.getString("album_id"));
												rs3 = pst3.executeQuery();
												rs3.next();
									%>
									<tr><td><%=rs3.getString("album_name")%></td></tr>
									<%
										}
									%>
								</table>
							</td>
							<td><%=rs.getString("order_date")%></td>
							<td><%=rs.getString("price")%></td>
						</tr>
						<%
							}
							rs.close();
							/* rs1.close(); */
							conn.close();
						%>
					</tbody>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
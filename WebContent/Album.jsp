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
<body onLoad=navActive(3)>

	<jsp:include page="Head.jsp" flush="true"/>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-striped table-hover ">
					<caption><h1>Album List<h1></caption>
					<thead>
						<tr>
							<th>Album ID</th>
							<th>Album Name</th>
							<th>Album Type</th>
							<th>Album Price</th>
						</tr>
					</thead>
					<tbody>
						<%
							Connection conn = null;
							ResultSet rs = null;
							ResultSet rs1 = null;
							//sqlserver:com.microsoft.sqlserver.jdbc.SQLServerDriver
							Class.forName("com.mysql.jdbc.Driver");
							//sqlserver:jdbc:sqlserver://127.0.0.1:1433;DatabaseName=CETTICBusinessSystemDB
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oldisgold?" + "user=oscar&password=wolf"); 
							PreparedStatement pst = conn.prepareStatement("Select * from albums where sold=1;");
							rs = pst.executeQuery();    
							while (rs.next()) {
								PreparedStatement pst1 = conn.prepareStatement("Select * from conditions where condition_id=?");
								pst1.setString(1,rs.getString("condition_id"));
								rs1 = pst1.executeQuery();  
								rs1.next();
						%>
						<tr>
							<td><%=rs.getString("album_id")%></td>
							<td><%=rs.getString("album_name")%></td>
							<td><%=rs1.getString("description")%></td>
							<td><%=rs1.getInt("price")%></td>
						</tr>
						<%
							}
							rs.close();
							rs1.close();
							conn.close();
						%>
					</tbody>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
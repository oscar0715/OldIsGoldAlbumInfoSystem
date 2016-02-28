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
<script language="JavaScript">
	function buySelect() {
		var totalprice = 0;
		var c = document.makeorder.checkalbum;
		var num = c.length;
		/* alert(num);
		for(i=1;i<=c.length;i++){
			totalprice+= c.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.innerText;
		} */
		
	}

</script>
<body onLoad=navActive(6)>

	<jsp:include page="Head.jsp" flush="true" />
	<div class="container">
		<form class="form-horizontal" role="form" action="OrderSubmit.jsp"
			method="get" name="makeorder" id="makeorder">
			<div class="row" name="albums">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<table class="table table-striped">
						<caption>
							<h1>Album List</h1>
						</caption>
						<thead>
							<tr>
								<th></th>
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
								conn = DriverManager
										.getConnection("jdbc:mysql://localhost:3306/oldisgold?"
												+ "user=oscar&password=wolf");
								PreparedStatement pst = conn
										.prepareStatement("Select * from albums where sold=1;");
								rs = pst.executeQuery();
								while (rs.next()) {
									PreparedStatement pst1 = conn
											.prepareStatement("Select * from conditions where condition_id=?");
									pst1.setString(1, rs.getString("condition_id"));
									rs1 = pst1.executeQuery();
									rs1.next();
							%>
							<tr>
								<td><input type="checkbox" name="checkalbum"
									onClick="buySelect()" value=<%=rs.getString("album_id")%>></td>
								<td><%=rs.getString("album_id")%></td>
								<td><%=rs.getString("album_name")%></td>
								<td><%=rs1.getString("description")%></td>
								<td><%=rs1.getInt("price")%></td>
							</tr>
							<%
								}
								rs.close();
								rs1.close();
							%>
						</tbody>
					</table>
				</div>
				<div class="col-md-1"></div>
			</div>
			<br> <br>



			<div class="form-group">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<label for="name"><h1>Customer List</h1></label> <select
						class="form-control" name="cName" id="cName">
						<%
							ResultSet rsCustomer = null;
							Class.forName("com.mysql.jdbc.Driver");

							PreparedStatement pstCustomer = conn
									.prepareStatement("Select * from clients");
							rsCustomer = pstCustomer.executeQuery();
							while (rsCustomer.next()) {
						%>
						<option value="<%=rsCustomer.getString("client_id")%>"><%=rsCustomer.getString("client_name")%></option>
						<%
							}
							rsCustomer.close();
							conn.close();
						%>
					</select> <br> <br>
					<h1>Total Price</h1>
					<textarea class="form-control" rows="2" id="totalprice"
						disabled="disabled" style="resize: none;">
					</textarea>
				</div>
				<div class="col-md-1"></div>
			</div>
			<br> <br>

			<div class="form-group">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<button type="submit" class="btn btn-default" onClick="doSubmit()">submit</button>
				</div>

				<div class="col-md-1"></div>
			</div>
		</form>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
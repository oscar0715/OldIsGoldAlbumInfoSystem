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
<body onLoad=navActive(2)>

	<jsp:include page="Head.jsp" flush="true"/><br><br>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="row">
					<form class="form-horizontal" role="form" action="RegisterSubmit.jsp" method="post">

						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">Name</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="name">
							</div>
						</div>
						<div class="form-group">
							<label for="mobile" class="col-sm-3 control-label">Mobile</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="mobile" name="mobile"
									placeholder="mobile">
							</div>
						</div>
						<div class="form-group">
							<label for="discount" class="col-sm-3 control-label">Discount</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="discount" name="discount"
									placeholder="discount">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-10">
								<button type="submit" class="btn btn-default">Register</button>
							</div>
						</div>
					</form>
					<div></div>
					<div class="col-md-4"></div>
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
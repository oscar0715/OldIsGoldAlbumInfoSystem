<script>
	function navActive(ind) {
		var alink = document.getElementById('nav'+ind)
		alink.className = 'active';
	}
</script>


<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="index.jsp">OldIsGold</a>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li id="nav1"><a href="Login.jsp">Login</a></li>
			<li id="nav2"><a href="Register.jsp">Register</a></li>
			<li id="nav3"><a href="Album.jsp">Albums</a></li>
			<li id="nav4"><a href="Customers.jsp">Customers</a></li>
			<li id="nav5"><a href="Order.jsp">Orders</a></li>
			<li id="nav6"><a href="SaleOrder.jsp">PlaceOrder</a></li>
		</ul>
	</div>
</nav>

<div class="container">
	<div class="jumbotron">
		<div class="container">
			<br> <br> <br>
			<h1 style="color: white; font-family: Garamond;">Old is Gold</h1>
		</div>
	</div>

</div>

<style>
.jumbotron {
	position: relative;
	background: #000 url("pic/album.jpg") center center;
	width: 100%;
	height: 100%;
	background-size: cover;
	overflow: hidden;
}
</style>
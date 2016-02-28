<%@ page import ="java.sql.*" %>
<%
    try{
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String discount = request.getParameter("discount");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oldisgold?" + "user=oscar&password=wolf");    
        PreparedStatement pst = conn.prepareStatement("INSERT INTO clients (client_name,mobile,discount)  VALUES ( ?,?,?)");

        pst.setString(1, name);
        pst.setString(2, mobile);
        pst.setString(3, discount);
        pst.executeUpdate(); 
        response.sendRedirect("Customers.jsp");
   }
   catch(Exception e){     
	   
       out.println("Something went wrong !! Please try again..!!...\n");  
       out.println(e.getMessage()+".....");
       e.printStackTrace();
   }      
%>
<%@page import="controller.stateManagement.SessionManage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%! SessionManage mySession = new SessionManage();%>
<% String mainPath = request.getContextPath(); %>
<% String user = (String) session.getAttribute("user"); %>
<% String admin = (String) session.getAttribute("admin"); %>

<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>    
    <%!Connection con = null; %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/style.css" />
    <title>Document</title>
</head>

<body>
	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3307/puzzles" user="root" password=""/>
	<!-- Executing Query Using SQL Tag Library -->
	<sql:query var="allProducts" dataSource="${dbConnection}">
		SELECT * FROM products
	</sql:query>
    <nav id="navbar">
    
        <h1 class="logo">Puzzles</h1>
        <ul>
            <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/product.jsp">Product</a></li>
            <li><a href="">About</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/contact.html">Contact Us</a></li>
        </ul>
        
        <div class="logo-container">
            <!-- <span>Login</span> -->
            <i class="fa-solid fa-user"></i>
            <i class="fa-solid fa-cart-shopping"></i>
            <form action="
            <%if(!mySession.checkUser(user)){
            	
            	out.print(mainPath);%>/pages/login.jsp <%
            	}
            else{
           		out.print(mainPath);%>/LogoutServlet<%
            } %>
            
            " method ="post">
            <button type="submit"><i class="fa-solid fa-right-from-bracket"></i></button>
            </form>
            
        </div>
    </nav>


    <!-- New Arrivals -->
    
    
    <section id="products">
        <h2>All Products</h2>
        
        <!-- Search bar -->
        <form action="search-result.jsp" method="post" class="search-bar">  
		  <input type="text" class="search-input" name="searchInput" placeholder="&nbsp;">
		  <span class="search-label">Search</span>
		  <span class="search-highlight"></span>
		  <button type="submit" class="search-btn">
		      <i class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>
		   </button>
		</form>
		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		if (errorMessage != null) {
		%>
			<p class="error-msg">${errorMessage}</p>
		<%
		}
		%>
        
        <div class="product-container">
        <c:forEach var = "products" items = "${allProducts.rows}">
         <div class="product">
                <img class="product-img" src="http://localhost:8080/images/${products.image}" alt="Productt Image" >
                
                <div>
                    <h4>${products.name }</h4>
                    <p>Price: ${products.price }</p>
                    <p>Stock: ${products.stock }</p>
                    <p>Rating: ${products.rating }</p>
                </div>
                <form action="product-detail.jsp">
                	<input type="hidden" name="productId" value="${products.product_id}">
                	<button class="btn-order" type="submit">View Details</button>
                </form>
            </div>
        </c:forEach>
           
            
        </div>
    </section>
</body>

</html>




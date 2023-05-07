<%@page import="controller.stateManagement.SessionManage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! SessionManage mySession = new SessionManage();%>
<% String mainPath = request.getContextPath(); %>
<% String user = (String) session.getAttribute("user");%>
<% String admin = (String) session.getAttribute("admin");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <title>Document</title>
</head>

<body>
    <nav id="navbar">
        <h1 class="logo">Puzzles</h1>
        <ul>
            <li><a href="">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/product.jsp">Product</a></li>
            <li><a href="">About</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/contact.html">Contact Us</a></li>
            <%if(mySession.checkIsAdmin(admin)){ %>
            <li><a href="${pageContext.request.contextPath}/pages/admin.jsp">Dashboard</a></li>
            <%} %>
        </ul>

        <div class="logo-container">
            <!-- <span>Login</span> -->
            <c:set var="userEmail" value="${user }" />
            <form action="${pageContext.request.contextPath}/UserProfile" method="get">
            <input type="hidden" name="userEmail" value="${userEmail}" />
            <button type="submit"><i class="fa-solid fa-user"></i></button>
            </form>
            <form action="${pageContext.request.contextPath}/pages/cart.jsp">
            	<button type="submit" ><i class="fa-solid fa-cart-shopping"></i></button>
            </form>
            
            <form action="
            <%if(mySession.checkUser(user) || mySession.checkIsAdmin(admin)){
            	
            	out.print(mainPath);%>/LogoutServlet<%
            	}
            else{
           		out.print(mainPath);%>/pages/login.jsp<%
            } %>
            
            " method ="post">
            <button type="submit"><i class="fa-solid fa-right-from-bracket"></i></button>
            </form>
            
        </div>
    </nav>

    <!-- Showcase -->
    <section id="showcase">
        <h1>STYLIST PICKS BEAT THE HEAT</h1>
        <button class="btn">Shop Now</button>
    </section>

    <!-- New Arrivals -->
    <section id="new-arrivals">
        <h2>Discover NEW Arrivals</h2>
        <div class="product-container">
            <a href="./pages/product-detail.html" class="product">
                <img class="product-img" src="./images/product1.jpg" alt="">
                <div>
                    <h4>Plain White T-shirt</h4>
                    <p>Rs. 1100</p>
                </div>
            </a>
            <a href="" class="product">
                <img class="product-img" src="./images/product2.jpg" alt="">
                <div>
                    <h4>Plain Black T-shirt</h4>
                    <p>Rs. 1100</p>
                </div>
            </a>
        </div>
    </section>
</body>

</html>
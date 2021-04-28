<%@ page language="java" import="it.mytech.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%!Prodotto p;
	String nome;
	String locale;%>

<%
	p = (Prodotto) session.getAttribute("SESSION_PRODOTTO");
locale = request.getParameter("locale");
application.setAttribute("LOCALE_KEY", locale);
try {
	nome = (String) session.getAttribute("SESSION_USERNAME");
	if (nome == null)
		nome = "";

} catch (Exception e) {
	nome = "";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>myTech-Prodotto</title>
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<!-- CSS -->

<link href="css/style.css" rel="stylesheet">
<link href="css/style-product.css" rel="stylesheet">
<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files  -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<meta name="robots" content="noindex,follow" />
<script type="text/javascript">
	function logout() {
		var richiesta = window.confirm("Effettuare il logout?");
		return richiesta;
	}
</script>
</head>

<body>
	<fmt:setLocale value="<%=locale%>" />
	<fmt:setBundle basename="it.mytech.bundle.messages"
		var="resourceBundle" />
	<main class="container-product">

		<!-- Left Column / Headphones Image -->
		<div class="left-column">
			<img data-image="red" class="active"
				src="img/prodotti/<%=p.getImmagine()%>" style="width: 70%">
		</div>

		<!-- Right Column -->
		<div class="right-column">
			<form
				action="<%if (!nome.equals("")) {%>
					carrelloservlet?cmd=addprodotto&id=<%=p.getIdProdotto()%><%} else {%>login.jsp?from=${pageContext.request.requestURI}&locale=<%=locale%><%}%>"
				method="POST">

				<!-- Product Description -->
				<div class="product-description">
					<span> <%
 	if (p.getTipo() == 1) {
 %> Hardware<%
 	} else {
 %>Software<%
 	}
 %>
					</span>

					<h1><%=p.getNome()%></h1>
					<p><%=p.getDescrizione()%></p>
					<input type="number" name="quantita" value="1" style="width: 50px;"
						min="1" max="<%=p.getDisponibilità()%>">
				</div>

				<!-- Product Configuration -->
				<div class="product-configuration">

					<!-- Product Pricing -->

					<div class="product-price">
						<span>€<%=p.getPrezzo()%></span> <input onclick="submit()"
							type="button" name="" class="btn-add"
							value="<fmt:message key="aggiungicarrello" bundle="${resourceBundle}" />">
					</div>

					<br> <br> <br> <br> <br> <br> <br>
			</form>
		</div>
	</main>

	<!-- Scripts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"
		charset="utf-8"></script>
	<script src="js/script-product.js" charset="utf-8"></script>
</body>
<!--==========================
    Footer
  ============================-->
<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-md-6 footer-info">
					<h3>myTech</h3>
					<img src="img/logo.png" width="50%" class="img-fluid">
				</div>

				<div class="col-lg-3 col-md-6 footer-links">
					<h4>
						<fmt:message key="link" bundle="${resourceBundle}" />
					</h4>
					<ul>
						<li><i class="ion-ios-arrow-right"></i> <a href="#intro">Home</a></li>
						<li><i class="ion-ios-arrow-right"></i> <a href="#about">About
								us</a></li>
						<li><i class="ion-ios-arrow-right"></i> <a href="#services"><fmt:message
									key="servizimenu" bundle="${resourceBundle}" /></a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-6 footer-contact">
					<h4>
						<fmt:message key="contattigiu" bundle="${resourceBundle}" />
					</h4>
					<p>
						<fmt:message key="indirizzogiu" bundle="${resourceBundle}" />
						<br>
						<fmt:message key="paese" bundle="${resourceBundle}" />
						<br> <strong><fmt:message key="telefono"
								bundle="${resourceBundle}" />:</strong> +39 392 421 7260<br> <strong>Email:</strong>
						mytech.ccg@gmail.com<br>
					</p>

					<div class="social-links">
						<a href="https://www.facebook.com/Francesco.Giuri.00"
							class="facebook"><i class="fa fa-facebook"></i></a> <a
							href="https://www.instagram.com/francescogiuri_/"
							class="instagram"><i class="fa fa-instagram"></i></a>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="copyright">
			&copy; Copyright <strong>myTech</strong>. All Rights Reserved
		</div>
		<div class="credits"></div>
	</div>
</footer>
<!-- #footer -->
</html>

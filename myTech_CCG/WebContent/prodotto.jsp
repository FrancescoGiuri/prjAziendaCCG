<%@ page language="java" import="it.mytech.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%!Prodotto p;%>

<%
	p = (Prodotto) session.getAttribute("SESSION_PRODOTTO");
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

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<meta name="robots" content="noindex,follow" />

</head>

<body>
	<main class="container-product">

		<!-- Left Column / Headphones Image -->
		<div class="left-column">
			<img data-image="red" class="active" src="img/<%=p.getImmagine()%>">
		</div>

		<!-- Right Column -->
		<div class="right-column">

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
				<input type="number" name="quantita" value="1" style="width: 50px;">
			</div>

			<!-- Product Configuration -->
			<div class="product-configuration">

				<!-- Product Pricing -->
				<div class="product-price">
					<span>€<%=p.getPrezzo()%></span> <input
						href="carrelloservlet?cmd=prodotto&id=<%=p.getIdProdotto()%>"
						type="button" name="" class="btn-add" value="Aggiungi al carrello">
				</div>
				<br> <br> <br> <br> <br> <br> <br>
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
					<h4>Link utili</h4>
					<ul>
						<li><i class="ion-ios-arrow-right"></i> <a href="#intro">Home</a></li>
						<li><i class="ion-ios-arrow-right"></i> <a href="#about">About
								us</a></li>
						<li><i class="ion-ios-arrow-right"></i> <a href="#services">Servizi</a></li>
						<li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy
								policy</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-6 footer-contact">
					<h4>Contatti</h4>
					<p>
						via Roma <br> Torino (TO)<br> <strong>Telefono:</strong>
						+39 392 421 7260<br> <strong>Email:</strong>
						mytech.ccg@gmail.com<br>
					</p>

					<div class="social-links">
						<a href="https://www.facebook.com/Francesco.Giuri.00"
							class="facebook"><i class="fa fa-facebook"></i></a> <a
							href="https://www.instagram.com/francescogiuri_/"
							class="instagram"><i class="fa fa-instagram"></i></a>
					</div>

				</div>

				<!--
          <div class="col-lg-3 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna veniam enim veniam illum dolore legam minim quorum culpa amet magna export quem marada parida nodela caramase seza.</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit"  value="Subscribe">
            </form>
          </div>
        -->
			</div>
		</div>
	</div>

	<div class="container">
		<div class="copyright">
			&copy; Copyright <strong>myTech</strong>. All Rights Reserved
		</div>
		<div class="credits">
			<!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        -->
		</div>
	</div>
</footer>
<!-- #footer -->
</html>

<%@ page language="java" import="java.util.*,it.mytech.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%!int tipo;
	String nome;%>
<%
	//commento1
try {
	nome = (String) session.getAttribute("SESSION_USERNAME");
	if (nome == null)
		nome = "";
	tipo = (Integer) session.getAttribute("SESSION_USER_TYPE");

} catch (Exception e) {
	nome = "";
	tipo = 0;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>myTech-Amministrazione</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="img/favicon2.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">

<!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
<script type="text/javascript">
	function logout() {
		var richiesta = window.confirm("Effettuare il logout?");
		return richiesta;
	}
</script>
</head>

<body>

	<!--==========================
    Header
  ============================-->
	<header id="header" style="background: rgba(0, 0, 0, 0.9)">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="#intro" class="scrollto">myTech</a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<%
						if (tipo == 1) {
					%>
					<li><a href="dipendenti.jsp">Dipendenti</a></li>
					<li><a href="prodotti.jsp">Prodotti</a></li>
					<%
						}
					%>
					<li><a href="ordiniN.jsp">Nuovi Ordini</a></li>
					<%
						if (tipo == 2) {
					%>
					<li><a href="ordiniV.jsp">Ordini Vecchi</a></li>
					<%
						}
					%>
					<%
						if (tipo == 1) {
					%>
					<li><a href="clienti.jsp">Clienti</a></li>
					<%
						}
					%>
					<li><a href="prenotazioni.jsp">Prenotazioni</a></li>

					<li class="menu-has-children"><a href=""><%=nome%></a>
						<ul>
							<li><a href="logout" onclick="return logout()">Logout</a></li>
						</ul></li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- #header -->

	<br>
	<br>
	<!--==========================
      Services Section
    ============================ -->
	<section id="services">
		<div class="container">

			<header class="section-header wow fadeInUp">
				<h3>Amministrazione</h3>
			</header>
			<center>
				<p>Elenco delle operazioni effettuabili</p>
			</center>
			<br> <br> <br>
			<div class="row services-cols">

				<%
					if (tipo == 1) {
				%>
				<div class="col-md-4 wow fadeInUp">
					<div class="services-col">
						<center>
							<div class="img">
								<img src="img/opzioni.jpg" alt="" class="img-fluid" width="50%">

							</div>
							<h2 class="title">
								<a href="aggiungiDipendente.jsp">Aggiungi dipendente</a>
							</h2>
							<p style="text-align: center"></p>
						</center>
					</div>
				</div>

				<div class="col-md-4 wow fadeInUp">
					<div class="services-col">
						<center>
							<div class="img">
								<img src="img/opzioni.jpg" alt="" class="img-fluid" width="50%">

							</div>
							<h2 class="title">
								<a href="aggiungiProdotto.jsp">Aggiungi prodotto</a>
							</h2>
							<p style="text-align: center"></p>
						</center>
					</div>
				</div>

				<div class="col-md-4 wow fadeInUp">
					<div class="services-col">
						<center>
							<div class="img">
								<img src="img/opzioni.jpg" alt="" class="img-fluid" width="50%">

							</div>
							<h2 class="title">
								<a href="prodotti.jsp">Prodotti</a>
							</h2>
							<p style="text-align: center"></p>
						</center>
					</div>
				</div>

				<div class="col-md-4 wow fadeInUp">
					<div class="services-col">
						<center>
							<div class="img">
								<img src="img/opzioni.jpg" alt="" class="img-fluid" width="50%">

							</div>
							<h2 class="title">
								<a href="dipendenti.jsp">Dipendenti</a>
							</h2>
							<p style="text-align: center"></p>
						</center>
					</div>
				</div>

				<%
					}
				%>

				<div class="col-md-4 wow fadeInUp">
					<div class="services-col">
						<center>
							<div class="img">
								<img src="img/opzioni.jpg" alt="" class="img-fluid" width="50%">

							</div>
							<h2 class="title">
								<a href="ordiniN.jsp">Ordini in arrivo</a>
							</h2>
							<p style="text-align: center"></p>
						</center>
					</div>
				</div>

				<div class="col-md-4 wow fadeInUp">
					<div class="services-col">
						<center>
							<div class="img">
								<img src="img/opzioni.jpg" alt="" class="img-fluid" width="50%">

							</div>
							<h2 class="title">
								<a href="ordiniV.jsp">Ordini elaborati</a>
							</h2>
							<p style="text-align: center"></p>
						</center>
					</div>
				</div>

				<%
					if (tipo == 2) {
				%>
				<div class="col-md-4 wow fadeInUp">
					<div class="services-col">
						<center>
							<div class="img">
								<img src="img/opzioni.jpg" alt="" class="img-fluid" width="50%">

							</div>
							<h2 class="title">
								<a href="prenotazioni.jsp">Prenotazioni</a>
							</h2>
							<p style="text-align: center"></p>
						</center>
					</div>
				</div>

				<%
					}
				%>



			</div>
		</div>


	</section>

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<!-- Uncomment below i you want to use a preloader -->
	<!-- <div id="preloader"></div> -->

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/superfish/hoverIntent.js"></script>
	<script src="lib/superfish/superfish.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
	<!-- Contact Form JavaScript File-->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>

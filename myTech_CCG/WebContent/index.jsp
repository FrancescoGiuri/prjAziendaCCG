<%@ page language="java" import="it.mytech.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%!int tipo;
	String nome;
	int numDipendenti;
	int numClienti;
	int numOrdini;
	DBManager db;
	String locale;%>
<%
	locale = request.getParameter("locale");
application.setAttribute("LOCALE_KEY", locale);
db = new DBManager();
numDipendenti = (Integer) request.getServletContext().getAttribute("SESSION_NUM_DIPENDENTI");
numClienti = (Integer) request.getServletContext().getAttribute("SESSION_NUM_CLIENTI");
numOrdini = (Integer) request.getServletContext().getAttribute("SESSION_NUM_ORDINI");

try {
	tipo = (Integer) session.getAttribute("SESSION_USER_TYPE");
	if (tipo == 1 || tipo == 2)
		session.setAttribute("SESSION_USERNAME", null);
	nome = (String) session.getAttribute("SESSION_USERNAME");
	if (nome == null)
		nome = "";

} catch (Exception e) {
	tipo = 0;
	nome = "";
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>myTech</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="img/favicon2.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts  -->
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
</head>
<script type="text/javascript">
	function logout() {
		var richiesta = window.confirm("Effettuare il logout?");
		return richiesta;
	}
</script>

<body>
	<fmt:setLocale value="<%=locale%>" />
	<fmt:setBundle basename="it.mytech.bundle.messages"
		var="resourceBundle" />
	<!--==========================
    Header
  ============================-->
	<header id="header">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="#intro" class="scrollto">myTech</a>
				</h1>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">

					<li class="menu-active"><a href="#intro">Home</a></li>
					<li><a href="#about">About Us</a></li>
					<li><a href="#services"><fmt:message key="servizimenu"
								bundle="${resourceBundle}" /></a></li>
					<li><a href="#contact"><fmt:message key="contattigiu"
								bundle="${resourceBundle}" /></a></li>
					<%
						if (nome.equals("")) {
					%>
					<li><a
						href="login.jsp?from=${pageContext.request.requestURI}&locale=<%=locale%>">Login</a></li>
					<%
						} else {
					%>
					<li class="menu-has-children"><a href=""><%=nome%></a>
						<ul>
							<li><a href="logout" onclick="return logout()">Logout</a></li>
						</ul></li>
					<%
						}
					%>
					<li><a href="index.jsp?locale=it_IT"><img
							src="img/italy.jpg"></a></li>
					<li><a href="index.jsp?locale=en_US"><img
							src="img/inglese.jpg"></a></li>
					<li><a href="index.jsp?locale=fr_FR"><img
							src="img/francese.png"></a></li>
					<li><a href="index.jsp?locale=es_US"><img
							src="img/spagna.jpg"></a></li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- #header -->

	<!--==========================
    Intro Section
  ============================-->
	<section id="intro">
		<div class="intro-container">
			<div id="introCarousel" class="carousel  slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<div class="carousel-item active">
						<div class="carousel-background">
							<img src="img/intro-carousel/1.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>
									<fmt:message key="frase1" bundle="${resourceBundle}" />
								</h2>
								<p>
									<fmt:message key="frase2" bundle="${resourceBundle}" />
								</p>
								<a href="#about" class="btn-get-started scrollto"><fmt:message
										key="frase3" bundle="${resourceBundle}" /></a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/2.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>
									<fmt:message key="frase1" bundle="${resourceBundle}" />
								</h2>
								<p>
									<fmt:message key="frase2" bundle="${resourceBundle}" />
								</p>
								<a href="#about" class="btn-get-started scrollto"><fmt:message
										key="frase3" bundle="${resourceBundle}" /></a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/3.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>
									<fmt:message key="frase1" bundle="${resourceBundle}" />
								</h2>
								<p>
									<fmt:message key="frase2" bundle="${resourceBundle}" />
								</p>
								<a href="#about" class="btn-get-started scrollto"><fmt:message
										key="frase3" bundle="${resourceBundle}" /></a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/4.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>
									<fmt:message key="frase1" bundle="${resourceBundle}" />
								</h2>
								<p>
									<fmt:message key="frase2" bundle="${resourceBundle}" />
								</p>
								<a href="#about" class="btn-get-started scrollto"><fmt:message
										key="frase3" bundle="${resourceBundle}" /></a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/5.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>
									<fmt:message key="frase1" bundle="${resourceBundle}" />
								</h2>
								<p>
									<fmt:message key="frase2" bundle="${resourceBundle}" />
								</p>
								<a href="#about" class="btn-get-started scrollto"><fmt:message
										key="frase3" bundle="${resourceBundle}" /></a>
							</div>
						</div>
					</div>

				</div>

				<a class="carousel-control-prev" href="#introCarousel" role="button"
					data-slide="prev"> <span
					class="carousel-control-prev-icon ion-chevron-left"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#introCarousel"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon ion-chevron-right"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>

			</div>
		</div>
	</section>
	<!-- #intro -->

	<main id="main">
		F

		<!--==========================
      About Us Section
    ============================-->
		<section id="about">
			<div class="container">

				<header class="section-header">
					<h3>
						<fmt:message key="about" bundle="${resourceBundle}" />
					</h3>
					<p>
						<fmt:message key="about2" bundle="${resourceBundle}" />
					</p>
				</header>
				<div class="row">

					<div class="col-lg-3 col-md-6 wow fadeInUp">
						<div class="member">
							<img src="img/membro1.jpg" class="img-fluid" alt="">
							<div class="member-info">
								<div class="member-info-content">
									<h4>Francesco Giuri</h4>
									<span>Project Manager e programmatore</span>
									<div class="social">
										<!--<a href=""><i class="fa fa-twitter"></i></a>-->
										<a href="https://www.facebook.com/Francesco.Giuri.00"><i
											class="fa fa-facebook"></i></a> <a
											href="https://www.instagram.com/francescogiuri_/"><i
											class="fa fa-instagram"></i></a>
										<!--<a href=""><i class="fa fa-google-plus"></i></a>-->
										<!--<a href=""><i class="fa fa-linkedin"></i></a>-->
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="member">
							<img src="img/membro2.jpeg" class="img-fluid" alt="">
							<div class="member-info">
								<div class="member-info-content">
									<h4>Cristian Colona</h4>
									<span>Designer Web</span>
									<div class="social">
										<!--<a href=""><i class="fa fa-twitter"></i></a>-->
										<a href="https://www.facebook.com/cristian.colona"><i
											class="fa fa-facebook"></i></a> <a
											href="https://www.instagram.com/cristian_colona/"><i
											class="fa fa-instagram"></i></a>
										<!--<a href=""><i class="fa fa-google-plus"></i></a>-->
										<!--<a href=""><i class="fa fa-linkedin"></i></a>-->
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
						<div class="member">
							<img src="img/membro3.jpeg" class="img-fluid" alt="">
							<div class="member-info">
								<div class="member-info-content">
									<h4>Alessio Cazzato</h4>
									<span>Analista</span>
									<div class="social">
										<!--<a href=""><i class="fa fa-twitter"></i></a>-->
										<a href="https://www.facebook.com/alessio.cazzato.79"><i
											class="fa fa-facebook"></i></a> <a
											href="https://www.instagram.com/alessio_cazzato/"><i
											class="fa fa-instagram"></i></a>
										<!--<a href=""><i class="fa fa-google-plus"></i></a>-->
										<!--<a href=""><i class="fa fa-linkedin"></i></a>-->
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- #about -->

		<!--==========================
      Services Section
    ============================-->
		<section id="services">
			<div class="container">

				<header class="section-header wow fadeInUp">
					<h3>
						<fmt:message key="servizi" bundle="${resourceBundle}" />
					</h3>
					<p>
						<fmt:message key="servizi2" bundle="${resourceBundle}" />
					</p>
				</header>


				<div class="row services-cols">

					<div class="col-md-4 wow fadeInUp">
						<div class="services-col">
							<div class="img">
								<img src="img/hardware.jpg" alt="" class="img-fluid">
								<div class="icon">
									<i class="ion-ios-speedometer-outline"></i>
								</div>
							</div>
							<h2 class="title">Hardware</h2>
							<p style="text-align: center">
								<fmt:message key="hardware" bundle="${resourceBundle}" />
							</p>
						</div>
					</div>

					<div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
						<div class="services-col">
							<div class="img">
								<img src="img/software.jpg" alt="" class="img-fluid">
								<div class="icon">
									<i class="ion-ios-list-outline"></i>
								</div>
							</div>
							<h2 class="title">Software</h2>
							<p style="text-align: center">
								<fmt:message key="software" bundle="${resourceBundle}" />
							</p>
						</div>
					</div>

					<div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
						<div class="services-col">
							<div class="img">
								<img src="img/website.jpg" alt="" class="img-fluid">
								<div class="icon">
									<i class="ion-ios-eye-outline"></i>
								</div>
							</div>
							<h2 class="title">Sito web</h2>
							<p style="text-align: center">
								<fmt:message key="siti" bundle="${resourceBundle}" />

							</p>
						</div>
					</div>

				</div>
			</div>


		</section>
		<!-- #services -->

		<!--==========================
      Call To Action Section
    ============================-->
		<section id="call-to-action" class="wow fadeIn">
			<div class="container text-center">
				<h3>
					<fmt:message key="shop" bundle="${resourceBundle}" />
				</h3>
				<a class="cta-btn" href="servizi?cmd=viewall&locale=<%=locale%>"><fmt:message
						key="shop2" bundle="${resourceBundle}" /></a>
			</div>
		</section>
		<!-- #call-to-action -->

		<!--==========================
      Skills Section
    ============================-->
		<section id="skills">
			<div class="container">

				<header class="section-header">
					<h3>
						<fmt:message key="abilita" bundle="${resourceBundle}" />
					</h3>
					<p>
						<fmt:message key="abilita2" bundle="${resourceBundle}" />
					</p>
				</header>

				<div class="skills-content">

					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar"
							aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
							<span class="skill">Java <i class="val">100%</i></span>
						</div>
					</div>

					<div class="progress">
						<div class="progress-bar bg-info" role="progressbar"
							aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
							<span class="skill">HTTP <i class="val">90%</i></span>
						</div>
					</div>

					<div class="progress">
						<div class="progress-bar bg-warning" role="progressbar"
							aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
							<span class="skill">CSS <i class="val">85%</i></span>
						</div>
					</div>

					<div class="progress">
						<div class="progress-bar bg-danger" role="progressbar"
							aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
							<span class="skill">Javascript <i class="val">75%</i></span>
						</div>
					</div>

				</div>

			</div>
		</section>

		<!--==========================
      Facts Section
    ============================-->
		<section id="facts" class="wow fadeIn">
			<div class="container">

				<header class="section-header">
					<h3>
						<fmt:message key="statistiche" bundle="${resourceBundle}" />
					</h3>
					<p>
						<fmt:message key="statistiche2" bundle="${resourceBundle}" />
					</p>
				</header>

				<div class="row counters">

					<div class="col-lg-3 col-6 text-center">
						<span data-toggle="counter-up"><%=numClienti%></span>
						<p>
							<fmt:message key="clienti" bundle="${resourceBundle}" />
						</p>
					</div>

					<div class="col-lg-3 col-6 text-center">
						<span data-toggle="counter-up"><%=numOrdini%></span>
						<p>
							<fmt:message key="ordini" bundle="${resourceBundle}" />
						</p>
					</div>

					<div class="col-lg-3 col-6 text-center">
						<span data-toggle="counter-up"> <%=numDipendenti%>
						</span>
						<p>
							<fmt:message key="dipendenti" bundle="${resourceBundle}" />
						</p>
					</div>

				</div>

				<div class="facts-img">
					<img src="img/facts-img.png" alt="" class="img-fluid">
				</div>

			</div>
		</section>
		<!-- #facts -->
		<div id="contact1"></div>



		<!--==========================
      Contact Section
    ============================-->
		<section id="contact" class="section-bg wow fadeInUp">
			<div class="container">

				<div class="section-header">
					<h3>
						<fmt:message key="contatti" bundle="${resourceBundle}" />
					</h3>
					<p>
						<fmt:message key="contatti2" bundle="${resourceBundle}" />
					</p>
				</div>

				<div class="row contact-info">

					<div class="col-md-4">
						<div class="contact-address">
							<i class="ion-ios-location-outline"></i>
							<h3>
								<fmt:message key="indirizzo" bundle="${resourceBundle}" />
							</h3>
							<address>
								<fmt:message key="indirizzo2" bundle="${resourceBundle}" />
							</address>
						</div>
					</div>

					<div class="col-md-4">
						<div class="contact-phone">
							<i class="ion-ios-telephone-outline"></i>
							<h3>
								<fmt:message key="telefono" bundle="${resourceBundle}" />
							</h3>
							<p>
								<a href="tel:+393924217260">+39 392 421 7260</a>
							</p>
						</div>
					</div>

					<div class="col-md-4">
						<div class="contact-email">
							<i class="ion-ios-email-outline"></i>
							<h3>Email</h3>
							<p>
								<a href="mailto:mytech.ccg@gmail.com">mytech.ccg@gmail.com</a>
							</p>
						</div>
					</div>

				</div>

				<div class="container">

					<header class="section-header">
						<p>
							<fmt:message key="prenotazione" bundle="${resourceBundle}" />
						</p>
					</header>
				</div>



				<div class="form">
					<div id="sendmessage">
						<fmt:message key="prenotazione2" bundle="${resourceBundle}" />
					</div>
					<!--<div id="errormessage">Errore! Messaggio non inviato.</div>-->
					<form
						action="<%if (!nome.equals("")) {%> prenotazione <%} else {%>
						login.jsp?from=${pageContext.request.requestURI }<%}%>
						"
						method="post" name="form" class="contactForm">
						<input type="hidden" name="check" value="<%=nome%>">
						<div class="form-row">
							<div class="form-group col-md-6">
								<input type="date" name="data" class="form-control"
									data-rule="required" id="name" required
									data-msg="Data della prenotazione" />
								<div class="validation"></div>
							</div>
							<div class="form-group col-md-6">
								<div class="selectform">
									<select name="ora" id="ora"
										style="width: 1000px; background-color: white; color: black">
										<option selected value="10:00">10:00</option>
										<option value="11:00">11:00</option>
										<option value="17:00">17:00</option>
										<option value="18:00">18:00</option>
									</select>
								</div>
								<div class="validation"></div>
							</div>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="message" rows="5"
								data-rule="required" data-msg="Scrivi qualcosa"
								placeholder="Messaggio"></textarea>
							<div class="validation"></div>
						</div>
						<div class="text-center">
							<button type="submit">
								<fmt:message key="invia" bundle="${resourceBundle}" />
							</button>
						</div>
					</form>


				</div>

			</div>
		</section>
		<!-- #contact -->

	</main>

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
										key="servizi" bundle="${resourceBundle}" /></a></li>
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

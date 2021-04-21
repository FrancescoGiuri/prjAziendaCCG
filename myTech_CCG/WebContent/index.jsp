<%@ page language="java" import="it.mytech.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%!int tipo;
	String nome;
	int numDipendenti;
	int numClienti;
	int numOrdini;
	DBManager db;%>
<%
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
</head>
<script type="text/javascript">
	function logout() {
		var richiesta = window.confirm("Effettuare il logout?");
		return richiesta;
	}
</script>

<body>

	<!--==========================
    Header
  ============================-->
	<header id="header">
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

					<li class="menu-active"><a href="#intro">Home</a></li>
					<li><a href="#about">About Us</a></li>
					<li><a href="#services">Servizi</a></li>
					<li><a href="#contact">Contatti</a></li>
					<%
						if (nome.equals("")) {
					%>
					<li><a href="login.jsp?from=${pageContext.request.requestURI}">Login</a></li>
					<%
						} else {
					%>
					<li class="menu-has-children"><a href=""><%=nome%></a>
						<ul>
							<%
								if (tipo == 3) {
							%>
							<li><a href="carrello.jsp">Carrello</a></li>
							<%
								}
							%>

							<li><a href="logout" onclick="return logout()">Logout</a></li>
						</ul></li>
					<%
						}
					%>
					<li><a href="#"><img src="img/italy.jpg"></a></li>
					<li><a href="#"><img src="img/inglese.jpg"></a></li>
					<li><a href="#"><img src="img/francese.png"></a></li>
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
								<h2>Entra nel Tech...con myTech!</h2>
								<p>La professionalità  è alla base del nostro lavoro.</p>
								<a href="#about" class="btn-get-started scrollto">Naviga in
									myTech</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/2.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Entra nel Tech...con myTech!</h2>
								<p>La professionalità  è alla base del nostro lavoro.</p>
								<a href="#about" class="btn-get-started scrollto">Naviga in
									myTech</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/3.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Entra nel Tech...con myTech!</h2>
								<p>La professionalità  è alla base del nostro lavoro.</p>
								<a href="#about" class="btn-get-started scrollto">Naviga in
									myTech</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/4.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Entra nel Tech...con myTech!</h2>
								<p>La professionalità  è alla base del nostro lavoro.</p>
								<a href="#about" class="btn-get-started scrollto">Naviga in
									myTech</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/5.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Entra nel Tech...con myTech!</h2>
								<p>La professionalità  è alla base del nostro lavoro.</p>
								<a href="#about" class="btn-get-started scrollto">Naviga in
									myTech</a>
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

		<!--==========================
      Featured Services Section
    ============================
    <section id="featured-services">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 box">
            <i class="ion-ios-bookmarks-outline"></i>
            <h4 class="title"><a href="">Lorem Ipsum Delino</a></h4>
            <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
          </div>

          <div class="col-lg-4 box box-bg">
            <i class="ion-ios-stopwatch-outline"></i>
            <h4 class="title"><a href="">Dolor Sitema</a></h4>
            <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
          </div>

          <div class="col-lg-4 box">
            <i class="ion-ios-heart-outline"></i>
            <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
            <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
          </div>

        </div>
      </div>
    </section> #featured-services -->

		<!--==========================
      About Us Section
    ============================-->
		<section id="about">
			<div class="container">

				<header class="section-header">
					<h3>About Us</h3>
					<p>myTech è un'azienda che offre fornitura hardware e software.
						Conosci il nostro team!</p>
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
				<!--
        <div class="row about-cols">

          <div class="col-md-4 wow fadeInUp">
            <div class="about-col">
              <div class="img">
                <img src="img/about-mission.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Our Mission</a></h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
              </p>
            </div>
          </div>

          <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
            <div class="about-col">
              <div class="img">
                <img src="img/about-plan.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-list-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Our Plan</a></h2>
              <p>
                Sed ut perspiciatis unde omnis iste natus error sit voluptatem  doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
              </p>
            </div>
          </div>

          <div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
            <div class="about-col">
              <div class="img">
                <img src="img/about-vision.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-eye-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Our Vision</a></h2>
              <p>
                Nemo enim ipsam voluptatem quia voluptas sit aut odit aut fugit, sed quia magni dolores eos qui ratione voluptatem sequi nesciunt Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.
              </p>
            </div>
          </div>

        </div>
      -->
			</div>
		</section>
		<!-- #about -->

		<!--==========================
      Services Section
    ============================-->
		<section id="services">
			<div class="container">

				<header class="section-header wow fadeInUp">
					<h3>I nostri servizi</h3>
					<p>Quali servizi offre esattamente myTech? Scoprili qui!</p>
				</header>

				<!--
        <div class="row">

          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-analytics-outline"></i></div>
            <h4 class="title"><a href="">Lorem Ipsum</a></h4>
            <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-bookmarks-outline"></i></div>
            <h4 class="title"><a href="">Dolor Sitema</a></h4>
            <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-paper-outline"></i></div>
            <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
            <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
            <h4 class="title"><a href="">Magni Dolores</a></h4>
            <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-barcode-outline"></i></div>
            <h4 class="title"><a href="">Nemo Enim</a></h4>
            <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-people-outline"></i></div>
            <h4 class="title"><a href="">Eiusmod Tempor</a></h4>
            <p class="description">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
          </div>

        </div>
        -->
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
							<p style="text-align: center">Visita il nostro shop hardware
								ed effettua i tuoi acquisti!</p>
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
							<p style="text-align: center">Trova il software che fa al
								caso tuo o delle tua azienda!</p>
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
							<p style="text-align: center">Commissionaci il sito web
								ideale per la tua attività !</p>
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
				<h3>Visualizza i nostri prodotti</h3>
				<a class="cta-btn" href="servizi?cmd=viewall">Vai allo shop</a>
			</div>
		</section>
		<!-- #call-to-action -->

		<!--==========================
      Skills Section
    ============================-->
		<section id="skills">
			<div class="container">

				<header class="section-header">
					<h3>Le nostre abilità </h3>
					<p>Noi di myTech siamo sinceri e professionali. Ecco il nostro
						livello di competenza nelle mansioni che puoi affidarci!</p>
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
					<h3>Statistiche</h3>
					<p>Ti presentiamo un'analisi delle nostre statistiche</p>
				</header>

				<div class="row counters">

					<div class="col-lg-3 col-6 text-center">
						<span data-toggle="counter-up"><%=numClienti%></span>
						<p>Clienti</p>
					</div>

					<div class="col-lg-3 col-6 text-center">
						<span data-toggle="counter-up"><%=numOrdini%></span>
						<p>Ordini</p>
					</div>

					<div class="col-lg-3 col-6 text-center">
						<span data-toggle="counter-up"> <%=numDipendenti%>
						</span>
						<p>Dipendenti</p>
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
					<h3>Contattaci</h3>
					<p>Ecco le nostre informazioni di contatto. Puoi anche
						contattarci compilando il modulo sotto.</p>
				</div>

				<div class="row contact-info">

					<div class="col-md-4">
						<div class="contact-address">
							<i class="ion-ios-location-outline"></i>
							<h3>Indirizzo</h3>
							<address>via Roma, Torino (TO)</address>
						</div>
					</div>

					<div class="col-md-4">
						<div class="contact-phone">
							<i class="ion-ios-telephone-outline"></i>
							<h3>Telefono</h3>
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
						<p>Invia una richiesta di prenotazione!</p>
					</header>
				</div>



				<div class="form">
					<div id="sendmessage">La tua richiesta di prenotazione è
						stata inviata! Riceverai a breve una mail di avvenuta ricezione.</div>
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
							<button type="submit">Invia</button>
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

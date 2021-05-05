<%@ page language="java" import="java.util.*,it.mytech.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%!int tipo;
	String nome;
	Prodotto p;%>
<%
	try {
	nome = (String) session.getAttribute("SESSION_USERNAME");
	if (nome == null)
		nome = "";
	tipo = (Integer) session.getAttribute("SESSION_USER_TYPE");
	p = (Prodotto) session.getAttribute("MODIFICA_PRODOTTO");
} catch (Exception e) {
	nome = "";
	tipo = 0;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>myTech-Modifica Prodotto</title>
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
					<a href="index.jsp" onclick="eeturn logout()" class="scrollto">myTech</a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li><a href="admin.jsp">Home</a></li>
					<li><a href="dipendenti.jsp">Dipendenti</a></li>
					<li><a href="prodotti.jsp">Prodotti</a></li>
					<li><a href="ordiniN.jsp">Nuovi Ordini</a></li>
					<li><a href="clienti.jsp">Clienti</a></li>
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
	<br>


	<div class="table-wrapper">
		<div class="table-title">
			<div class="row">
				<div class="col-sm-6">
					<h2>Modifica Prodotto</h2>
				</div>
			</div>
		</div>
		<form action="prodotti?cmd=modifica" method="post">
			<table class="table table-striped table-hover">
				<tr>
					<td><h3>ID</h3></td>
					<td><input type="text" name="id" required maxlength="4"
						size="60" readonly="readonly" value="<%=p.getIdProdotto()%>"></td>
				</tr>
				<tr>
					<td><h3>Nome</h3></td>
					<td><input type="text" name="nome" required maxlength="40"
						size="60" value="<%=p.getNome()%>"></td>
				</tr>
				<tr>
					<td><h3>Descrizione</h3></td>
					<td><textarea name="descrizione" rows="2" required cols="61"
							data-msg="Scrivi qualcosa" placeholder="Descrizione del prodotto"><%=p.getDescrizione()%></textarea></td>
				</tr>
				<tr>
					<td><h3>Tipo</h3></td>
					<td><select class="custom-select" name="tipo">
							<option value="1" <%if (p.getTipo() == 1) {%> selected <%}%>>Hardware</option>
							<option value="2" <%if (p.getTipo() == 2) {%> selected <%}%>>Software</option>
					</select></td>
				</tr>
				<tr>
					<td><h3>Marca</h3></td>
					<td><textarea name="marca" rows="2" required cols="61"><%=p.getMarca()%></textarea></td>
				</tr>
				<tr>
					<td><h3>Prezzo</h3></td>
					<td><input type="number" name="prezzo" style="width: 512px;"
						min="0" value="<%=p.getPrezzo()%>"></td>
				</tr>
				<tr>
					<td><h3>Disponibilità</h3></td>
					<td><input type="number" name="disponibilita"
						style="width: 512px;" min="0" value="<%=p.getDisponibilità()%>"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><input type="reset"
						class="cart" value="RESET"> <input type="submit"
						class="cart" value="MODIFICA"></td>
				</tr>
			</table>
		</form>
	</div>



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
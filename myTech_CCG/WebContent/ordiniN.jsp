<%@ page language="java" import="java.util.*,it.mytech.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<%!int tipo;
	String nome;
	int num;
	DBManager db;
	ArrayList<Integer> clientiOrdini;
	ArrayList<String> nomi;
	int i;%>
<%
	try {
	nome = (String) session.getAttribute("SESSION_USERNAME");
	if (nome == null)
		nome = "";
	db = new DBManager();
	clientiOrdini = db.clientiOrdini();
	i = 0;
	nomi = new ArrayList<String>();
	i = 0;
	for (i = 0; i < clientiOrdini.size(); i++)
		nomi.add(db.getNomeCliente(clientiOrdini.get(i)));
	i = 0;
	tipo = (Integer) session.getAttribute("SESSION_USER_TYPE");

} catch (Exception e) {
	nome = "";
	tipo = 0;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myTech-Ordini</title>
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
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css"
	href="DataTables/datatables.min.css" />
<script type="text/javascript" src="DataTables/datatables.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/zf/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.css" />

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/v/zf/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.js"></script>


<link rel="alternate" type="application/rss+xml" title="RSS 2.0"
	href="http://www.datatables.net/rss.xml">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<style type="text/css" class="init">
</style>

<script type="text/javascript" language="javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" class="init">
	$(document)
			.ready(
					function() {
						var table = $('#example').DataTable({
							columnDefs : [ {
								orderable : false,
								targets : [ 1, 2, 3 ]
							} ]
						});

						$('button')
								.click(
										function() {
											var data = table.$('input, select')
													.serialize();
											alert("The following data would have been submitted to the server: \n\n"
													+ data.substr(0, 120)
													+ '...');
											return false;
										});
					});

	function logout() {
		var richiesta = window.confirm("Effettuare il logout?");
		return richiesta;
	}
</script>
</head>

</head>
<body>
	<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/myTech?serverTimezone=UTC"
		user="root" password="" />

	<sql:query var="Ordini" dataSource="${myDS}">
        SELECT * FROM ORDINE WHERE ELABORATO=0;
    </sql:query>


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
			<li><a href="dipendenti.jsp">Dipendenti</a></li>
			<li><a href="prodotti.jsp">Prodotti</a></li>
			<li><a href="ordiniN.jsp">Ordini</a></li>
			<li><a href="">Clienti</a></li>
			<li><a href="">Prenotazioni</a></li>

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
    ============================-->
	<section id="services">

	<div class="visTabella" style="max-width: 1000px;">
		<center>

			<header class="section-header wow fadeInUp">
			<h3>Ordini in arrivo</h3>
			</header>
			<br> <br> <br>

			<table id="example" class="display" style="width: 100%" border="1"
				cellpadding="5" style="text-align=center;">
				<thead>
					<tr>
						<th>ID</th>
						<th>Data</th>
						<th>Elaborato</th>
						<th>Cliente</th>
						<th>Ordine completato</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="ordine" items="${Ordini.rows}">

						<tr>
							<td><c:out value="${ordine.idOrdine}" /></td>
							<td align=center><textarea name="data" cols="10" rows="1"
									disabled style="resize: none;"><c:out
										value="${ordine.data}" /></textarea></td>
							<td align=center><c:choose>
									<c:when test="${ordine.elaborato==0}">
										No
									</c:when>
									<c:otherwise>
										Si
									</c:otherwise>
								</c:choose></td>
							<td align=center><textarea name="email" cols="25" rows="1"
									disabled><c:out value="${ordine.idCliente}" /> - (<%=nomi.get(i)%>)
									<%
								i++;
							%>
								</textarea></td>
							<td align=center><a
								href="prodotti?cmd=elabora&id=${ordine.idOrdine}"><input
									type="button" value="Completa" class="btn"
									<c:choose>
									<c:when test="${ordine.elaborato==1}">
										disabled
									</c:when>
								</c:choose>></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</center>
	</div>
	</section>
</body>
</html>


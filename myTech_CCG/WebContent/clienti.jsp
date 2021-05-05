<%@ page language="java" import="java.util.*,it.mytech.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<%!int tipo;
	String nome;
	int num;%>
<%
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myTech-Clienti</title>
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

<!-- File export -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css">
<script type="text/javascript" language="javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>

<script type="text/javascript" language="javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>

<script type="text/javascript" language="javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>

<script type="text/javascript" language="javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>

<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>

<script type="text/javascript" language="javascript"
	src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
<script type="text/javascript" class="init">
	/*$(document)
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
	 });*/
	$(document).ready(function() {
		$('#example').DataTable({
			dom : 'Bfrtip',
			buttons : [ 'copy', 'excel', 'pdf', 'print' ]

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

	<sql:query var="Clienti" dataSource="${myDS}">
        SELECT * FROM CLIENTE;
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
	<!--========================== 
      Services Section
    ============================-->
	<section id="services"> <!--  <div class="container">-->

	<div class="visTabella" style="max-width: 1000px;">
		<center>

			<header class="section-header wow fadeInUp">
			<h3>Clienti</h3>
			</header>
			<br> <br> <br>


			<form action="dipendenti?cmd=modifica" method="POST">
				<table id="example" class="display" style="width: 100%" border="1"
					cellpadding="5">
					<thead>
						<tr>
							<th>ID</th>
							<th>Email</th>
							<th>Nome</th>
							<th>Indirizzo</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="cliente" items="${Clienti.rows}">

							<tr>
								<td><c:out value="${cliente.idCliente}" /></td>
								<td><c:out value="${cliente.email}" /></td>
								<td><c:out value="${cliente.nome}" /></td>
								<td><c:out value="${cliente.indirizzo}" /></td>
								<td align=center><a
									href="clienti?cmd=elimina&id=${cliente.idCliente}"><input
										type="button" value="Elimina" class="btn2"></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</center>
	</div>
	<!-- </div> --> </section>
</body>
</html>


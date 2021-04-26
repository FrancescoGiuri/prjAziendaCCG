<%@ page language="java" import="java.util.*,it.mytech.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%!ArrayList<Prodotto> elenco;
	ArrayList<Integer> quantita;
	int i;
	Prodotto p;
	float totale;
	String locale;%>
<%
	totale = 0;
elenco = (ArrayList<Prodotto>) session.getAttribute("SESSION_PRODOTTI_CARRELLO");
quantita = (ArrayList<Integer>) session.getAttribute("SESSION_QUANTITA_CARRELLO");
locale = request.getParameter("locale");
application.setAttribute("LOCALE_KEY", locale);
%>


<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>myTech-Carrello</title>
<link href="css/cart.css" rel="stylesheet">
</head>
<body>
	<fmt:setLocale value="<%=locale%>" />
	<fmt:setBundle basename="it.mytech.bundle.messages"
		var="resourceBundle" />
	<header id="site-header">
		<div class="container">
			<h1>
				<fmt:message key="carrello" bundle="${resourceBundle}" />
				<a href="servizi?cmd=viewall"><input class="cart" type="button"
					name=""
					value="<fmt:message key="carrello" bundle="${resourceBundle}" />"
					style="float: right"></a>
			</h1>
		</div>
	</header>

	<div class="container">

		<section id="cart">
			<%
				if (elenco != null) {
				for (i = 0; i < elenco.size(); i++) {
					p = (Prodotto) elenco.get(i);
					totale += p.getPrezzo() * quantita.get(i);
			%>
			<article class="product">
				<header>
					<a
						href="carrelloservlet?cmd=removeprodotto&id=<%=p.getIdProdotto()%>"
						class="remove"> <img src="img/prodotti/<%=p.getImmagine()%>"
						alt="">

						<h3>
							<fmt:message key="rimuovi" bundle="${resourceBundle}" />
						</h3>
					</a>
				</header>

				<div class="content">

					<h1><%=p.getNome()%></h1>

					<fmt:message key="marca" bundle="${resourceBundle}" />
					:<%=p.getMarca()%><br>
				</div>

				<footer class="content">
					<span class="qt"><fmt:message key="quantita"
							bundle="${resourceBundle}" /> :</span> <span class="qt"><%=quantita.get(i)%></span>

					<h2 class="full-price">
						€<%=p.getPrezzo() * quantita.get(i)%></h2>

				</footer>
			</article>
			<%
				}
			} else {
			%>
			<h1>
				<fmt:message key="nessunprodotto" bundle="${resourceBundle}" />
			</h1>
			<%
				}
			%>

		</section>

	</div>
	<%
		if (elenco != null) {
	%>
	<footer id="site-footer">
		<div class="container clearfix">
			<div class="left">
				<h2 class="subtotal">
					Subtotale: €<span><%=totale%></span>
				</h2>
				<h3 class="tax">
					IVA (22%): €<span> <%=totale + 22 / 100 * totale%>
					</span>
				</h3>
				<!-- 
				<h3 class="shipping">
					Trasporto: €<span>5.00</span>
				</h3>
				 -->
			</div>

			<div class="right">
				<h1 class="total">
					<fmt:message key="totale" bundle="${resourceBundle}" />
					: €<span><%=totale + 22 / 100 * totale%></span>
				</h1>
				<form action="ordine" method="POST">
					<button type="submit" class="btn">
						<fmt:message key="ordina" bundle="${resourceBundle}" />
					</button>
				</form>
			</div>

		</div>
	</footer>
	<%
		}
	%>
</body>
</html>

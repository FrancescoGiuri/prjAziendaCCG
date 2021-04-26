<%@ page language="java" import="java.util.*,it.mytech.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%!ArrayList<Prodotto> elenco;
	ArrayList<Integer> quantita;
	int i;
	Prodotto p;
	float totale;%>
<%
	totale = 0; //costo
elenco = (ArrayList<Prodotto>) session.getAttribute("SESSION_PRODOTTI_CARRELLO");
quantita = (ArrayList<Integer>) session.getAttribute("SESSION_QUANTITA_CARRELLO");
%>


<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>myTech-Carrello</title>
<link href="css/cart.css" rel="stylesheet">
</head>
<body>
	<header id="site-header">
		<div class="container">
			<h1>
				Carrello <a href="servizi?cmd=viewall"><input class="cart" type="button"
					name="" value="Torna allo shop" style="float: right"></a>
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
					<a href="carrelloservlet?cmd=removeprodotto&id=<%=p.getIdProdotto()%>" class="remove"> <img src="img/prodotti/<%=p.getImmagine()%>"
						alt="">

						<h3>Remove product</h3>
					</a>
				</header>

				<div class="content">

					<h1><%=p.getNome()%></h1>

					Marca:<%=p.getMarca()%><br>
				</div>

				<footer class="content">
					<span class="qt">Quantità :</span> <span class="qt"><%=quantita.get(i)%></span>

					<h2 class="full-price">
						€<%=p.getPrezzo() * quantita.get(i)%></h2>

				</footer>
			</article>
			<%
				}
			} else {
			%>
			<h1>Nessun prodotto nel carrello</h1>
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
				<h3 class="shipping">
					Trasporto: €<span>5.00</span>
				</h3>
			</div>

			<div class="right">
				<h1 class="total">
					Totale: €<span><%=totale + 22 / 100 * totale + 5%></span>
				</h1>
				<form action="ordine" method="POST">
					<button type="submit" class="btn">Effettua ordine</button>
				</form>
			</div>

		</div>
	</footer>
	<%
		}
	%>
</body>
</html>

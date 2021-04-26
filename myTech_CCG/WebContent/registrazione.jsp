<%@ page language="java" import="it.mytech.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%!String locale;%>
<%
	locale = request.getParameter("locale");
application.setAttribute("LOCALE_KEY", locale);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>myTech-Registrazione</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--=============================================================================================== -->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util-login.css">
<link rel="stylesheet" type="text/css" href="css/main-login.css">
<!--===============================================================================================-->
</head>
<script>
	function checkPassword() {
		var password = document.registrazione.pass.value;
		var conferma = document.registrazione.passConferma.value;
		if (password != conferma) {
			alert("Conferma password errata");
			document.registrazione.passConferma.value = "";
			document.registrazione.passConferma.focus();
			return false;
		} else {
			document.registrazione.action = "register";
			document.invio.submit();
		}

	}
</script>

<body>
	<fmt:setLocale value="<%=locale%>" />
	<fmt:setBundle basename="it.mytech.bundle.messages"
		var="resourceBundle" />
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100-registrazione">
				<div class="login100-pic js-tilt" data-tilt>
					<br> <br> <img src="img/logo.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" method="POST"
					name="registrazione">
					<span class="login100-form-title"><fmt:message
							key="registrati" bundle="${resourceBundle}" /></span>

					<div class="wrap-input100 validate-input"
						data-validate="Inserisci un'email valida">
						<input class="input100" type="text" name="email"
							placeholder="Email"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Nome azienda">
						<input class="input100" type="text" name="nome"
							placeholder="Nome azienda/cliente"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-address-book" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Indirizzo">
						<input class="input100" type="text" name="indirizzo"
							placeholder="Indirizzo"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-map-marker"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Inserisci una password">
						<input class="input100" type="password" name="pass"
							placeholder="Password"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-lock"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Inserisci una password">
						<input class="input100" type="password" name="passConferma"
							placeholder="Ripeti password"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" onclick="checkPassword()"
							class="login100-form-btn">Sign up</button>
					</div>

					<div class="text-center p-t-12">
						<a class="txt2" href="index.jsp"> Home</a> &nbsp&nbsp/&nbsp&nbsp<span
							class="txt1"> Forgot </span> <a class="txt2"
							href="forgotPassword.jsp"> Password? </a> &nbsp&nbsp/&nbsp&nbsp <a
							class="txt2" href="login.jsp"><fmt:message key="accedi2"
								bundle="${resourceBundle}" /><i
							class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i> </a>
					</div>
				</form>
			</div>
		</div>
	</div>




	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale : 1.1
		})
	</script>
	<!--===============================================================================================-->
	<script src="js/main-login.js"></script>

</body>
</html>

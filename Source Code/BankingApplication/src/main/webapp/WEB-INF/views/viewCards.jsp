<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Cards</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>

</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" id="brand" href="#">
       Northeastern Bank
       <!--  <img alt="Brand" src="${pageContext.request.contextPath}/resources/images/northeastern-university-logo.jpg">-->
      </a>
     
     <p class="navbar-text navbar-right">Signed in as <a href="#" class="navbar-link">${requestScope.customer.firstName} ${requestScope.customer.lastName}</a></p><br><br>
    </div>
  </div>
</nav>

<!--  Header Begins  -->
<div class="container">
<div class="row">
<div class="col-lg-10">
Hello, ${sessionScope.customer.firstName}
</div>
<div class="col-lg-1">
<form method="post" action="customerHome.htm"><input type="submit" class="btn btn-info"value="Home"> </form>
</div>
<div class="col-lg-1">
<form:form action="logout.htm">
						<input type="submit" class="btn btn-success" name="logout" value="Logout" />
					</form:form>
</div>



</div>
</div>
<!--  Header closes  -->

<div class="container">
<div class="row">

Debit Card:
<div class="col-lg-12">
<table class="table table-striped">
		<th>Card Name</th><th>Card Number</th><th>Delete</th>
		<c:forEach items="${sessionScope.customer.bankAccounts}" var="account" >
		<tr><td>${account.associatedDebitCard.cardName} <!-- ${beneficiary.belongToCustomer.lastName} --></td><td>${account.associatedDebitCard.cardNumber}</td><td><input type="submit" class="btn btn-danger" value="Delete"/></td></tr>
		</c:forEach>
		</table>

</div>
</div>
<div class="row">

Credit Cards:
<div class="col-lg-12">
<table class="table table-striped">
		<th>Card Name</th><th>Card Number</th><th>Delete</th>
		<c:forEach items="${sessionScope.customer.bankAccounts}" var="account" >
		<c:if test="${account.registeredCreditCardsList.size()==0}">Null</c:if>
			<c:forEach items="${account.registeredCreditCardsList}" var="card">
		
			<tr><td>${card.cardName}</td><td>${card.cardNumber}</td><td><input type="submit" class="btn btn-danger" value="Delete"/></td></tr>
			</c:forEach>
		
		</c:forEach>
		
		
		
		</table>

</div>

</div>
</div>

</body>
</html>
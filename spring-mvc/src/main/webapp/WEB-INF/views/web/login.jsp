<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body class="text-center">

	<div class='container' style='padding-top:50px; width:50%'>
		<form class="form-signin" action='<c:url value="/trang-chu/loginVerify"></c:url>' method='post'>
			<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
			<label for="inputEmail" class="sr-only">Email address</label> 
			<input type="text" name='username' id="inputEmail" class="form-control"
				placeholder="Email address" required="" autofocus=""> <label
				for="inputPassword" class="sr-only">Password</label> 
			<input type="password" name='password' id="inputPassword" class="form-control"
				placeholder="Password" required="">
			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>
		</form>
	</div>
</body>
</html>
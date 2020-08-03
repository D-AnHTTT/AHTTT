<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/common/taglib.jsp"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
	<div class="container">
		<a class="navbar-brand" href="<c:url value='/trang-chu/newFeed'></c:url>">HTTT project -demo-</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="<c:url value='/trang-chu/newFeed'></c:url>">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<!-- <li class="nav-item"><a class="nav-link" href="#">About</a></li> -->
				<li class="nav-item"><a class="nav-link" href="#">Advance
						Search</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Profile</a>
					<div class="dropdown-menu">
					<c:choose>
						<c:when test='${sessionScope.username == ""||sessionScope.username==null  }'>
							<a class="dropdown-item" href="#">Info</a> 
						</c:when>
						<c:when test='${sessionScope.username != "" }'>
							<a class="dropdown-item" href="#">${sessionScope.username }</a> 
						</c:when>
					</c:choose>
						<a class="dropdown-item" href="#">Notification</a> 
						<a class="dropdown-item" href="#">Log in</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="<c:url value='/trang-chu/logout'></c:url>">Log out</a>
					<!-- </div> <a class="nav-link" href="#">Profile</a></li> -->
			</ul>
		</div>
		<input type='hidden' name='username' value='${sessionScope.username }'>
		<input type='hidden' name='password' value='${sessionScope.password }'>
	</div>
</nav>
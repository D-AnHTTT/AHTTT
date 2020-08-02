<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"
	href="<c:url value='/template/web/vendor/common/icon.png'/>">
<title>Trang chủ</title>

<!-- Bootstrap core CSS -->
<link
	href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.css'/>"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/small-business.css'/>"
	rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="/common/web/header.jsp"%>
	<div style ='padding-left:100px; padding-right:50px'>

		<div class="row">
			<!-- Navigation -->
			<div class="col-lg-8">
				<dec:body />
			</div>
			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-append">
								<button class="btn btn-secondary" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">Categories</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">Web Design</a></li>
									<li><a href="#">HTML</a></li>
									<li><a href="#">Freebies</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">JavaScript</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">Tutorials</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">Side Widget</h5>
					<div class="card-body">You can put anything you want inside
						of these side widgets. They are easy to use, and feature the new
						Bootstrap 4 card containers!</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/common/web/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script
		src="<c:url value='/template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/template/web/vendor/common/common.js'/>"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}
.rating-box h1 {
	margin: 0 0 30px;
	font-size: 40px;
}

.rating-box .ratings .fa {
	font-size: 25px;
	color: #FF9800;
	float: left;
	cursor: pointer;
}

.rating-box input {
	margin-top: 20px;
	font-size: 30px;
	padding: 6px 12px;
}
#result {
	position: absolute;
	width: 80%;
	max-width: 870px;
	cursor: pointer;
	overflow-y: auto;
	max-height: 400px;
	box-sizing: border-box;
	z-index: 1001;
}

.link-class:hover {
	background-color: #f1f1f1;
}
</style>
<meta charset="UTF-8">
<link rel="icon"
	href="<c:url value='/template/web/vendor/common/icon.png'/>">
<title>Trang chủ</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<div style='padding-left: 100px; padding-right: 50px'>
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
						<form
							action='<c:url value='/trang-chu/search?${_csrf.parameterName}=${_csrf.token}'></c:url>'
							method="post">
							<div class="input-group">
								<input
									onkeyup="return searchPost('${pageContext.request.contextPath}')"
									onfocus="return searchOnFocus('${pageContext.request.contextPath}')"
									<%-- onblur="return searchOutFocus('${pageContext.request.contextPath}')" --%>
									type="text" name="search" id="search" class="form-control" />
								<span class="input-group-append">
									<button class="btn btn-secondary" type="submit">Go!</button>
								</span>
							</div>
						</form>
						<ul class="list-group" id="result"></ul>
						<br />
					</div>
				</div>



				<!-- Categories Widget -->
				<!-- <div class="card my-4">
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
				</div> -->

				<!-- Side Widget -->

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

	<script>
	
		$(document).ready(function() {
			$('#result').on('click', 'li', function() {
				var click_text = $(this).text().split('|');
				$('#search').val($.trim(click_text[0]));
				$("#result").html('');
			});
		});
	</script>
	
</body>
</html>
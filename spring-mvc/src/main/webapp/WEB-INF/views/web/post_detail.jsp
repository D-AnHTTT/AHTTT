<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Post Content Column -->
			<div class="col-lg-12">

				<!-- Title -->
				<h1 class="mt-4">${postDetail.getTitle() }</h1>

				<!-- Author -->
				<p class="lead">
					by <a href="<c:url value='/trang-chu/profile'></c:url>">${sessionScope.username }</a>
				</p>
				<form action='<c:url value="/trang-chu/saveRate"></c:url>'>
					<div class="rating-box">
						<div class="ratings">
							<span class="fa fa-star-o"></span> <span class="fa fa-star-o"></span>
							<span class="fa fa-star-o"></span> <span class="fa fa-star-o"></span>
							<span class="fa fa-star-o"></span> <span class="fa fa-star-o"></span>
							<span class="fa fa-star-o"></span> <span class="fa fa-star-o"></span>
							<span class="fa fa-star-o"></span> <span class="fa fa-star-o"></span>
						</div>
						Số người: ${quantityRate} Trùng bình ${avgRate} <input
							type="hidden" name="quantity" id="rating-value"> <input
							type="hidden" name="username" value="${sessionScope.username }">
						<input type="hidden" name="postid" value="${postDetail.getId()}">

						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>

				<p class="lead">
					<span>in category</span> <span class="text-primary">${categoryPostName }</span>
				</p>

				<hr>

				<!-- Date/Time -->
				<p>Posted on January 1, 2019 at 12:00 PM</p>

				<hr>

				<!-- Preview Image -->
				<img src="<c:url value='/file/${postDetail.getImgThumbnail() }'/>"
					class="img-thumbnail" alt="Hinh anh thumbnail cua post" width="900"
					height="300">
				<!-- <img class="img-fluid rounded" src="http://placehold.it/900x300"
					alt=""> -->

				<hr>

				<!-- Post Content -->
				<p>${postDetail.getContent() }</p>
				<hr>
				<!--/.Carousel Wrapper-->
				<div id="carousel-example-2"
					class="carousel slide carousel-fade z-depth-1-half"
					data-ride="carousel">
					<!--Indicators-->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-2" data-slide-to="0"
							class="active"></li>
						<c:forEach var='count' begin='1' end='${listImgPost.size()-1 }'>
							<li data-target="#carousel-example-2" data-slide-to="${count }"></li>
						</c:forEach>
						<!-- <li data-target="#carousel-example-2" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-2" data-slide-to="1"></li> -->
						<!-- <li data-target="#carousel-example-2" data-slide-to="2"></li> -->
					</ol>
					<!--/.Indicators-->
					<!--Slides-->
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<div class="view">
								<img src="<c:url value='/file/${listImgPost.get(0) }'/>"
									class="img-thumbnail" alt="Hinh anh thumbnail cua post"
									width="900" height="300">
								<!-- <img class="d-block w-100"
									src="https://mdbootstrap.com/img/Photos/Slides/img%20(105).jpg"
									alt="First slide"> -->
								<div class="mask rgba-black-light"></div>
							</div>
							<div class="carousel-caption">
								<!-- <h3 class="h3-responsive">This is the first title</h3>
						<p>First text</p> -->
							</div>
						</div>
						<c:forEach var='img' begin='1' end='${listImgPost.size()-1 }'>

							<div class="carousel-item">
								<!--Mask color-->
								<div class="view">
									<img src="<c:url value='/file/${listImgPost.get(img) }'/>"
										class="img-thumbnail" alt="Hinh anh thumbnail cua post"
										width="900" height="300">
									<!-- <img class="d-block w-100"
									src="https://mdbootstrap.com/img/Photos/Slides/img%20(115).jpg"
									alt="Second slide"> -->
									<div class="mask rgba-black-light"></div>
								</div>
								<div class="carousel-caption">
									<!-- <h3 class="h3-responsive">Thir is the second title</h3>
						<p>Secondary text</p> -->
								</div>
							</div>
						</c:forEach>

					</div>
					<!--/.Slides-->
					<!--Controls-->
					<a class="carousel-control-prev" href="#carousel-example-2"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carousel-example-2"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
					<!--/.Controls-->
				</div>
				<!--/.Carousel Wrapper-->
				<!-- Comments Form -->
				<div class="card my-4">
					<h5 class="card-header">Leave a Comment:</h5>
					<div class="card-body">

						<form action='<c:url value="/trang-chu/saveCommenst"></c:url>'>
							<div class="form-group">
								<textarea class="form-control" name="comment" rows="3"></textarea>
								<input type="hidden" name="username"
									value="${sessionScope.username }"> <input type="hidden"
									name="postid" value="${postDetail.getId() }">


							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>


				<!-- Single Comment -->

				<c:forEach var="items" items="${listcomment}">
					<div class="media mb-4">
						<img class="d-flex mr-3 rounded-circle"
							src="http://placehold.it/50x50" alt="">
						<div class="media-body">
							<h5 class="mt-0">${items.getUser_name()}</h5>
							${items.getContent()}
						</div>
					</div>
				</c:forEach>
				<!-- Comment with nested comments -->

			</div>


		</div>
		<!-- /.row -->

		<!-- /.container -->

	</div>
	<script type="text/javascript">
		const stars = document.querySelector(".ratings").children;
		const ratingValue = document.querySelector("#rating-value");
		let index;

		for (let i = 0; i < stars.length; i++) {
			stars[i].addEventListener("mouseover", function() {
				// console.log(i)
				for (let j = 0; j < stars.length; j++) {
					stars[j].classList.remove("fa-star");
					stars[j].classList.add("fa-star-o");
				}
				for (let j = 0; j <= i; j++) {
					stars[j].classList.remove("fa-star-o");
					stars[j].classList.add("fa-star");
				}
			})
			stars[i].addEventListener("click", function() {
				ratingValue.value = i + 1;
				index = i;
			})
			stars[i].addEventListener("mouseout", function() {

				for (let j = 0; j < stars.length; j++) {
					stars[j].classList.remove("fa-star");
					stars[j].classList.add("fa-star-o");
				}
				for (let j = 0; j <= index; j++) {
					stars[j].classList.remove("fa-star-o");
					stars[j].classList.add("fa-star");
				}
			})
		}
	</script>
</body>
</html>
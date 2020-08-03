<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					by <a href="#">Start Bootstrap</a>
				</p>

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
				<!-- <p class="lead">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Ducimus, vero, obcaecati, aut, error quam
					sapiente nemo saepe quibusdam sit excepturi nam quia corporis
					eligendi eos magni recusandae laborum minus inventore?</p>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut,
					tenetur natus doloremque laborum quos iste ipsum rerum obcaecati
					impedit odit illo dolorum ab tempora nihil dicta earum fugiat.
					Temporibus, voluptatibus.</p>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Eos, doloribus, dolorem iusto blanditiis unde eius illum
					consequuntur neque dicta incidunt ullam ea hic porro optio ratione
					repellat perspiciatis. Enim, iure!</p>

				<blockquote class="blockquote">
					<p class="mb-0">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Integer posuere erat a ante.</p>
					<footer class="blockquote-footer">
						Someone famous in <cite title="Source Title">Source Title</cite>
					</footer>
				</blockquote>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Error, nostrum, aliquid, animi, ut quas placeat totam sunt tempora
					commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem
					obcaecati?</p>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Harum, dolor quis. Sunt, ut, explicabo, aliquam tenetur ratione
					tempore quidem voluptates cupiditate voluptas illo saepe quaerat
					numquam recusandae? Qui, necessitatibus, est!</p> -->

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
						<!-- <div class="carousel-item">
							Mask color
							<div class="view">
								<img class="d-block w-100"
									src="https://mdbootstrap.com/img/Photos/Slides/img%20(108).jpg"
									alt="Third slide">
								<div class="mask rgba-black-light"></div>
							</div>
							<div class="carousel-caption">
						<h3 class="h3-responsive">This is the third title</h3>
						<p>Third text</p>
					</div>
						</div> -->
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
						<form>
							<div class="form-group">
								<textarea class="form-control" rows="3"></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>

				<!-- Single Comment -->
				<div class="media mb-4">
					<img class="d-flex mr-3 rounded-circle"
						src="http://placehold.it/50x50" alt="">
					<div class="media-body">
						<h5 class="mt-0">Commenter Name</h5>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					</div>
				</div>

				<!-- Comment with nested comments -->
				<div class="media mb-4">
					<img class="d-flex mr-3 rounded-circle"
						src="http://placehold.it/50x50" alt="">
					<div class="media-body">
						<h5 class="mt-0">Commenter Name</h5>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

						<div class="media mt-4">
							<img class="d-flex mr-3 rounded-circle"
								src="http://placehold.it/50x50" alt="">
							<div class="media-body">
								<h5 class="mt-0">Commenter Name</h5>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
								scelerisque ante sollicitudin. Cras purus odio, vestibulum in
								vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
								nisi vulputate fringilla. Donec lacinia congue felis in
								faucibus.
							</div>
						</div>

						<div class="media mt-4">
							<img class="d-flex mr-3 rounded-circle"
								src="http://placehold.it/50x50" alt="">
							<div class="media-body">
								<h5 class="mt-0">Commenter Name</h5>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
								scelerisque ante sollicitudin. Cras purus odio, vestibulum in
								vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
								nisi vulputate fringilla. Donec lacinia congue felis in
								faucibus.
							</div>
						</div>

					</div>
				</div>

			</div>


		</div>
		<!-- /.row -->

		<!-- /.container -->

	</div>
</body>
</html>
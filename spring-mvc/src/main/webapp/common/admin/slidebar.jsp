<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul class="sidebar navbar-nav">
	<li class="nav-item active"><a class="nav-link" href="index.html">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
	</a></li>
	<li class="nav-item"><a class="nav-link"
		href='<c:url value="/admin/post"/>'> <i class="fas fa-fw fa-table"></i>
			<span>DS bài viết</span><br>

	</a></li>
	<li class="nav-item"><a class="nav-link"
		href='<c:url value="/admin/user"/>'> <i class="fas fa-fw fa-table"></i>
			<span>DS người dùng</span><br>

	</a></li>
	<li class="nav-item"><a class="nav-link"
		href='<c:url value="/admin/comment"/>'> <i
			class="fas fa-fw fa-table"></i> <span>DS bình luận</span><br>

	</a></li>
	<li class="nav-item"><a class="nav-link"
		href='<c:url value="/admin/rate"/>'> <i class="fas fa-fw fa-table"></i>
			<span>DS đánh giá</span><br>

	</a></li>
	<li class="nav-item"><a class="nav-link"
		href='<c:url value="/logout"/>'> <i class="fas fa-fw fa-table"></i>
			<span>Logout</span><br>

	</a></li>

</ul>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
.user input, button {
	width: 100%;
	height: 35px;
	
}
</style>
<%@ include file="/common/admin/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">

			<div class="user" align="center">
				<div align="center">

					<h2>Thêm Bài Viết</h2>

				</div>

				<form
					action='<c:url value="/admin/savepost?${_csrf.parameterName}=${_csrf.token}"/>'
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}"> <input
						type="hidden" name="timepost" value="${post.getTime_post()}">
					<table class="usertable">
						<tr>
							<th>Tên bài viết</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>Content</th>
							<td><textarea rows="15" cols="50" name="content"></textarea></td>
						</tr>
						<tr>
							<th>Image</th>
							<td><input type="file" name="fileimg"></td>
						</tr>
						<tr>
							<th>Category</th>
							<td><select name="category"
								style="width: 100%; height: 35px;">
									<option value="1">Địa điểm</option>
									<option value="2">Ẩm thực</option>
									<option value="3">Văn hóa</option>
									<option value="4">Thiên nhiên</option>
							</select></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="submit" value="Save"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="col-sm-2"></div>
</div>



 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>


	<!-- Modal content-->
	<div class="modal-content">
		<form
			action='<c:url value="/admin/savepost?${_csrf.parameterName}=${_csrf.token}"></c:url>'
			enctype="multipart/form-data" method="post">
			<div style="height: 0px; overflow: hidden">
				<input type="file" id="fileInput" name="fileInput"
					multiple="multiple" />
			</div>
			<div style="height: 0px; overflow: hidden">
				<input type="file" id="fileThumbnail" name="fileThumbnail" />
			</div>
			<div class="modal-header">
				<h4 class="modal-title">Tạo bài viết mới</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for='inputTitle'>Tiêu đề</label> <input type="text"
						name='title' class="form-control" id="inputTitle"
						placeholder="nhập tiêu đề bài viết">
				</div>
				<div class="form-group">
					<label for='inputShortDecription'>Mô tả ngắn</label> <input
						type="text" name='shortDecription' class="form-control"
						id="inputShortDecription" placeholder="">
				</div>
				<div class="form-group">
					<label for="contentPost">Nội dung</label>
					<textarea name='content' class="form-control" id="contentPost"
						rows="6"></textarea>
				</div>
				<div class="form-group">
					<label for='inputAddress'>Địa chỉ</label> <input type="text"
						name='address' class="form-control" id="inputAddress"
						placeholder="nhập địa chỉ">
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputCity">Thành phố</label> <input type="text"
							name='city' class="form-control" id="inputCity">
					</div>
					<div class="form-group col-md-6">
						<label for="inputState">Tỉnh</label> <input type="text"
							name='state' class="form-control" id="inputState">
					</div>
				</div>
				<div class="form-row">
					<div class="btn-group form-group col-md-8">
						<button type="button" class="btn btn-primary"
							onclick="chooseFile('fileInput');">Ảnh bài viết</button>
						<button type="button" class="btn btn-primary"
							onclick="chooseFile('fileThumbnail');">Ảnh Thumbnail</button>
					</div>
					<div class="form-group col-md-4">
						<label for="inputState">Loại review</label> <select
							name='reviewType' id="inputState" class="form-control"
							required="required">
							<option selected>Choose...</option>
							<c:forEach var='item' items='${listCategory }'>
								<option>${item.getName()}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn btn-info">Đăng</button>
				<button type="button" id='closeNewPost' class="btn btn btn-danger"
					data-dismiss="modal">Close</button>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		function chooseFile(fileInput) {
			$("#" + fileInput).click();
		}
	</script>
</body>
</html>
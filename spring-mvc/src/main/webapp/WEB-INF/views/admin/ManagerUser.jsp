<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div align="center">
				<h2>Danh Sách Người Dùng</h2>
				<a href='<c:url value="/admin/adduser"/>'><button
						style="padding-top: 2px; padding-bottom: 2px; font-weight: bold;">
						<i class="fa fa-plus-circle" style="font-size: 20px; color: blue"></i>
						Thêm
					</button></a>
			</div>
			<table id="example" class="table table-striped table-bordered"
				style="width: 100%">
				<thead>

					<tr>

						<th>ID</th>
						<th>UserName</th>
						<th>Phonenumber</th>
						<th>Function</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${listUser}">
						<tr>
							<td>${item.getId()}</td>
							<td>${item.getUsername() }</td>
							<td>${item.getPhone()}</td>
							<td><c:url var="deleteComment" value="/admin/deleteUser">
									<c:param name="id" value="${item.getId()}" />
								</c:url> <a href="${deleteComment}"><button
										onclick="if (!confirm('Are you sure?')) { return false }">
										<i class='far fa-trash-alt'
											style='font-size: 18px; color: red'></i> Xóa
									</button></a> <c:url var="updateUser" value="/admin/editUser">
									<c:param name="id" value="${item.id}" />
								</c:url> <a href="${updateUser}"><button>
										<i class="fas fa-edit" style="font-size: 18px"></i>Sửa
									</button></a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
</div>

</body>
<script type="text/javascript"
	src='<c:url value="/template/DataTables/js/bootstrap.js"/>'>
	
</script>
<script type="text/javascript"
	src='<c:url value="/template/DataTables/js/jquery-3.3.1.min.js"/>'>
	
</script>
<script type="text/javascript"
	src='<c:url value="/template/DataTables/js/jquery.dataTables.js"/>'>
	
</script>
<script type="text/javascript"
	src='<c:url value="/template/DataTables/js/dataTables.bootstrap.js"/>'>
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</html>
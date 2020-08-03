function chooseFile(fileInput) {
	$("#"+fileInput).click();
}
function checkLogin(){
	username = $('input[name=username]').val();
	password = $('input[name=password]').val();
	if(username==''&&password==''){
		window.location.href = "/spring-mvc/trang-chu/login";
	}
}

var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {
	scrollFunction()
};
function scrollFunction() {
	if (document.body.scrollTop > 140
			|| document.documentElement.scrollTop > 140) {
		mybutton.style.display = "block";
	} else {
		mybutton.style.display = "none";
	}
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
	window.scrollTo({
		top : 0,
		behavior : 'smooth'
	});
}
function searchPost(contextPath) {
	$('#result').html('');
	$.ajax({
		type : 'GET',
		data : {
			serch : $('#search').val()
		},
		contentType : 'application/json; charset=utf-8',
		url : contextPath + '/ajax',
		success : function(result) {
			var products = $.parseJSON(result);
			var size = products.length;
			var s = "";
			for (var i = 0; i < products.length; i++) {
				$('#result').append(
						'<li class="list-group-item link-class">' + products[i]
								+ ' | <span class="text-muted">' + products[i]
								+ '</span></li>');
			}

		}
	});
}
function searchOnFocus(contextPath) {
	searchPost(contextPath);
}
function searchOutFocus() {
	$('#result').html('');
}
function chooseFile(fileInput) {
	$("#" + fileInput).click();
}
function checkLogin() {
	username = $('input[name=username]').val();
	password = $('input[name=password]').val();
	if (username == '' && password == '') {
		window.location.href = "/spring-mvc/trang-chu/login";
	}
}
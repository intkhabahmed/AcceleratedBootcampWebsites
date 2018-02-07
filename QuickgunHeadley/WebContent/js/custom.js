$(function(){
	$("nav a").click(function(){
		$('html, body').animate({
        scrollTop: $(this.hash).offset().top - 120
    }, 1500);
    return false;
	});
	
	$("nav a").click(function(){
		$("nav li").removeClass("active");
		$(this).parent().addClass("active");
	});
	

	$(".overlay").on('click', function(){
		$(this).fadeOut();
		$("#loginWindow").fadeOut();
		$("#uploadWindow").fadeOut();
	});

	$("#uploadForm, #uploadForm_shortcut").on('click', function(){
		$(".overlay").fadeIn();
		$("#uploadWindow").fadeIn();
		return false;
	});
	
	$(".carousel-control.left").mouseenter(function(){
		$("#left-indicator img").attr("src", "images/leftarrow_ro.png");
	});
	$(".carousel-control.right").mouseenter(function(){
		$("#right-indicator img").attr("src", "images/rightarrow_ro.png");
	});
	
	$(".carousel-control.left").mouseleave(function(){
		$("#left-indicator img").attr("src", "images/leftarrow.png");
	});
	$(".carousel-control.right").mouseleave(function(){
		$("#right-indicator img").attr("src", "images/rightarrow.png");
	});
	
	$("#proposalSubmit_btn").bind('click', function(){
		var input = document.getElementById("fileInput");
		if(input.files[0].size >= 10485760){
			alert("File size should be less than 10MB");
			return false;
		}else{
			$("#upload_form").attr("action", "uploadFile.html");
			return true;
		}
	});
	
	$("#login_button img").mouseenter(function(){
		$(this).attr("src", "images/loginbtn_over.png");
	});
	$("#login_button img").mouseleave(function(){
		$(this).attr("src", "images/loginbtn.png");
	});
	
	$("#shortcut_links img").mouseleave(function(){
		$(this).css("transform", "scale(1)");
		$(this).css("transition", "all .5s ease-out");
	});
	
	$("#shortcut_links img").mouseenter(function(){
		$(this).css("transform", "scale(1.1)");
		$(this).css("transition", "all .5s ease-in");
	});
	
	$("#forgotPass").click(function(){
		alert("Please Contact Support Team");
	});
	
});
function showLoginPage(){
	$(".overlay").fadeIn();
	$("#loginWindow").fadeIn();
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<Style>
footer{
	background-color: #292c2f;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	width: 100%;
	text-align: left;
	font: normal 16px sans-serif;
	padding: 45px 0px;
/* 	position: absolute; */
/* 	bottom: 0; */
/* 	left: 0; */
/* 	right: 0; */
}

footer .footer-limiter {
	max-width: 880px;
	margin: 0 auto;
}

footer .footer-left p{
	color:  #8f9296;
	font-size: 14px;
	margin: 0;
}


footer p.footer-links{
	font-size:18px;
	font-weight: bold;
	color:  #ffffff;
	margin: 0 0 10px;
	padding: 0;
}

footer p.footer-links a{
	display:inline-block;
	line-height: 1.8;
	text-decoration: none;
	color:  inherit;
}

footer .footer-right{
	float: right;
	margin-top: 6px;
	max-width: 180px;
}

footer .footer-right a{
	display: inline-block;
	width: 35px;
	height: 35px;
	background-color:  #33383b;
	border-radius: 2px;
	font-size: 20px;
	color: #ffffff;
	text-align: center;
	line-height: 35px;
	margin-left: 3px;
}

</Style>
</head>
<body>
	<footer>
		<div class="footer-limiter">
			<div class="footer-right">
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-linkedin"></i></a>
				<a href="#"><i class="fa fa-github"></i></a>
			</div>

			<div class="footer-left">
				<div ><img src="../images/로고1.png"></div>
			</div>
		</div>

	</footer>
</body>
</html>
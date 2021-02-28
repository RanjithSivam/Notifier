<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notifier 2.0</title>
<style>
*{
padding: 0;
margin: 0;
}
body{
	width:100%;
	height:100vh;
}

.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  position: absolute;
  top: 10px;
  right: 10px;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}


.container{
width:100%;
height:100%;
display:flex;
justify-content: center;
align-items: center;
flex-direction: column;
background-color: azure;
}

.title{
	margin-bottom: 15px;
}

.btns{
	margin: 0 10px;
}

.error-msg,.success-msg{
	opacity: 0.8;
	margin-bottom: 10px;
}

.error-msg{
	color: red;
}

.success-msg{
	color: #4CAF50;
}

#login-btn,#signup-btn{
	padding: 10px 15px;
	color:white;
	border: none;
	box-shadow: 0 2px 10px rgba(0,0,0,0.2);
	font-weight: bold;
	font-size:18px;
	cursor: pointer;
}

#login-btn:hover,#signup-btn:hover{
	box-shadow: 0 0 0 rgba(0,0,0,0);
}

#login-btn{
	background-color: #4CAF50;
}

#signup-btn{
	background-color: #f44336;
}

.modal{
	position: absolute;
	z-index: 10;
	width:100%;
	height:100%;
	background-color: rgba(0,0,0,0.3);
	display: none;
	justify-content: center;
	align-items: center;
}

.modal-container{
	width:350px;
	padding: 20px;
	background-color: white;
	border-radius: 10px
}

.modal .title-container{
	position: relative;
	margin-bottom: 20px;
}

.modal .title{
	text-align: center;
}

.modal input[type=text], .modal input[type=password],.modal input[type=email] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

.modal button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

.modal button:hover {
  opacity: 0.8;
}

.close {
  position: absolute;
  right:0;
  top: 0;
  color: #000;
  font-size: 20px;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

</style>
</head>
<body>
<%request.setAttribute("sess", request.getParameter("session")); %>
<c:if test = "${sess!=null}">
	<div class="alert">
  	<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  	<strong>Danger!</strong> Session Invalid!!!!
</div>
</c:if>
<div class="container">
	<h2 class="title">Notifier 2.0</h2>
	<c:set var = "fail" scope = "session" value = "${fail}"/>
      	<c:if test = "${fail!=null}">
         	<h5 class="error-msg">${fail}</h5>
      	</c:if>
     <c:set var = "success" scope = "session" value = "${success}"/>
      	<c:if test = "${success!=null}">
         	<h5 class="success-msg">${success}</h5>
      	</c:if>
	<div class="user-log-section">
		<button class="btns" id="login-btn" onclick="document.getElementById('login-modal').style.display='flex'">Login</button>
		<button class="btns" id="signup-btn" onclick="document.getElementById('signup-modal').style.display='flex'">Signup</button>
	</div>
	
	<div id="login-modal" class="modal">
		<div class="modal-container">
		<div class="title-container">
			<h2 class="title">Login Form</h2>
			<span class="close" onclick="document.getElementById('login-modal').style.display='none'">&times;</span>
		</div>
		<form action="${pageContext.request.contextPath}/LoginServlet" method = "post">
			<div class="input-tags">
				<label for="username">Username</label>
				<input type="text" name="username" placeholder="Enter username....">
			</div>
			<div class="input-tags">
				<label for="password">Password</label>
				<input type="password" name="password" placeholder="Enter password....">
			</div>
			<button type="submit">Login</button>
		</form>
		</div>
	</div>
	
	<div id="signup-modal" class="modal">
		<div class="modal-container">
		<div class="title-container">
			<h2 class="title">Signup Form</h2>
			<span class="close" onclick="document.getElementById('signup-modal').style.display='none'">&times;</span>
		</div>
		<form  method="post" action="${pageContext.request.contextPath}/SignupController">
			<div class="input-tags">
				<label for="email">Email</label>
				<input type="email" name="email" placeholder="Enter email....">
			</div>
			<div class="input-tags">
				<label for="fullname">Full Name</label>
				<input type="text" name="fullname" placeholder="Enter fullname....">
			</div>
			<div class="input-tags">
				<label for="username">Username</label>
				<input type="text" name="username" placeholder="Enter username....">
			</div>
			<div class="input-tags">
				<label for="password">Password</label>
				<input type="password" name="password" placeholder="Enter password....">
			</div>
			<button type="submit">Signup</button>
		</form>
		</div>
	</div>
</div>
</body>
</html>
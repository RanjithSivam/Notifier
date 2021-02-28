<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"
          prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"
          prefix="fun" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard 2.0</title>
<script src="https://kit.fontawesome.com/3c1cfd5bc3.js" crossorigin="anonymous"></script>
<style>
*{
	margin:0;
}
body{
	width: 100%;
	height: 100vh;
	overflow: hidden;
	background-color: lightsteelblue;
}
.navbar ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

.navbar .title{
	font-weight: bold;
}

.navbar li {
  float: left;
}

.navbar li a{
	cursor: pointer;
}

.navbar .action-btn{
	float: right;
}

.navbar li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

[badge]:after{
	background: red;
    border-radius: 30px;
    opacity:0.8;
    color: #fff;
    content: attr(badge);
    font-size: 11px;
    margin-top: -10px;
    min-width: 20px;
    padding: 2px;
    position: absolute;
    text-align: center;
}

.container{
	height: 80%;
	width: 80%;
	margin: 0 auto;
}

.search-box{
	margin-top:20px;
	border-radius:20px;
	box-shadow: 0 2px 10px rgba(0,0,0,0.2);
	padding: 5px;
	background-color: white;
}

.search-box form{
	display: flex;
}

.search-box input{
	flex:1;
	border: none;
	padding: 10px;
}

.search-box button{
	padding:5px;
	margin:5px;
	margin-right:10px;
	font-size: 16px;
	border: none;
	border-radius: 50%;
	background-color: grey;
	color: white;
	width: 30px;
	height: 30px;
	display: flex;
	justify-content: center;
	align-items: center
}

.notebook-list{
	height:90%;
	margin-top: 20px;
	overflow: scroll;
	scrollbar-width: none;
}

.notebook-list .list{
	display: flex;
	justify-content: space-between;
	padding: 10px 5px;
	border-radius: 10px;
}

.notebook-list .list:hover{
	background-color: #eee;
	cursor: pointer;
}

.notebook-list .list.active {
  background-color: #eee;
}

.notebook-list .panel{
	margin-top:10px;
  padding: 0 18px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}

.list-title small{
	opacity: 0.6;
}

.list-action-btn{
	display: flex;
	justify-content: center;
	align-items: center;
}

.list-action-btn a{
	margin: 0 10px;
	cursor: pointer;
	padding: 10px;
	display: flex;
	justify-content:center;
	align-items:center;
	width:15px;
	height:15px;
	border-radius: 20px;
}

.list-action-btn a:hover{
	background-color:rgba(0,0,0,0.2);
	color:white;
	box-shadow: 0 2px 10px rgba(0,0,0,0.2);
}


.panel-list{
	display: flex;
flex-direction: column;
justify-content: center;
padding: 5px 20px;
background-color: white;
margin: 5px;
border-radius: 10px;
}

.panel-action-btn{
	margin-top: 10px;
	display: flex;
	justify-content: space-between;	
}

.panel-action-btn a{
	margin: 0 10px;
	cursor: pointer;
}

.panel-list-date{
	font-size: 14px;
}

.panel-list-date small{
	margin: 0 5px;
}

.chip {
  padding: 5px 10px;
  line-height:20px;	
  border-radius: 25px;
  margin:0 5px;
  background-color: #f1f1f1;
}

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

.modal-content form{
	display: flex;
  flex-direction: row-reverse;
  justify-content: space-between;
  align-items: center;
}
.modal-content button{
	background-color: white;
	border: none;
	font-weight: 24px;
}

.modal-content input{
	border: none;
	flex: 1;
	font-size: 24px;
}

.close {
  color: #aaaaaa;
  font-size: 24px;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

#noteModal2,#noteModal{
	padding-top: 0;
}

#noteModal2 h2,#noteModal h2{
	text-align: center;
	margin-bottom: 10px;
}

#noteModal2 .close,#noteModal .close{
	float: right;
}

#noteModal2 .modal-content form,#noteModal .modal-content form{
	display: block;
}

#noteModal2 input[type=text],#noteModal input[type=text],#noteModal2 textarea, #noteModal textarea, 
#noteModal2 input[type=date] ,#noteModal input[type=date] {
  width: 100%; /* Full width */
  padding: 10px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

/* Style the submit button with a specific background color etc */
#noteModal2 input[type=submit],#noteModal input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* When moving the mouse over the submit button, add a darker green color */
#noteModal2 input[type=submit]:hover,#noteModal input[type=submit]:hover {
  background-color: #45a049;
}

#userModal{
	padding-top: 10px;
}

#userModal .modal-content form{
	flex-direction: column;
	align-items: flex-start;
}

#userModal .modal-content input{
	border: 1px solid rgba(0,0,0,0.4);
	width: 100%;
	margin:5px 0 10px 0;
}

#userModal h2{
	text-align: center;
}

#userModal .close{
	float: right;
}

#userModal button{
	width: 100%;
	padding: 15px;
	background-color: grey;
	color: white;
	margin: 5px 0;
	cursor: pointer;
}

#userModal button[type=submit]{
	background-color: green;
}

/* DROPDOWN BUTTON */
.dropbtn {
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  right:20px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}

</style>

</head>
<body>
	<div class="navbar">
		<ul>
  			<li><a href="" class="title">Notifier 2.0</a></li>
  			<li class="action-btn"><a href="${pageContext.request.contextPath}/DashboardServlet?action=logout">
  				<i class="fas fa-power-off"></i>
  			</a></li>
  			<li class="action-btn" onclick="myFunction()">
  			<a badge="${badge.size()}" class="dropbtn">
  				<i class="far fa-bell"></i>
  			</a>
  				<div id="myDropdown" class="dropdown-content">
  					<c:forEach items="${badge}" var="bad">
  						<a ><b>${bad.getTitle()}</b>
  							<small>DUE: TODAY</small>
  						</a>
  					</c:forEach>
  				</div>
  			</li>
  			<li class="action-btn"><a onclick="userFormAppear()">
  				<i class="far fa-user"></i>
  			</a></li>
		</ul>
	</div>
	
	<div class="container">
		<div class="search-box">
			<form action="${pageContext.request.contextPath}/DashboardServlet?action=add" method="post">
				<input type="text" name="title" placeholder="Enter notebook...">
				<button type="submit"><i class="fas fa-plus"></i></button>
				<button ><i class="fas fa-search"></i></button>
			</form>
		</div>
		<div class="notebook-list">
				<c:forEach var="lists" items="${list}">
					<div class="list">
						<div class="list-title">
							<h4><c:out value = "${lists.getTitle()}"/></h4>
							<small id="note-count"></small>
						</div>
						<div class="list-action-btn">
							<a onclick="noteFormAppear(${lists.getId()},false)"><i class="fas fa-plus"></i></a>
							<a onclick="formAppear(${lists.getId()})"><i class="far fa-edit"></i></a>
							<a href="${pageContext.request.contextPath}/DashboardServlet?action=delete&id=${lists.getId()}"><i class="far fa-trash-alt"></i></a>
						</div>
					</div>
					<div class="panel">
						<c:forEach var="note" items="${notes}">
						<c:if test="${note.getNotebook_id() == lists.getId()}">
							<div class="panel-list">
  								<div class="panel-title">
  									<h5>${note.getTitle()}
  										<c:forEach var="tag" items="${fun:split(note.getTags(),',')}">
  											<small class="chip">
  												${tag}
											</small>
  										</c:forEach>
  									</h5>
  									<small id="note-description-${note.getId()}">${note.getDescription()}</small>
  								</div>
  								<div class="panel-action-btn">
									<div class="btns">
										<a onclick="noteFormAppear2(${note.getId()},'${note.getTags()}','${note.getTitle()}','${note.getStart_date()}','${note.getEnd_date()}')"><i class="far fa-edit"></i></a>
										<a href="${pageContext.request.contextPath}/DashboardServlet?action=note&function=delete&id=${note.getId()}"><i class="far fa-trash-alt"></i></a>
									</div>
									<div class="panel-list-date">
										<small><b>Start:</b> ${note.getStart_date()}</small>
										<small><b>End:</b> ${note.getEnd_date()}</small>	
									</div>
								</div>
  							</div>
  						</c:if>
						</c:forEach>
  						
					</div>
					
				</c:forEach>
		</div>
	</div>
	<div id="myModal" class="modal">
	  <div class="modal-content">
    	<form action="${pageContext.request.contextPath}/DashboardServlet?action=edit" method="post">
    		<div class="modal-btns">
    			<span class="close">&times;</span>
    			<button class="close"><i class="fas fa-check"></i></button>
    		</div>
    		<input type="text" name="title" placeholder="Enter new notebook name...">
    		<input type="text" name="id" style="display:none;" id="edit-id">
    	</form>
    	</div>
	</div>
	
	<div id="noteModal" class="modal">
	  <div class="modal-content">
    	<span class="close" onclick="document.getElementById('noteModal').style.display = 'none'">&times;</span>
    	<h2>Add New note</h2>
    	<form action="${pageContext.request.contextPath }/DashboardServlet?action=note&function=add" method="post">

    		<label for="title">Title</label>
    		<input type="text" id="fname" name="title" placeholder="Enter title..">
    		<label for="tags">Tags</label><small>enter tag name seperated by ','</small>
    		<input type="text" id="lname" name="tags" placeholder="Enter tags..">

			<label for="start_date">Start date:</label>
  			<input type="date" id="birthday" name="start_date">
  			
  			<label for="end_date">End date:</label>
  			<input type="date" id="birthday" name="end_date">
  			
  			<input type="text" name="id" style="display:none;" id="notebook-id">

    		<label for="description">Description</label>
    		<textarea id="subject" name="description" placeholder="Write something.." style="height:200px"></textarea>

    		<input type="submit" value="Submit">

  		</form>
    	</div>
	</div>
	
	<div id="noteModal2" class="modal">
	  <div class="modal-content">
    	<span class="close" onclick="document.getElementById('noteModal2').style.display = 'none'">&times;</span>
    	<h2>Edit note</h2>
    	<form action="${pageContext.request.contextPath }/DashboardServlet?action=note&function=edit" method="post">

    		<label for="title">Title</label>
    		<input type="text" id="edit-title" name="title" placeholder="Enter title..">
    		<label for="tags">Tags</label><small>enter tag name seperated by ','</small>
    		<input type="text" id="edit-tags" name="tags" placeholder="Enter tags..">

			<label for="start_date">Start date:</label>
  			<input type="date" id="edit-start" name="start_date">
  			
  			<label for="end_date">End date:</label>
  			<input type="date" id="edit-end" name="end_date">
  			
  			<input type="text" name="id" style="display:none;" id="note-edit-id">

    		<label for="description">Description</label>
    		<textarea id="edit-description" name="description" placeholder="Write something.." style="height:200px"></textarea>

    		<input type="submit" value="Update">

  		</form>
    	</div>
	</div>
	
	<div id="userModal" class="modal">
	  <div class="modal-content">
    	<span class="close" onclick="document.getElementById('userModal').style.display = 'none'">&times;</span>
    	<h2>Update User</h2>
    	<form action="${pageContext.request.contextPath }/LoginServlet?action=edit" method="post">

    		<label for="username">username</label>
    		<input type="text" name="username" value="${user.getUsername()}" disabled="disabled">
    		
    		<label for="fullname">fullname</label>
    		<input type="text" name="name" value="${user.getName() }">

			<label for="email">email</label>
  			<input type="text" name="email" value="${user.getEmail() }">
  			
  			<label for="phone">phone</label>
  			<input type="tel" name="phone" value="${user.getPhone() }">
  			
  			<input type="text" name="id" style="display:none;" id="user-id" value="${user.getId() }">
    		<label for="password">password</label>
    		<input type="text" name="password" value="${user.getPassword() }">

    		<button type="submit">Update</button>
    		<button>Okay</button>

  		</form>
    	</div>
	</div>
	
	
	
<script>
//NOTEBOOK MODAL
var modal = document.getElementById("myModal");
var span = document.getElementsByClassName("close")[0];
var edit = document.getElementById("edit-id");
function formAppear(id) {
  modal.style.display = "block";
  edit.value = id;
}
span.onclick = function() {
  modal.style.display = "none";
}
window.onclick = function(event) {
  if (event.target == modal) {
	  console.log("da");
    modal.style.display = "none";
  }
}

// NOTE MODAL
var modal2 = document.getElementById("noteModal");
var notebookId = document.getElementById("notebook-id");
function noteFormAppear(id) {
	modal2.style.display = "block";
	notebookId.value = id;
}

window.onclick = function(event) {
	if (event.target == modal2) {
		modal2.style.display = "none";
	}
}

// NOTE EDIT MODAL
var modal3 = document.getElementById("noteModal2");
function noteFormAppear2(id,tags,title,start,end) {
	modal3.style.display = "block";
	console.log("note-description-"+id);
	document.getElementById("edit-title").value = title;
	document.getElementById("edit-description").value = document.getElementById("note-description-"+id).innerText;
	document.getElementById("edit-tags").value = tags;
	document.getElementById("edit-start").value = start;
	document.getElementById("edit-end").value = end;
	document.getElementById("note-edit-id").value = id;
}

window.onclick = function(event) {
	if (event.target == modal2) {
		modal3.style.display = "none";
	}
}
//USER MODAL

var modal3 = document.getElementById("userModal");
function userFormAppear() {
	modal3.style.display = "block";
}

window.onclick = function(event) {
	if (event.target == modal3) {
		modal3.style.display = "none";
	}
}
//ACCORDIAN
var acc = document.getElementsByClassName("list");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
	  this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    }   
	});
} 

//Notes count
window.onload = function(){
	var list = document.getElementsByClassName("list");
	var i;
	for(i=0;i<list.length;i++){
		var x = list[i].nextSibling.nextSibling.children.length;
		list[i].getElementsByTagName("small")[0].innerText = x+" notes";
	}
}

//DROPDOWN BUTTOn
function myFunction() {
	console.log("sdasd");
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
} 
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jobs Posted</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
	integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy"
	crossorigin="anonymous">

<link
	href="https://fonts.googleapis.com/css?family=Bungee|Abril+Fatface"
	rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

	<!-- Custom CSS -->

<link rel="stylesheet"href="css/home.css" type="text/css" />
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homecss.css" >	
 --%><link  rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css" />
<link  rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css" />

<style>
/* .username{
	padding-left:5%;
	padding-right:10%;
} */

.menu_main_content{
	margin-left:5%;
}
</style>

</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<div class="container-fluid">
        <header class="header">
            <div class="row">
                <div class="menu_main col-xs-4" style="background-color:black;">
                    <h4 class="menu_main_logo"><i class="fa fa-university" aria-hidden="true"><br/><p class="username">Hello , ${name.fname}</p></i></h4>

                </div>
                <div class="menu_main_content col-xs-8">
                    <div class = "dropdown">
                        <div class="col-xs-3 droplink" style="background-color:black;" ><a href="#" style="color: lightgrey; text-decoration:none" id="dropdownMenu1" data-toggle="dropdown">Accounts <span class="caret"></span></a>
                            <div class="dropdown-content">
                                <!-- <a href="#">Edit Profile </a> -->
                                <a href="${contextPath}/logout.htm">Logout</a>
                            </div></div></div>
                    <div class="col-xs-3" style="background-color:black;"><a href="${contextPath}/employeer/postjob.htm?name=${name}" style="color: lightgrey; text-decoration:none">Post a Job</a></div>
                    <div style="background-color:black;"><a href="${contextPath}/employer/myjobposts.htm" style="color: lightgrey; text-decoration:none">View my Job Posts</a></div>
                </div>
            </div>
        </header>	
        <%--  <input type="hidden" value= "${name.fname}" name = "userText"></input>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
		  <strong>${successMessage}</strong>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close"> X </button>
		</div> --%>
		<div>
			<center><h2>Active Jobs</h2></center>
			<form action = "${contextPath}/employer/deleteMyJobposts.htm" method="get">
			<table class = "table">
				<c:forEach var="j" items="${jobPost}">
				
          		<input type="hidden" name = "jobID" value = "${j.id}" />
					<tr>
						<td><b>Job ID</b></td>
						<td>${j.jobID}</td>
					</tr>
					<tr>
						<td><b>Title</b></td>
						<td>${j.jobTitle}</td>
					</tr>
					<tr>
						<td><b>Company Name</b></td>
						<td>${j.companyName}</td>
					</tr>
					<tr>
						<td><b>Job Type</b></td>
						<td>${j.jobType}</td>
					</tr>
					<tr>
						<td><b>Location</b></td>
						<td>${j.state}, ${j.country}</td>
					</tr>
					<tr>
						<td><b>Industry</b></td>
						<td>${j.industry}</td>
					</tr>
					<tr>
						<td><b>Job For</b></td>
						<td>${j.major}</td>
					</tr>
					<%-- <tr>
						<td><b>Job-URL</b></td>
						<c:if test= "${empty j.jobUrl}"> 
						<td>No link available. Please check the company's website</td></c:if>
						<c:if test= "${not empty j.jobUrl}"> 
						<td>${j.jobUrl}</td></c:if>
					</tr> --%>
					<tr>
						<td><b>Description</b></td>
						<c:if test= "${empty j.description}"> 
						<td>No description provided</td></c:if>
						<c:if test= "${not empty j.description}"> 
						<td>${j.description}</td></c:if>
					</tr>
						<td><b>Posted On</b></td>
						<td>${j.postedOn}</td>
					</tr>
					<tr><td><a href="${contextPath}/employer/updateJobDetails.htm?jobID=${j.id}&name=${name.fname}" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Update Post</a></td><td><a href="${contextPath}/employer/viewCandidatesApplied?jobID=${j.id}&name=${name.fname}" class="btn btn-dark btn-lg active" role="button" aria-pressed="true">View candidates</a></td><td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Delete Post</button>
					</td>
					<br><br>
				</c:forEach>
			
			
			<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:red"><i class="fas fa-exclamation-triangle"></i> Warning: Delete Post?</h4>
        </div>
        <div class="modal-body">
          <p>Are you sure you want to delete this job post? This action cannot be undone.</p>
        </div>
        <div class="modal-footer">
          
          <button type="submit" class="btn btn-danger btn-lg">Yes</button>
        
          <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">No</button>
                  </div>
    
           </table></form>
</div>
  </div>
        <div><br><br></div>
       
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>       
</body>
</html>
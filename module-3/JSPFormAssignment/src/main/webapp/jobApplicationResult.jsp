<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
    File: jobApplicationResult.jsp
    Purpose: Display submitted job application data
    Author: Paul Fralix
    Assignment: Module 3 01/24/2026
 --%>  
 
 <%
    //Retrieve form data
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String employmentType = request.getParameter("employmentType");
    String experience = request.getParameter("experience");
    String skills = request.getParameter("skills");
 %>  
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Application Summary</title>
</head>
<body>

<h2>Job Application Summary</h2>
<p>
    The table below displays the information submitted through the job application form.
</p>

<table border="1" cellpadding="8">
    <tr>
        
        <th>Field</th>
        <th>Descrpttion</th>
        <th>Entered Value</th>
        
    </tr>
    
    <tr>
        
        <td>Full Name</td>
        <td>Applicant's legal name</td>
        <td><%= fullName %></td>
        
    </tr>
    
    <tr>
    
        <td>Email</td>
        <td>Primary contact email address</td>
        <td><%= email %></td>
    </tr>
    
    <tr>
    
        <td>Employment Type</td>
        <td>Preferred job status</td>
        <td><%= employmentType %></td>
        
    </tr>
    
    <tr>
    
        <td>Experience</td>
        <td>Total years of relevant work experience</td>
        <td><%= experience %></td>
        
    </tr>
    
    <tr>
    
        <td>Skills</td>
        <td>Summary of applicant skills</td>
        <td><%= skills %></td>
        
    </tr>
    
    
</table>

</body>
</html>
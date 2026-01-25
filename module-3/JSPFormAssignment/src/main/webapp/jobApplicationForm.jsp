<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- File: jobApplicationForm.jsp
     Purpose: Display submitted job application form
     Author: Paul Fralix 
     Assignment: Module 3 01/24/2026
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Application Form</title>
</head>
<body>

<h2>Job Application Form</h2>
<p>Please complete the form below to apply for the position.</p>

<form action="jobApplicationResult.jsp" method="post">

    <!--  Text input -->
    <label>Full Name:</label>
    <input type="text" name="fullName" required><br><br>
    
    <!-- Email input -->
    <label>Email Address:</label>
    <input type="email" name="email" required><br><br>
    
    <!-- Radio buttons -->
    <label>Employment Type:</label><br>
    <input type="radio" name="employmentType" value="Full-Time" required> Full-Time<br>
    <input type="radio" name="employmentType" value="Part-Time" required> Part-Time<br><br>
    
    
    <!-- Dropdown -->
    <label>Years of Experience:</label><br>
    <select name="experience">
        <option value="0-1">0-1 Years</option>
        <option value="2-4">2-4 Years</option>
        <option value="5+">5+ Year</option>
    </select><br><br>
    
    <!-- Textarea -->
    <label>Skills Summary:</label><br>
    <textarea name="skills" rows="4" cols="40"></textarea><br><br>
    
    <input type="submit" value="Submit Application">


</form>


</body>
</html>
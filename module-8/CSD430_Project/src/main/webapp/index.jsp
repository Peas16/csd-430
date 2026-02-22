<!-- Paul Fralix CSD430 Project -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CSD430 Project Index</title>
</head>
<body>

    <h1>CSD430 Project Modules</h1>
    <p>
        This index page provides access to all module deliverables for the
        CSD430 course project. 
    </p>

    <ul>
        <!-- Module 1 -->
        <li>
            <strong>Module 5_6 – Database Creation</strong><br>
            Created MySQL database <em>CSD430</em> and table
            <em>paul_movies_data</em>.
        </li>

        <!-- Module 5_6 / Current Assignment -->
        <li>
            <strong>Module 5_6 – View Database Data (JavaBean)</strong><br>
            <a href="movies.jsp">View Movie Records</a>
        </li>
		<li>
			<strong>Module 7 - Add New Record (Create)</strong><br>
			<a href="createMovie.jsp">Add New Movie</a>
		</li>
		<li>
			<strong>Module 8 - Update Existing Record (Update)</strong><br>
			<a href="updateSelect.jsp">Update Records</a>
		</li>
				
        <!-- Future CRUD Modules -->
        <!--
        
        
        <li><a href="delete.jsp">Module 9 – Delete Records</a></li>
        -->
    </ul>

</body>
</html>

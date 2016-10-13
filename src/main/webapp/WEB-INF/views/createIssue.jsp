<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="resources/jquery-3.0.0.min.js"></script>
<script src="resources/angular.min.js"></script>
<script src="resources/main.js"></script>
</head>
<body>
	<div ng-app="myApp" ng-controller="formCtrl">
		<form name="createIssue">
			Subject:<br> <input type="text" ng-model="user.subject"><br>
			
			title:<br> <input type="text" ng-model="user.title"><br>
			
			Discription:
			<textarea ng-model="user.description"></textarea>
			
			<input type="radio" ng-model="user.priority" value="low" />Low <br /> 
			<input type="radio" ng-model="user.priority" value="medium" />Medium <br />
			<input type="radio" ng-model="user.priority" value="high" />High <br />
			
			<!-- <input type="file" ng-model="user.attachment" file-model="myFile" id="attachment"><br /> -->
			
			<button ng-Click="submitForm()">Submit</button>
		</form>
	</div>
</body>
</html>
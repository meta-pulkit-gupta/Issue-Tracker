<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>File Upload Example in AngularJS</title>
  <script src="resources/jquery-3.0.0.min.js"></script>
<script src="resources/angular.min.js"></script>
<script src="resources/main.js"></script>
</head>

<body ng-app="fupApp">

    <div ng-controller="fupController">
        <input type="file" id="file" name="file" multiple
            onchange="angular.element(this).scope().getFileDetails(this)" />

        <input type="button" ng-click="uploadFiles()" value="Upload" />

        <!--ADD A PROGRESS BAR ELEMENT.-->
        <p><progress id="pro" value="0"></progress></p>
    </div>

</body>
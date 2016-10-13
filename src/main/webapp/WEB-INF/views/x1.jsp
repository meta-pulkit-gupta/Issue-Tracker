<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="resources/jquery-3.0.0.min.js"></script>
<script src="resources/angular.min.js"></script>
<script src="resources/main.js"></script>
</head>

<body>

	<form name="userForm" ng-submit="submitUser(userForm.$valid)"
		novalidate>
		<input type="hidden" ng-model="user.id" name="id">
		<div class="row">
			<div class="col-lg-6">
				<div class="row"
					ng-class="{ 'has-error' : userForm.name.$invalid && !userForm.name.$pristine }">
					<div class="col-lg-12">
						<input class="form-control" placeholder="Username" type="text"
							ng-model="user.username" ng-minlength="3" name="username"
							required />
						<p
							ng-show="userForm.username.$invalid && !userForm.username.$pristine"
							class="help-block">required.</p>
						<p ng-show="userForm.username.$error.minlength" class="help-block">Too
							short.</p>
						<p ng-show="userForm.username.$error.maxlength" class="help-block">Too
							long.</p>
						<br /> <input class="form-control" placeholder="Enter Password"
							type="password" ng-model="user.password" ng-minlength="5"
							name="password" required />
						<p
							ng-show="userForm.password.$invalid && !userForm.password.$pristine"
							class="help-block">Password is required.</p>
						<br />

						<p ng-show="userForm.password.$error.minlength" class="help-block">Too
							short.</p>
						<p ng-show="userForm.password.$error.maxlength" class="help-block">Too
							long.</p>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<input type="text" name="role" ng-model="user.role"
							class="form-control" disabled /><br />
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<input class="form-control" placeholder="FirstName" type="text"
							ng-model="user.member.firstName" /><br /> <input
							class="form-control" placeholder="Enter Last name" type="text"
							ng-model="user.member.lastName" /><br />
					</div>
				</div>

			</div>
			<div class="col-lg-6">

				<div class="row">
					<div class="col-lg-12">
						<input class="form-control" placeholder="Email" type="text"
							ng-model="user.member.email" /><br /> <input
							class="form-control" placeholder="Zip Code" type="text"
							ng-model="user.member.zipCode" /><br /> <input
							class="form-control" placeholder="Enter Phone Number" type="text"
							ng-model="user.member.phoneNumber"
							ng-pattern="/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/" /><br />
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<input class="form-control" placeholder="Address line 1"
							type="text" ng-model="user.member.addressLine1" /><br /> <input
							class="form-control" placeholder="Address Line 2" type="text"
							ng-model="user.member.addressLine2" /><br />
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<input type="file" file-model="myFile" />
					</div>
				</div>


			</div>


		</div>
		<div class="row">
			<div class="col-lg-12">

				<button type="btn btn-primary submit" class="btn btn-lg btn-primary"
					ng-hide="userForm.$invalid">Save</button>
	</form>

</body>
</html>
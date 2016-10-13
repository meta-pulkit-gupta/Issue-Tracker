// verify the token of the google user who signin.
function onSignIn(googleUser) {
	var id_token = googleUser.getAuthResponse().id_token;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', 'https://www.googleapis.com/oauth2/v3/tokeninfo?id_token='
			+ id_token);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onload = function() {

		var xhr1 = new XMLHttpRequest();
		xhr1.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				console.log(this.responseText);
				document.getElementById("demo").innerHTML = this.responseText;
			}
		};
		xhr1.open('POST', 'signin');
		xhr1.setRequestHeader('Content-Type', 'application/json');
		xhr1.send(xhr.responseText);
	};
	xhr.send();
}

function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		console.log('User signed out.');
	});

}

var app = angular.module('myApp', []);

myApp.controller('formCtrl', function($scope, $http) {

	$scope.user = {
		subject : "yo",
		title : "321fsa",
		description : "321fsafa",
		priority : "low",
	};

	$scope.submitForm = function() {
		$http.post('createIssue',
				JSON.stringify(data)).success(function() {
					console.log("yo");
		});
	};

});

/*
 * var app = angular.module('myApp', []);
 * 
 * myApp.directive('fileModel', ['$parse', function ($parse) { return {
 * restrict: 'A', link: function(scope, element, attrs) { var model =
 * $parse(attrs.fileModel); var modelSetter = model.assign;
 * 
 * element.bind('change', function(){ scope.$apply(function(){
 * modelSetter(scope, element[0].files[0]); }); }); } }; }]);
 * 
 * myApp.service('fileUpload', ['$http', function ($http) { this.uploadFileToUrl =
 * function(file, uploadUrl){ var fd = new FormData(); fd.append('file', file);
 * $http.post(uploadUrl, fd, { transformRequest: angular.identity, headers:
 * {'Content-Type': undefined} }) .success(function(){ }) .error(function(){ }); }
 * }]);
 * 
 * myApp.controller('formCtrl', ['$scope', 'fileUpload', function($scope,
 * fileUpload){
 * 
 * $scope.user = { subject : "yo", title : "321fsa", description : "321fsafa",
 * priority : "low", attachment : $scope.myFile };
 * 
 * $scope.uploadFile = function(){ var file = $scope.myFile; console.log('file
 * is ' ); console.dir(file); var uploadUrl = "/fileUpload";
 * fileUpload.uploadFileToUrl(file, uploadUrl); };
 * 
 * }]);
 */

/*
 * app.controller('formCtrl', function($scope, $http) {
 * 
 * $scope.user = { subject : "yo", title : "321fsa", description : "321fsafa",
 * priority : "low", attachment : "" };
 * 
 * $scope.submitForm = function() { console.log("posting data....");
 * console.log($scope.user);
 * 
 * 
 * $http.post('http://posttestserver.com/post.php?dir=jsfiddle',
 * JSON.stringify(data)).success(function() {success callback });
 *  };
 * 
 * });
 */

/*
 * var myApp = angular.module('myApp', []);
 * 
 * myApp.controller('formCtrl', function($scope) { // GET THE FILE INFORMATION.
 * $scope.getFileDetails = function(e) {
 * 
 * $scope.files = []; $scope.$apply(function() { // STORE THE FILE OBJECT IN AN
 * ARRAY. for (var i = 0; i < e.files.length; i++) {
 * $scope.files.push(e.files[i]) }
 * 
 * }); }; // NOW UPLOAD THE FILES. $scope.uploadFiles = function() {
 * 
 * //FILL FormData WITH FILE DETAILS. var data = new FormData();
 * 
 * for ( var i in $scope.files) { data.append("uploadedFile", $scope.files[i]); } //
 * ADD LISTENERS. var objXhr = new XMLHttpRequest();
 * objXhr.addEventListener("progress", updateProgress, false);
 * objXhr.addEventListener("load", transferComplete, false); // SEND FILE
 * DETAILS TO THE API. objXhr.open("POST", "/api/fileupload/");
 * objXhr.send(data); } // UPDATE PROGRESS BAR. function updateProgress(e) { if
 * (e.lengthComputable) { document.getElementById('pro').setAttribute('value',
 * e.loaded); document.getElementById('pro').setAttribute('max', e.total); } } //
 * CONFIRMATION. function transferComplete(e) { alert("Files uploaded
 * successfully."); } });
 * 
 * $scope.submitUser = function(isValid) {
 * 
 * var file = $scope.myFile; console.log('file is ' ); console.dir(file); var
 * uploadUrl = "user/saveUserDataAndFile"; var fd = new FormData();
 * fd.append('file', file); fd.append('user',angular.toJson($scope.user,true));
 * console.log('Socpe of user'+$scope.user); $http.post(uploadUrl, fd, {
 * transformRequest : angular.identity, headers : { 'Content-Type' : undefined }
 * }).success(function() { console.log('success'); }).error(function() {
 * console.log('error'); }); }
 */
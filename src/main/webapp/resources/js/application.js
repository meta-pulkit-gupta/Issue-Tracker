$(document).ready(function () {
        $('ul.nav > li').click(function (e) {
            e.preventDefault();
            $('ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });

 });

 var app = angular.module("myApp", ["ngRoute"]);
 app.controller('MainController', function($scope) {
      $scope.myVar={};
      console.log($scope.myVar);
 });
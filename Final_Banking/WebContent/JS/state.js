
alert("As");
var app= angular.module('cityApp', []);

app.controller('statecityController', function($scope, $http){
	$scope.getState = function(){
		
		$http.get("../State").then(
		function(response)	{

			$scope.state = response.data;
			
		});
	}
	$scope.getCity = function(){
		$http.get("../City?state="+document.getElementById("state").value).then(
		function(response)	{
			$scope.city = response.data;

		});
	}
});


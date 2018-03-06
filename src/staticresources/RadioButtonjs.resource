   var radioApp = angular.module('radioApp',[]);
   
    radioApp.controller('selectRadioButtonController',function($scope){
        $scope.names = ["Male","Female","Other"];
        $scope.selectedName = "Male";
        $scope.getSelectedValue = function(value){
           $scope.selectedName = value;
        }
        
        $scope.employeeRadioOptions = {name:'Gender', values:["Male","Female","Other"]}
        $scope.customerRadioOptions = {name:'Gender', values:["Male","Female","Other"]}
    });
   
    radioApp.directive('enziRadioButton',function(){
           return{    
               scope:{
               		options : '='
               },
               template: 
               'Dir options : {{options}} <div ng-repeat="optionValue in newOptions.values">'+
      				'<input type="radio" name="{{options.name}}" ng-value="{{optionValue}}" ng-click="getSelectedValue(optionValue)"/> {{optionValue}}<br>'+
    		   '</div><br/>',
               controller: function($scope){
                   console.log($scope.options);
                  
                    $scope.newOptions = angular.copy($scope.options);
               		$scope.getSelectedValue = function(optionValue){
                    	$scope.selectedValue = optionValue;
                        //change//$scope.options.values.push('Added By Dir');
                    }
               }
           }
       });
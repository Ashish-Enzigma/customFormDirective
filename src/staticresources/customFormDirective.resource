 var selectOptionApp = angular.module('selectOptionApp',[]);
    
    	selectOptionApp.controller('selectOptionController',function($scope){
            $scope.names = ["Jitesh","Ashish","Dhaval","Shanti","Aman"];
            
            $scope.getSelectedValue = function(value){
                $scope.selectedName = value;
            } 
            $scope.employeeSelectValue =["Jitesh","Ashish","Dhaval","Shanti","Aman"]
            $scope.candidateSelectValue =["Jitesh","Ashish","Dhaval","Shanti","Aman"]
        });
    
    	selectOptionApp.directive('enziSelectList',function(){
            return{
                scope:{
                    options: '='
                },
                template: "selectedName: {{selectedName}}<br/>"+
                "<select ng-model='selectedName' ng-value='{{name}}' ng-click='getSelectedValue(selectedName)' ng-options='name for name in options'>"+"</select>"
            }
           
        });

var myApp = angular.module("myApp", []);
    
    	myApp.controller("mycnt",function($scope){
        	$scope.firstName = {
        						Label: 'First Name',
        						PlaceHolder: 'Enter the First Name',
                				type:'text'               				
   							 };
            $scope.lastName = {
        						Label: 'Last Name',
        						PlaceHolder: 'Enter the Last Name',
                				type:'text'
   							 };
             $scope.email = {
        						Label: 'Email ',
        						PlaceHolder: 'Enter the email id',
                				type:'email'
   							 };
            
       		$scope.submitButton ={
        						Label: 'Submit',                	
                				type:'button'
   							 };
        	$scope.cancelButton ={
        						value: 'Cancel',                	
                				type:'button'
   							 };
            $scope.form = {
        						name: 'myform'        						             				
   						 };
            
        });
    
    
    	myApp.directive("enziForm",function(){
        	return{
            	restrict : "E",               
                template : '<form> hello</form>'               
            }
        }); 
    
    
        myApp.directive("enziInputText", function() {
            return {
                restrict : "E",  
                controller:'mycnt',
                require: "^enziForm",
                link: function(scope, element, attr){
          				
                    if(attr.type=='firstname')
                        {                    
                            element.append('<div class="slds-form-element"><label class="slds-form-element__label" for="input-id-01">'+scope.firstName.Label+'</label> <div class="slds-form-element__control"><input type="'+scope.firstName.type+'" ng-model="fname" id="input-id-01" class="slds-input" name="fname1" placeholder="'+scope.firstName.PlaceHolder+'"  /></div></div>');
                          
    					}
                    
                    if(attr.type=='lastname')
                        {                   
                            element.append('<div class="slds-form-element"><label class="slds-form-element__label" for="input-id-02">'+scope.lastName.Label+'</label> <div class="slds-form-element__control"><input type="'+scope.lastName.type+'"  id="input-id-02" class="slds-input"  placeholder="'+scope.lastName.PlaceHolder+'"  /></div></div>');
    					}
                    
                     if(attr.type=='email')
                        {                   
                            element.append('<div class="slds-form-element"><label class="slds-form-element__label" for="input-id-03">'+scope.email.Label+'</label> <div class="slds-form-element__control"><input type="'+scope.email.type+'"  id="input-id-03" class="slds-input"  placeholder="'+scope.email.PlaceHolder+'"  /></div></div>');
    					}
                    
                    if(attr.type=='submitButton')
                        {
                            	element.append('<button class="slds-button slds-button_neutral slds-grow">'+scope.submitButton.Label+'</button>');
                        }
                    if(attr.type=='cancelButton')
                        {
                   			  element.append('<input  type="'+scope.cancelButton.type+'"  value="'+scope.cancelButton.value+'" class="slds-button slds-button_neutral" />');
    					}
                }
            };
        });

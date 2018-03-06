@isTest
private class MyTestClass {
    @isTest static void myTest() {
    
                
        Object obj1=[SELECT Id,Name,(Select ID,Name From Contacts) from Account where Website='ravi.com'];
        
        system.debug(obj1);
        
    }
}
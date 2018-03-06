public class VfApexActionFunctionController {
    public String strCheck{get;set;}
    //VfApexFunctionController(){}
    
    public void getRecord(){
        system.debug('Hi');
        strCheck='string variable is called';
        System.debug('Action Function Is Called');
    }
}
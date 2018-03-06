public class AccountPageController {
    
    //Added from dev console
    //Added from Eclipse
    //AccountPageController
	public string strCompanyName{get;set;}    
    public string strFirstName{get;set;}
    public string strLastName{get;set;}
    /*Account objAccount{
        get; 
        set
        {
            objAccount.Name=strCompanyName;
        }
    } 
    Contact objContact{
        get; 
        set
        {
            objContact.FirstName=strFirstName;
            objContact.LastName=strLastName;
        }
    }
    */
    Account objAccount{get;set;}
    Contact objContact{get;set;}
    public AccountPageController(){
       objAccount=new Account();
       objContact=new Contact();
        
    }
    public PageReference save(){ 
        system.debug(objAccount);
        objAccount.Name=strCompanyName;
      	if(objAccount != Null)
        {
            system.debug('1st if condition');
            upsert objAccount;
            system.debug('Inserted');
            if(objContact != Null)
            {
                objContact.FirstName=strFirstName;
            	objContact.LastName=strLastName;
                system.debug('2nd if condition');
                upsert objContact;
            }
        }
        
        
        return null;
    } 
    
    
   
    
            

    
}
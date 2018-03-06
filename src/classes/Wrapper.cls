public class Wrapper {
	public list<WrapChild> wrapContactList{get;set;}     

    public Wrapper(){
        wrapContactList =new list<WrapChild>();
        list<Account> lstAccount1=[SELECT Id,Name,(SELECT FirstName,LastName,phone FROM Contacts),(SELECT Name,CloseDate,StageName from Opportunities) FROM Account WHERE id IN (SELECT Accountid FROM contact) AND id IN (SELECT Accountid FROM Opportunity)];
        for(account objAccount:lstAccount1){
           
            wrapContactList.add(new WrapChild(objAccount));
        }
        system.debug(wrapContactList);
    }
    
	//WRAPPER CLASS
    public class WrapChild{
        
        public Account objAccount{get;set;}
        public List<Contact> lstContact{get;set;}
        public List<Opportunity> lstOpportunity{get;set;}
                
        public WrapChild(Account objAccount){
            
            lstContact = new List<Contact>();
            this.objAccount = objAccount;
            this.lstContact = objAccount.Contacts;
            this.lstOpportunity = objAccount.opportunities;
        }            
    }    
}



/*
//Account and Contact Information Is displayed By using Wrapper class 
public class Wrapper {
    
    public list<WrapContactAccount> wrapContactList{get;set;}     

    public Wrapper(){
        wrapContactList =new list<WrapContactAccount>();
        list<Account> lstAccount1=[SELECT id,Name from Account LIMIT 10];
		        
        for(account objA:lstAccount1){
            list<Contact> lstContact1=[SELECT FirstName,LastName,Phone,accountId FROM Contact Where accountId=:objA.Id ];
            for(Contact obj : lstContact1){
                wrapContactList.add(new WrapContactAccount(obj));
            }
        }
        system.debug(wrapContactList);
    }
    
	//WRAPPER CLASS
    public class WrapContactAccount{
        
        //public Account objAccount{get;set;}
        public Contact objContact{get;set;}
        public Opportunity objOpportunity{get;set;}
        
            public WrapContactAccount(Contact obj){
                objContact=obj;
                //objOpportunity=[SELECT Name,Closedate,stage FROM Opprtunity WHERE AccountId=:obj.id];				                
            }            
    }
}
*/
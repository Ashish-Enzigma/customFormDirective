public class AccountWarpper {
    
    public list<WrapAccount> wrapAccountList{get; set;}
    

    public AccountWarpper(){
        wrapAccountList =new list<WrapAccount>();
        list<Account> lstAccount=[SELECT id,name,billingcity,phone from Account LIMIT 10];
        for(account obj: lstAccount){
            wrapAccountList.add(new WrapAccount(obj));
        }            
    }
    
    //WRAPPER CLASS
    public class WrapAccount{
        
        public Account objAccount{get;set;}
            
            public WrapAccount(Account obj){
                objAccount=obj;                
            }
            
    }

}
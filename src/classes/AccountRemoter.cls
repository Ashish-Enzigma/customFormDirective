global with sharing class AccountRemoter {
    
    public String accountName{get;set;}
    public static Account account{get;set;}
    
    public AccountRemoter(){}
    
    @RemoteAction
    global static Account getAccount(String accountName){
        AccountRemoterExtension objEx = new AccountRemoterExtension();
        string str=objEx.gethello();
        system.debug('Str::'+str);
        account=[SELECT Id, Name, Phone	FROM Account WHERE Name = :accountName];
        return account;
    }
}
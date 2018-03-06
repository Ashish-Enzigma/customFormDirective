public class ContactManager {    
    
    public static List <Contact> getContacts(string webAddress){
        List <Contact> listContacts = new List<Contact>();
        Account webAddressAccount = [SELECT Id FROM Account WHERE Website =:webAddress];
        if(webAddressAccount != NULL)
        {
            listContacts = [SELECT Id,Name,Phone FROM Contact WHERE AccountId=:webAddressAccount.Id];
        }
        return listContacts;
    }
}
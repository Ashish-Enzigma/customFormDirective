@istest
public class ContactManagerTests {

    @isTest static void getContactsForValidWebAddress()
    {	            
        Account objAccount= new Account();
        objAccount.name = 'Dev';
        objAccount.AccountNumber='123456';
        objAccount.Website='email@gmail.com';
        insert objAccount;
        system.assert(objAccount.Id!= NULL );
        
        List <Contact> contactList = new List<Contact>();        
        Contact objContact = new Contact();//1st Contact
        objContact.FirstName = 'Dev';
        objContact.LastName = 'tumsar';
        objContact.AccountId = objAccount.Id;        
        contactList.add(objContact);

		Contact obj2Contact = new Contact();//2nd Contact
        obj2Contact.FirstName = 'Dev';
        obj2Contact.LastName ='tumsar';
        obj2Contact.AccountId = objAccount.Id;      
        contactList.add(obj2Contact);
        
        insert contactList;
        System.assert(contactList[0].Id!=null);
        System.assert(contactList[1].Id!=null);
        System.debug('contactList==>'+contactList);
        
        System.assertEquals(2,ContactManager.getContacts('email@gmail.com').size()); 
        //System.assertEquals(expected, actual)
    }
    
    //Account but no Contact Condition
    @isTest static void validWebAddressValidation()
    {	            
        Account objAccount= new Account();
        objAccount.name = 'Dev';
        objAccount.AccountNumber='123456';
        objAccount.Website='email@gmail.com';
        insert objAccount;
        system.assert(objAccount.Id!= NULL );
        
        List <Contact> contactList = new List<Contact>();        
        Contact objContact = new Contact();//1st Contact
        objContact.FirstName = 'Dev';
        objContact.LastName = 'tumsar';
        objContact.AccountId = objAccount.Id;        
        contactList.add(objContact);

		Contact obj2Contact = new Contact();//2nd Contact
        obj2Contact.FirstName = 'Dev';
        obj2Contact.LastName ='tumsar';
        obj2Contact.AccountId = objAccount.Id;      
        contactList.add(obj2Contact);
        
        insert contactList;
        System.assert(contactList[0].Id!=null);
        System.assert(contactList[1].Id!=null);
        System.debug('contactList==>'+contactList);
        
        System.assertEquals(Null,ContactManager.getContacts('hello@gmail.com').size()); 
        //System.assertEquals(expected, actual)
    }
    
    @isTest static void validWebAddressRelatedContact()
    {	            
        Account objAccount= new Account();
        objAccount.name = 'Dev';
        objAccount.AccountNumber='123456';
        objAccount.Website='email@gmail.com';
        insert objAccount;
        system.assert(objAccount.Id!= NULL );
        
        System.assertEquals(0,ContactManager.getContacts('email@gmail.com').size()); 
        //System.assertEquals(expected, actual)
    }
    
    @isTest static void test3() 
    {
        
        String site;
        site='test1.com';
        List<Contact> completeContact= new List<Contact>();
        CompleteContact= ContactManager.getContacts(site);//Static Mathods Call By Class Name
        //System.assertEquals(CompleteContact,NULL,No Contact Details Are Present);
    }
}
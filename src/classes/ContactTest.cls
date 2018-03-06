@istest
public class ContactTest {	

    @isTest static void getContactsForValidWebAddress()
    {	
        //1st Account Enzigma
        Account objAccount= new Account();
        objAccount.name = 'Enzigma';
        objAccount.AccountNumber='123456';
        objAccount.Website='enzigma.com';
        insert objAccount;
        system.assert(objAccount.Id!= NULL );
        
        
        List <Contact> contactList = new List<Contact>();        
        Contact objContact = new Contact();//1st Contact
        objContact.FirstName = 'Dev';
        objContact.LastName = 'tumsar';
        objContact.AccountId = objAccount.Id;        
        contactList.add(objContact);

		Contact obj2Contact = new Contact();//2nd Contact
        obj2Contact.FirstName = 'Funny';
        obj2Contact.LastName ='Roy';
        obj2Contact.AccountId = objAccount.Id;      
        contactList.add(obj2Contact);
        
        Contact obj3Contact = new Contact();//3rd Contact
        obj3Contact.FirstName = 'Tommy';
        obj3Contact.LastName ='Rathor';
        obj3Contact.AccountId = objAccount.Id;      
        contactList.add(obj3Contact);
        
        Contact obj4Contact = new Contact();//4th Contact
        obj4Contact.FirstName = 'Tommy';
        obj4Contact.LastName ='Rathor';
        obj4Contact.AccountId = objAccount.Id;      
        contactList.add(obj4Contact);
        
        //2nd Account of Dominos
        Account objAccount2= new Account();
        objAccount2.name = 'Dominos';
        objAccount2.AccountNumber='12345647';
        objAccount2.Website='dominos.com';
        insert objAccount2;
        system.assert(objAccount.Id!= NULL );
        
        Contact objContactAccount2 = new Contact();//1st Contact
        objContactAccount2.FirstName = 'Atul';
        objContactAccount2.LastName = 'tumsar';
        objContactAccount2.AccountId = objAccount.Id;        
        contactList.add(objContactAccount2);

		Contact obj2ContactAccount2 = new Contact();//2nd Contact
        obj2ContactAccount2.FirstName = 'Aman';
        obj2ContactAccount2.LastName ='Roy';
        obj2ContactAccount2.AccountId = objAccount.Id;      
        contactList.add(obj2ContactAccount2);
        
        Contact obj3ContactAccount2 = new Contact();//3rd Contact
        obj3ContactAccount2.FirstName = 'Prashant';
        obj3ContactAccount2.LastName ='Rathor';
        obj3ContactAccount2.AccountId = objAccount.Id;      
        contactList.add(obj3ContactAccount2);
        
      //  database.insert contactList;
        insert contactList;

        //System.assert(contactList[0].Id!=null);
        //System.assert(contactList[1].Id!=null);
        System.debug('contactList==>'+contactList);
        
      // System.assertEquals(2,ContactManager.getContacts('email@gmail.com').size());  
        //list<Contact> lstContact= new list<Contact>();
        //lstContact=[SELECT id FROM Contact WHERE  Account.name =: 'Enzigma'];
        //System.assertEquals(3,lstContact.size());
        
    }
    
}
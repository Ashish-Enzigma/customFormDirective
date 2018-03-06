@isTest
public class CandidateManagerTriggerHandlerTest {
    
    @testSetup static void setup()
   {
       // Insert the Contact record.
       List<Contact> lstcontactList = new List<Contact>();
       
       Contact objContact =new Contact();
       objContact.lastname = 'TestJob1';
       lstContactList.add(objContact);
       insert lstContactList;
       system.assert(objContact.Id!= NULL );
       
       // Insert job Dummuy Data.
       
      id adminRecordTypeId = Schema.SObjectType.job_ashish__c.getRecordTypeInfosByName().get('Admin').getRecordTypeId();
      id contactid =[SELECT id FROM Contact WHERE lastname = 'TestJob1'].id;
       
 	  List<job_ashish__c> listJobs = new List<job_ashish__c>();
       
       job_ashish__c objJob = new job_ashish__c();
	   objJob.RecordTypeId = adminRecordTypeId;
       
       objJob.Name = 'TestAdmin1';
       objJob.Number_of_Positions__c = 1;
       objJob.Contact__c = contactid;
       objJob.Active__c = true;
       
       listJobs.add(objJob);
       insert listJobs;
       System.assertEquals(1,listJobs.size());
       //system.assert(objJob.Id!= NULL );
       
       // insert candidate.
      
       list<Candidate_Ashish__c> lstCandidateList = new list<Candidate_Ashish__c>();
       
       id jobid=[SELECT id FROM job_ashish__c WHERE Name = 'TestAdmin1' ].id;
       
       
       Candidate_Ashish__c objCandidate =new Candidate_Ashish__c();
       objCandidate.Name = 'TestAshish';
       objCandidate.First_Name__c = 'Ashish';
       objCandidate.Last_Name__c = 'Mishra';
       objCandidate.Email__c = 'ashu@gmail.com';
       objCandidate.Expected_Salary__c = 10000;
       objCandidate.Master_F__c = jobid;
       objCandidate.Status__c = 'Applied';
       objCandidate.Application_Date__c = Date.newInstance(2017, 12, 17);
       
       
       lstCandidateList.add(objCandidate);
       insert lstCandidateList;
       system.assert(objCandidate.Id!= NULL );
   }
   /* //1stTest Method:
    
    public static testMethod void JobDeActive()
    {
        Candidate_Ashish__c objcandidate =new Candidate_Ashish__c();
        objcandidate=[SELECT id,name,First_Name__c,Status__c,Master_F__c FROM Candidate_Ashish__c WHERE First_Name__c = 'Ashish'];
     	system.debug('objcandidate:'+objcandidate);
        objcandidate.Status__c = 'Hired';
        update objcandidate;
        system.debug(objcandidate);
        
     job_ashish__c ObjJob = new job_ashish__c();
     
        system.debug(objcandidate.Master_F__c);
        objJob = [SELECT name,Number_of_Positions__c,Hired_Applicants__c,hirecount__c,Active__c FROM job_ashish__c WHERE id =: objcandidate.Master_F__c]; 
		
       System.assertEquals(false,objJob.Active__c); 
    } 
    
    // 2nd test method
    // Number of Poistion < HireCount
    public static testMethod void JobVacanciesFull()
     {
       id adminRecordTypeId = Schema.SObjectType.job_ashish__c.getRecordTypeInfosByName().get('Admin').getRecordTypeId();
       id contactid =[SELECT id FROM Contact WHERE lastname = 'TestJob1'].id;
	   List<job_ashish__c> listJobs = new List<job_ashish__c>();
        
        job_ashish__c objJob = new job_ashish__c();
		objJob.RecordTypeId = adminRecordTypeId;
        objJob.Name = 'TestAdmin3';
        objJob.Number_of_Positions__c = 1;
        objJob.Contact__c = contactid;
        objJob.Active__c = True;
        listJobs.add(objJob);
        insert listJobs;
        System.assertEquals(1,listJobs.size());
        
        
        list<Candidate_Ashish__c> lstcandidate = new list<Candidate_Ashish__c>();
        id jobid=[SELECT id FROM job_ashish__c WHERE Name = 'TestAdmin3' ].id;
        
         //1st Candidate Record:
        Candidate_Ashish__c objcandidate =new Candidate_Ashish__c();
        objcandidate.Name = 'TestAman';
        objcandidate.First_Name__c = 'Aman';
        objcandidate.Last_Name__c = 'Jaiswal';
        objcandidate.Email__c = 'jaiswal@gmail.com';
        objcandidate.Expected_Salary__c = 10000;
        objcandidate.Master_F__c = jobid;
        objcandidate.Status__c = 'Applied';
        lstcandidate.add(objcandidate);  
		
         //2nd Candidate Record:
       Candidate_Ashish__c objcandidate1 =new Candidate_Ashish__c();
        objcandidate1.Name = 'TestAtual';
        objcandidate1.First_Name__c = 'Atul';
        objcandidate1.Last_Name__c = 'Rajput';
        objcandidate1.Email__c = 'rajput@gmail.com';
        objcandidate1.Expected_Salary__c = 10000;
        objcandidate1.Master_F__c = jobid;
        objcandidate1.Status__c = 'Applied';
        lstcandidate.add(objcandidate1);  
        insert lstcandidate;
         
        System.assertEquals(2,lstcandidate.size());
        
         // update the record
         
         list<Candidate_Ashish__c> lstcandidateupdate =new list<Candidate_Ashish__c>();
         lstcandidateupdate=[SELECT Last_Name__c,Status__c FROM Candidate_Ashish__c WHERE Master_F__c =:jobid ];
		//system.debug(lstcandidateupdate);
         System.assertEquals(2,lstcandidateupdate.size());      
        
        Candidate_Ashish__c objupdate1 = lstcandidateupdate[0];
         objupdate1.Status__c = 'Hired';
         update objupdate1;
         system.debug('1st candidate is updated.....');
         
         Candidate_Ashish__c objupdate2 = lstcandidateupdate[1];
         objupdate2.Status__c = 'Hired';
         system.debug('second candidate is updated.....');
         
         try
         {
         	update objupdate2;
            system.debug('thorw error');
         }
         catch(exception e)
         {
             system.debug(e.getMessage());
         }
         
       
         
     }
    */
    //3rd test Method :
    // if job is inactive and candidate apply then..
    public static testMethod void JobNotExist()
    {
         id adminRecordTypeId = Schema.SObjectType.job_ashish__c.getRecordTypeInfosByName().get('Admin').getRecordTypeId();
       id contactid =[SELECT id FROM Contact WHERE lastname = 'TestJob1'].id;
	   List<job_ashish__c> listJobs = new List<job_ashish__c>();
        
        job_ashish__c objJob = new job_ashish__c();
		objJob.RecordTypeId = adminRecordTypeId;
        objJob.Name = 'TestAdmin2';
        objJob.Number_of_Positions__c = 1;
        objJob.Contact__c = contactid;
        objJob.Active__c = false;
        listJobs.add(objJob);
        insert listJobs;
        System.assertEquals(1,listJobs.size());
        
        
        list<Candidate_Ashish__c> lstcandidate = new list<Candidate_Ashish__c>();
        id jobid=[SELECT id FROM job_ashish__c WHERE Name = 'TestAdmin2' ].id;
        
        Candidate_Ashish__c objcandidate =new Candidate_Ashish__c();
        objcandidate.Name = 'TestMishra';
        objcandidate.First_Name__c = 'Ashish';
        objcandidate.Last_Name__c = 'Mishra';
        objcandidate.Email__c = 'miss@gmail.com';
        objcandidate.Expected_Salary__c = 10000;
        objcandidate.Master_F__c = jobid;
        objcandidate.Status__c = 'Applied';
        lstcandidate.add(objcandidate);
        try
        {
        	insert lstcandidate;
        }
        catch(exception ex)
        {
            system.debug(ex.getMessage());
        }
            
    }
    
    //4th test Method :
    public static  testMethod void AtaTimeHire()
   {
      id adminRecordTypeId = Schema.SObjectType.job_ashish__c.getRecordTypeInfosByName().get('Admin').getRecordTypeId();
      id contactid =[SELECT id FROM Contact WHERE lastname = 'TestJob1'].id;
  List<job_ashish__c> listJobs = new List<job_ashish__c>();
       
       job_ashish__c objJob = new job_ashish__c();
objJob.RecordTypeId = adminRecordTypeId;
       objJob.Name = 'TestAdmin4';
       objJob.Number_of_Positions__c = 1;
       objJob.Contact__c = contactid;
       objJob.Active__c = True;
       listJobs.add(objJob);
       insert listJobs;
       System.assertEquals(1,listJobs.size());
       
       
       list<Candidate_Ashish__c> lstcandidate = new list<Candidate_Ashish__c>();
       id jobid=[SELECT id FROM job_ashish__c WHERE Name = 'TestAdmin4' ].id;
       
       Candidate_Ashish__c objcandidate =new Candidate_Ashish__c();
       objcandidate.Name = 'TestRanjeet';
       objcandidate.First_Name__c = 'Ranjeet';
       objcandidate.Last_Name__c = 'Kadam';
       objcandidate.Email__c = 'ranjeet@gmail.com';
       objcandidate.Expected_Salary__c = 10000;
       objcandidate.Master_F__c = jobid;
       objcandidate.Status__c = 'Applied';
       lstcandidate.add(objcandidate);  

      Candidate_Ashish__c objcandidate1 =new Candidate_Ashish__c();
       objcandidate1.Name = 'TestDigesh';
       objcandidate1.First_Name__c = 'Digesh';
       objcandidate1.Last_Name__c = 'Dalal';
       objcandidate1.Email__c = 'digesh@gmail.com';
       objcandidate1.Expected_Salary__c = 10000;
       objcandidate1.Master_F__c = jobid;
       objcandidate1.Status__c = 'Applied';
       lstcandidate.add(objcandidate1);  
       insert lstcandidate;
        
       System.assertEquals(2,lstcandidate.size());
       
       
      list<Candidate_Ashish__c> lstcandidateupdate =new list<Candidate_Ashish__c>();
        lstcandidateupdate=[SELECT Last_Name__c,Status__c FROM Candidate_Ashish__c WHERE Master_F__c =:jobid ];
//system.debug(lstcandidateupdate);
        System.assertEquals(2,lstcandidateupdate.size());      
       
       for(Candidate_Ashish__c obj : lstcandidateupdate)
       {
           obj.Status__c = 'Hired';
           try
           {
               update obj;
           }
           catch(exception e)
           {
               system.debug(e.getMessage());
           }
           	
       }
   }
    
    //5th test Class
    public static  testMethod void CheckRejectIneligibleCandidateSameJob()
   {  
       list<Candidate_Ashish__c> lstCandidateList = new list<Candidate_Ashish__c>();       
       id jobid=[SELECT id FROM job_ashish__c WHERE Name = 'TestAdmin1' ].id;       
       
       Candidate_Ashish__c objCandidate =new Candidate_Ashish__c();
       objCandidate.Name = 'TestAshish';
       objCandidate.First_Name__c = 'Ashish';
       objCandidate.Last_Name__c = 'Mishra';
       objCandidate.Email__c = 'ashu@gmail.com';
       objCandidate.Expected_Salary__c = 10000;
       objCandidate.Master_F__c = jobid;
       objCandidate.Status__c = 'Applied';
       //objCandidate.Application_Date__c = Date.newInstance(2017, 12, 17);
       
       
       lstCandidateList.add(objCandidate);
       
       
       try
       {
           insert lstCandidateList;
           system.debug('Inserted');
           
       }
       catch(exception e)
       {
           system.debug(e.getMessage());
       }
          
          // System.assertEquals(1,lstcandidate1.size());
       	
   }
    
    //6th test class
     public static  testMethod void CheckRejectIneligibleCandidateForAnotherJob()
    {  
       id adminRecordTypeId = Schema.SObjectType.job_ashish__c.getRecordTypeInfosByName().get('Admin').getRecordTypeId();
       id contactid =[SELECT id FROM Contact WHERE lastname = 'TestJob1'].id;
       List<job_ashish__c> listJobs = new List<job_ashish__c>();
        
        job_ashish__c objJob = new job_ashish__c();
		objJob.RecordTypeId = adminRecordTypeId;
        objJob.Name = 'TestAdmin2';
        objJob.Number_of_Positions__c = 1;
        objJob.Contact__c = contactid;
        objJob.Active__c = true;
        listJobs.add(objJob);
        insert listJobs;
        System.assertEquals(1,listJobs.size());
       
        list<Candidate_Ashish__c> lstcandidate = new list<Candidate_Ashish__c>();
        id jobid=[SELECT id FROM job_ashish__c WHERE Name = 'TestAdmin2' ].id;
        
        // for candidate
        //Candidate_Ashish__c objcandidate =new Candidate_Ashish__c();
        Candidate_Ashish__c objCandidate =new Candidate_Ashish__c();
       	objCandidate.Name = 'TestAshish';
      	objCandidate.First_Name__c = 'Ashish';
       	objCandidate.Last_Name__c = 'Mishra';
       	objCandidate.Email__c = 'ashu@gmail.com';
       	objCandidate.Expected_Salary__c = 10000;
       	objCandidate.Master_F__c = jobid;
       	objCandidate.Status__c = 'Applied';
        lstcandidate.add(objcandidate);
        insert lstcandidate;
      	
    }

}
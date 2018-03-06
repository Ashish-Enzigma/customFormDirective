global class DailyDigistBatchClass implements Database.Batchable<sObject> {
    //string query=[SELECT Name,Application_Date__c,Master_F__r.Description__c,Master_F__r.Contact__r.Email,Country__c,Expected_Salary__c,Email__c,Upload_Your_Pict__c FROM Candidate_Ashish__c WHERE Application_Date__c=TODAY];
    global DailyDigistBatchClass()
    {
        
    }
    //First Method
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator([SELECT Name,Application_Date__c,Master_F__r.Description__c,Master_F__r.Contact__r.Email,Country__c,Expected_Salary__c,Email__c,Upload_Your_Pict__c FROM Candidate_Ashish__c WHERE Application_Date__c=TODAY]);        
    }
    
    //Second Method
    global void execute(Database.BatchableContext BC,List<Candidate_Ashish__c> lstCandidateBatch){
        
        List <Candidate_Ashish__c> lstCandidate =new List<Candidate_Ashish__c>();
        for(Candidate_Ashish__c candidate : lstCandidateBatch){
            lstCandidate.add(candidate);
        }
        system.debug('Email'+lstCandidate[0].Master_F__r.Contact__r.Email);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        
        
        String body = 'Hello <br><br>';
        /*for(Candidate_Ashish__c objCandidate :lstCandidate)
{
//String[] toAddresses = new String[] {'ashish.mishra@enzigma.in'}; 

String[] toAddresses= new String[] {string.valueOf(objCandidate.Master_F__r.Contact__r.Email)};
system.debug('toAddresses:'+toAddresses);
system.debug('Check MAnager Email'+objCandidate.Master_F__r.Contact__r.Email);
mail.setToAddresses(toAddresses);

mail.setSubject('Mail Notification');
mail.setSaveAsActivity(false);           
body += 'Description :'+objCandidate.Master_F__r.Description__c+'<br>';
body += 'Application Date :'+objCandidate.Application_Date__c+'<br>';
body += 'Country : '+objCandidate.Country__c+'<br>';
body += 'Expected Salary : '+objCandidate.Expected_Salary__c+ '<br>';
body += 'Email : '+objCandidate.Email__c+ '<br><br>';
body += 'Thank you. <br><br>';
mail.setHtmlBody(body);     

}*/
        
        //Create a set of Emails
        Set<String> setEmail = new Set<String>();
        
        for(Candidate_Ashish__c objCandidate :lstCandidate){
            String strEmailID= string.valueOf(objCandidate.Master_F__r.Contact__r.Email);
            setEmail.add(strEmailID);
        }
        System.debug('setEmail::'+setEmail);
        
        //Create New list for Candidate Record
        List<Candidate_Ashish__c> newlstCandidate = new List<Candidate_Ashish__c>();
        
        //Create Map For Email as ID and list of Candidate Record as Value 
        Map<string,list<Candidate_Ashish__c>> mapCandidateInfo = new Map<string,list<Candidate_Ashish__c>>();
        
        //put(string,list)
        for(string setObject : setEmail){
            for(Candidate_Ashish__c objCandidate :lstCandidate)
                if(setObject == string.valueOf(objCandidate.Master_F__r.Contact__r.Email)){
                    newlstCandidate.add(objCandidate);                        		  
                }
            mapCandidateInfo.put(setobject,newlstCandidate);                                                
        }
        system.debug('Map::'+mapCandidateInfo);
        
        
        
        //mail.setHtmlBody(body);  
        //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }
    
    //3rd Method
    global void finish(Database.BatchableContext info){
        
         Database.executeBatch(new testApex());
        
    }
    
    
}
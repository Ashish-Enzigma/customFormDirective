public class CandidateManagerTriggerHandler {

    static integer count=0;
    
   public static void CheckAvailableJobPostForNewCandidate(List<Candidate_Ashish__c> newCandidateList)
   {
       system.debug('inside CheckAvailableJobPostForNewCandidate');
      id JobID = newCandidateList[0].Master_F__c;
      system.debug(JobID);
      job_ashish__c ObjJob = new job_ashish__c();
      objJob = [SELECT Number_of_Positions__c,Hired_Applicants__c,Active__c,hirecount__c FROM job_ashish__c WHERE id =: JobID ];
       
      system.debug('objJob'+objJob);
      Integer no_Of_Position  = (Integer)objJob.Number_of_Positions__c;       
      
     
       if(newCandidateList[0].Status__c == 'Hired')
       {
           system.debug('newCandidate:'+newCandidateList[0]);
           
           objJob.hirecount__c =objJob.hirecount__c + 1;
           
           system.debug(objJob.hirecount__c);
           /*if(no_Of_Position == objJob.hirecount__c)
           {
               objJob.Active__c = False;
               update objJob;
               system.debug('job is deactive');
           }*/
           
           //1st Condition Check Whether job is active or not.
           if(objJob.Active__c == TRUE)
            {
              
              	system.debug('Inside 1st if objJob.Active__c '+objJob.Active__c);
                if(no_Of_Position == objJob.hirecount__c)
                {
                    system.debug('Inside 1st Condition'+objJob.hirecount__c);
                    objJob.Active__c = False;
                    update objJob;
                  
                }                
            }
            
            //Check 2nd Condition hire count is gerater then form no of position and job is deactive.
            if(no_Of_Position < objJob.hirecount__c && objJob.Active__c == FALSE)
            {
                system.debug('Vacancies is full');
            	newCandidateList[0].Master_F__c.addError('Sorry, No vacancies available for this Job');
            }
       }

   }
    
    
    //3rd Condition 
    public static void job_Deactive_For_NewCandidate(List<Candidate_Ashish__c> newCandidateList)
   {
      id JobID = newCandidateList[0].Master_F__c;
      system.debug(JobID);
      job_ashish__c ObjJob = new job_ashish__c();
      objJob = [SELECT name,Number_of_Positions__c,Hired_Applicants__c,Active__c FROM job_ashish__c WHERE id =: JobID ];
      //objJob = [SELECT name,Number_of_Positions__c,countH__c,Active__c FROM job_dhaval__c WHERE id =: JobID];  
      system.debug('objJob'+objJob);
      Integer no_Of_Position  = (Integer)objJob.Number_of_Positions__c;       
      integer hiredCount=0;
     	System.debug('ObjJob.Active__c :'+ObjJob.Active__c );
       System.debug('Status :'+newCandidateList[0].Status__c );
       if(ObjJob.Active__c ==false && newCandidateList[0].Status__c=='Applied')
       {
           System.debug('You Can not Apply for this job because job is deactiveded');
           newCandidateList[0].addError('You Can not Apply for this job because job is deactiveded');
       }

   }
    
	//4th Condition
    public static void checkMultipleHireSameTime(List<Candidate_Ashish__c> Candidat)
   {
      // system.debug('in the ckeck multiple hire same at a time');
      
       for(Candidate_Ashish__c obj : Candidat)
       {
           //Same time Hire two Candidate
           if(obj.Status__c == 'Hired')
           {
               count = count + 1;
               system.debug(count);
               if(count == 2 && obj.Status__c == 'Hired')
               {
                   system.debug('At the same time Multiple hiring  is not allowed');
                   obj.Master_F__c.addError('not allow Multiple hired at a time');
               }
           }
           
       }
   }
    
    //5th Condition 
    //Before 6 Month you can not Apply 
    public static void RejectIneligibleCandidate(List<Candidate_Ashish__c> CandidatNewList)
   {
       
 	id job=CandidatNewList[0].Master_F__c;
        
       list<Candidate_Ashish__c> listCandidate =new list<Candidate_Ashish__c>();
    
        //list of record who will allreday appliey for job 
       for(Candidate_Ashish__c objmatchlist : CandidatNewList)
       {
           
         listCandidate = [SELECT id,First_Name__c,Email__c,Master_F__c,Application_Date__c 
                        FROM Candidate_Ashish__c WHERE Email__c =: objmatchlist.Email__c]; 
       	
       }
       system.debug(listCandidate);
       
     for(Candidate_Ashish__c obj : listCandidate)
     {
       system.debug('2nd loop');
       Date a = obj.Application_Date__c;
       Integer day = system.Math.abs(a.daysBetween(system.today()));
        
        //cannot apply for same job within 6 months for the same job.
       if(day < 180 && obj.Master_F__c == job) 
       {
           system.debug('You cannot apply for same job within 6 months for the same job');
           
          obj.Application_Date__c.addError('You cannot apply for this job within 6 months');
        
         
       }
       //6th Condition
       //cannot apply for diffrent job within 6 months for any job
       if(day < 180 && obj.Master_F__c != job) 
       {
           system.debug('You cannot apply for diffrent job within 6 months for any job');
           
          obj.Application_Date__c.addError('You cannot apply for diffrent job within 6 months');
       }
     }
     
             
                   
   
    /**public static void RejectIneligibleCandidate(List<Candidate_Ashish__c> Candidat)
   {
      system.debug('Before 6 Month you can not Apply ');
       list<Candidate_Ashish__c> dbDataList = new list<Candidate_Ashish__c>();
       dbDataList=[SELECT Id,Name__c,Email__c,Application_Date__c,Master_F__c FROM Candidate_Ashish__c];
      
       for(Candidate_Ashish__c obj : Candidat)//NeW list Itration
       {
           for(Candidate_Ashish__c obj2 : dbDataList)//databaseList Itration
           {
               if(obj.Email__c==obj2.Email__c)
               {
                    Date appDate = obj.Application_Date__c;
       				Integer dayCount = system.Math.abs(appDate.daysBetween(system.today()));
                   if(dayCount<180 && obj.Master_F__c == obj2.Master_F__c)//day < 180 && obj.JobmasterRel__c == job
                   {
                       System.debug('You cannot apply for this job within 6 months');
                   }
               }
           }
                    
           
       }*/
   }
    
}
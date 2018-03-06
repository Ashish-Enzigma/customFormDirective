public class Fetch_ActiveJobList {
    public static id jobID{get;set;}
    List <job_ashish__c> activeJobList{get;set;}//lstActiveJobs
    Candidate_Ashish__c objCan;
    
    public  Fetch_ActiveJobList(){
        jobs();
               
    }
    public  Fetch_ActiveJobList(ApexPages.StandardController stdController){
        this.objCan = (Candidate_Ashish__c)stdController.getRecord();
        
    }
    public void jobs(){
        activeJobList = new List<Job_ashish__c>();
    	activeJobList = [SELECT Description__c,Expires_On__c,Required_Skills__c,Qualification_Required__c,Certification_Required__c FROM job_ashish__c WHERE Active__c=TRUE];
  	 	
    }
    public List<Job_ashish__c> getJobList(){
        return activeJobList;
    }
    
    //JobApplication
     public PageReference applyForJob() 
    {   
        //system.debug('hi');
        //Pass JobID through Query String
       	PageReference pageRequest = new PageReference('/apex/JobApplication?jobId='+jobID);
        return pageRequest;        
    }
    
    //For Attachment
     public Attachment attachment {
  		get {
      		if (attachment == null)
        	attachment = new Attachment();
      		return attachment;
    		}
  		set;
  	}
    
    public PageReference upload() {
		system.debug('upload in');        
		objCan.Master_F__c=apexpages.currentpage().getparameters().get('jobId');
        Insert objCan;//Insert 1st Candidate after upload attachment Should perform other wise NO Candidate id genrates.
        
    	attachment.OwnerId = UserInfo.getUserId();
    	attachment.ParentId = objCan.Id; // the record the file is attached to
    	attachment.IsPrivate = true;

    try {
      	insert attachment;
    } catch (DMLException e) {
      	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
      	return null;
    } finally {
      	attachment = new Attachment(); 
    }    
    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    return null;
  }

}
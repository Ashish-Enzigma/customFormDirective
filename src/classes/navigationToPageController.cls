public class navigationToPageController {    
    job_ashish__c objJob {get;set;}
    //Candidate_Ashish__c objCan;
    
    public  navigationToPageController(ApexPages.StandardController stdController){
        this.objJob = (job_ashish__c)stdController.getRecord();
        
    }
    
    public PageReference save1(){ 
        return Page.Job_Wizard;
        
    } 
    
    public PageReference step2(){
        return Page.JobWizardPage2;
    }
    public PageReference step3(){
        return Page.JobWizardPage3;
    }
    
    public PageReference active(){
        
        objJob.Active__c=true;
        Insert objJob;
        return Page.JobWizard_portal;
    }
    public PageReference deactive() 
    {
        
        objJob.Active__c=false;
        Insert ObjJob;
        return Page.JobWizard_portal;
    }
   
    
}
public class testApex implements database.Batchable<sobject>
{
    list<lead> llist=new list<lead>();
    public string query='select id,name,status from lead';
    public string flag='Closed - Not Converted';
    
    public database.querylocator start(database.BatchableContext bc){
       return database.getQueryLocator(query); 
  }
    public void execute(database.BatchableContext bc,list<lead> le){
        for(lead l:le){
            if(l.status==flag)
            {
                llist.add(l);
            }
                
        }

      delete llist;            
      database.emptyRecycleBin(llist); 
    }
    public void finish(database.BatchableContext bc){
        
    }
 }
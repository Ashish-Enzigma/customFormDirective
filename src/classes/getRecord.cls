public class getRecord {
    list<RecordType> recordTypelist{get;set;}
    public getRecord(ApexPages.StandardController controller) {
    
        recordTypelist=[SELECT Name FROM Recordtype];
        

    }

}
public class TouristService {
	public static void markDuplicates(List<Tourist__c> newTourists) {
    	List<String> emails = new List<String> ();
    	List<String> lastNames = new List<String> (); 
        for (Tourist__c i : newTourists) {
            emails.add (i.Email__c);
            lastNames.add (i.Last_name__c);
        }
        
		List<Tourist__c> tourists = new List<Tourist__c> ( [
            SELECT  Email__c,
            		Last_name__c
            FROM    Tourist__c 
            WHERE Email__c IN : emails OR 
            Last_name__c IN : lastNames
		]
		);
    
	List<Tourist__c> touristsToUpdate = new List<Tourist__c> (); 
    
	for (Tourist__c t : tourists) {
       for (Tourist__c nt : newTourists) {
           Boolean isSameEmail = t.Email__c == nt.Email__c;
           Boolean isSameLastName = t.Last_name__c == nt.Last_name__c;
           
              if (isSameEmail && isSameLastName) {
                  nt.IsDuplicate__c = true;
                  touristsToUpdate.add (nt);
           	 	}
       }
    }
   insert newTourists;     
   update touristsToUpdate;
	}
}
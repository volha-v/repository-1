public class TouristService {
public static void markDuplicates(List<Tourist__c> newTourists) {
List<Tourist__c> tourist = new List<Tourist__c> ( [
     											SELECT  Email__c,
    													Last_name__c
                       							FROM    Tourist__c 
]
);
    
List<Tourist__c> touristsToUpdate = new List<Tourist__c> (); 
    
for (Tourist__c t : tourist) {
       for (Tourist__c nt : newTourists) {
            Boolean isSameEmail = t.Email__c == nt.Email__c;
 			Boolean isSameLastName = t.Last_name__c == nt.Last_name__c;
           
              if (isSameEmail && isSameLastName) {
                  nt.IsDuplicate__c = true;
                  touristsToUpdate.add (nt);
           	 	}
			}
		}
   update touristsToUpdate;
	}
}

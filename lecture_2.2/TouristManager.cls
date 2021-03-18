public class TouristManager {
    
 public static List<Tourist__c> getName (String name) {
  List<Tourist__c> touristName = [SELECT Age__c, Name 
                                	FROM Tourist__c 
                                	WHERE Name =:name ];
      System.debug (touristName);
      return touristName;  
   }
    
    
  public static List<Tourist__c> getTouristsByAge (Integer age) {
	List<Tourist__c> touristsByAge = [SELECT Age__c,Name 
                                    FROM Tourist__c 
                                    WHERE Age__c =: age];
  
  return touristsByAge;  
    }  
    
    
}
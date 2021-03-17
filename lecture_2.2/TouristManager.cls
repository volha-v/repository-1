public class TouristManager {
      
  public static List<Tourist__c> getName (String n) {
  List<Tourist__c> touristName = [SELECT Age__c, Name 
                                	FROM Tourist__c 
                                	WHERE Name =: n];
  return touristName;  
  }
    
  public static List<Tourist__c> getWithAge (Integer a) {
	List<Tourist__c> tourisWithAge = [SELECT Age__c,Name 
                                    FROM Tourist__c 
                                    WHERE Age__c =: a];
  return tourisWithAge;  
    }  
      
    
}
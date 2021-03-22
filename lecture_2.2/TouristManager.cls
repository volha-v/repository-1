public class TouristManager {

public static List < Tourist__c > getByName(String name) {
	if (name == null) {
		return new List < Tourist__c > ();
		}
	List < Tourist__c > tourist = [
									SELECT Age__c, Name
									FROM Tourist__c
									WHERE Name LIKE: name
        ];
	return tourist;
	}

public static List < Tourist__c > getByAge(Integer age) {
	if (age == null) {
		return new List < Tourist__c > ();
		}
	List < Tourist__c > touristsByAge = [
										SELECT Age__c, Name
										FROM Tourist__c
										WHERE Age__c = :age
    ];

	return touristsByAge;
	}

public static List < Flight__c > getByFlightYear(Integer year) {
	if (year == null) {
		return new List < Flight__c > ();
		}
	List < Flight__c > touristsByFlightYear = [
												SELECT Tourist__r.Age__c, 
        												Tourist__r.Name
												FROM Flight__c
												WHERE CALENDAR_YEAR(Trip__r.Start_Date__c) = :year
    ];

	return touristsByFlightYear;
	}

public static List < Flight__c > getByFlight() {
	List < Flight__c > touristsByFlight = [
											SELECT Tourist__r.Name, 
        											Tourist__r.Age__c, 
        											Trip__r.Start_Date__c, 
        											Trip__r.Name
													FROM Flight__c
    ];

	return touristsByFlight;
	}

public static List < Tourist__c > getWithoutFlight() {
		List < Tourist__c > touristsWithoutFlight = [
													SELECT Age__c, 
            												Name
													FROM Tourist__c
													WHERE Id NOT IN(SELECT Tourist__c FROM Flight__c)];

	return touristsWithoutFlight;
	}
}
@isTest
public class RemoveHtmlMarkup_Test {
    
    @testSetup
    static void setup() {
        
        // Create a test account
		Account a = new Account(Name='Test Account');
        insert a;    
        
        //Adjust the record type based on your business use case 
        RecordType rt = [SELECT Id FROM RecordType WHERE SObjectType = 'Opportunity' AND developerName = 'Manufacturing'];
        
        // Create a test opportunity
        Opportunity o = new Opportunity(Name='Test Opportunity', 
                                        AccountId=a.id,
                                        RecordTypeId = rt.Id, 
                                        StageName='Prospecting', 
                                        CloseDate=Date.today());
        insert o; 
    }
    
    @isTest
    static void stripHtmlTags() {
        
        // Access the opportunity that was just created.
        Opportunity opportunity = [SELECT Id, rakeshistomMVP__Deal_Analysis__c FROM Opportunity LIMIT 1];
        
        //Update RichText (Area) field
        opportunity.rakeshistomMVP__Deal_Analysis__c ='<html><body>This is a Test</body></html>';
        update opportunity;
        
         // Access the opportunity that was just update.
        Opportunity updatedOpportunity = [SELECT Id, rakeshistomMVP__Deal_Analysis__c, rakeshistomMVP__Deal_Analysis_Text__c FROM Opportunity LIMIT 1];
		
        //Validate 
        System.assertEquals(updatedOpportunity.rakeshistomMVP__Deal_Analysis_Text__c, 'This is a Test');		
    }
}

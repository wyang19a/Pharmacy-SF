@isTest
public class FormularyTriggerTest {
    @isTest static void FormularyTriggerTest(){

        Formulary__c f = new Formulary__c();
        f.Name = 'Test Formulary';
        f.Inventory__c = 100;
        f.Type__c = 'Commercial';
        f.Backorder__c = false;
        insert f;

        Prescription__c rx = new Prescription__c();
        rx.Patient__c = (new Patient__c(Name = 'Test Patient')).Id;
        rx.Product__c = f.Id;
        rx.Quantity__c = 30;
        rx.Daily_Dose__c = 1;
        insert rx;

        
        f.Backorder__c = true;
        test.startTest();
        System.debug(f.Backorder__c);
        update f;
        test.stopTest();

        // Assert
        System.assertEquals(expected, actual);
    }
    

    // @isTest(seeAllData=true)
    // public static void FormularyTriggerTest() {
    //     Formulary__c f = [SELECT Id FROM Formulary__c LIMIT 1];
    //     f.Backorder__c = TRUE;
    //     Prescription__c[] p = [SELECT Prescription__c FROM ]
    //     update f;
    // }
}

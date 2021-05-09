@isTest
private class FormularyTriggerTest {
    @isTest
    private static void FormularyTriggerTest(){
        Patient__c pt = new Patient__c();
        pt.Name = 'Test Patient';
        pt.First_Name__c = 'Test First Name';
        pt.Date_Of_Birth__c = Date.today();
        insert pt;

        List<Formulary__c> fList = new List<Formulary__c>();
        for(Integer i = 0; i < 200; i++) {
            Formulary__c f = new Formulary__c();
            f.Name = 'Test Formulary ' + i;
            f.Inventory__c = 100;
            f.Type__c = 'Commercial';
            f.Backorder__c = false;
            fList.add(f);
        }
        insert fList;

        Prescription__c rx = new Prescription__c();
        rx.Patient__c = pt.id;
        rx.Product__c = fList[0].Id;
        rx.Quantity__c = 30;
        rx.Daily_Dose__c = 1;
        rx.Refills__c = 3;
        insert rx;
        
        for(Integer i = 0; i < fList.size(); i++) {
            fList[i].Backorder__c = true;
        }
        test.startTest();
        update fList;
        test.stopTest();

        // Assert
        // System.assertEquals(false, f.backorder__c);
    }
    

    // @isTest(seeAllData=true)
    // public static void FormularyTriggerTest() {
    //     Formulary__c f = [SELECT Id FROM Formulary__c LIMIT 1];
    //     f.Backorder__c = TRUE;
    //     Prescription__c[] p = [SELECT Prescription__c FROM ]
    //     update f;
    // }
}

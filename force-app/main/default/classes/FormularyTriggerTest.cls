@isTest
private class FormularyTriggerTest {

    @isTest static void FormularyTriggerTest(){
        Patient__c pt = MyDataFactory.insertTestPatient();
        List<Formulary__c> fList = MyDataFactory.insertTestFormulary();
        Prescription__c rx = MyDataFactory.insertTestPrescription(pt, fList);

        // //Set up for data for the tests
        // Patient__c pt = new Patient__c();
        // pt.Name = 'Test Patient';
        // pt.First_Name__c = 'Test First Name';
        // pt.Date_Of_Birth__c = Date.today();
        // insert pt;

        // // bulkify Formulary
        // List<Formulary__c> fList = new List<Formulary__c>();
        // for(Integer i = 0; i < 200; i++) {
        //     Formulary__c f = new Formulary__c();
        //     f.Name = 'Test Formulary ' + i;
        //     f.Inventory__c = 100;
        //     f.Type__c = 'Commercial';
        //     f.Backorder__c = false;
        //     fList.add(f);
        // }
        // insert fList;

        // Prescription__c rx = new Prescription__c();
        // rx.Patient__c = pt.id;
        // rx.Product__c = fList[0].Id;
        // rx.Quantity__c = 30;
        // rx.Daily_Dose__c = 1;
        // rx.Refills__c = 3;
        // insert rx;

        // Act only change part of the record set.
        for(Formulary__c f : fList) {
            f.Backorder__c = true;
        }

        // Test
        test.startTest();
        // List<Boolean> exceptions = new List<Boolean>();
        // String errorMessage = new String();
        // try {
            update fList;
        // } catch(Exception e){
            // errorMessage = e.getMessage();
            // exceptions.add(true);
        // }
        test.stopTest();

        // Assert
        List<Task> tasks = [SELECT Id FROM Task];
        List<Formulary__c> products = [SELECT Id from Formulary__c];
        System.assertEquals(200, tasks.size()); // Getting 201..?
        System.assertEquals(200, products.size());
    }
    
    @isTest static void deletedRecordsWentToArchiveObj() {
        Formulary__c[] fList = new Formulary__c[0];
        for(Integer i = 0; i < 200; i++) {
            Formulary__c f = new Formulary__c();
            f.Name = 'Test ' + i;
            f.Inventory__c = 100;
            f.Type__c = 'Commercial';
            fList.add(f);
        }
        insert fList;

        test.startTest();
        delete fList;
        test.stopTest();

        Formulary_Archive__c[] archiveList= [SELECT Id FROM Formulary_Archive__c];
        System.assertEquals(200, archiveList.size());
    }
}

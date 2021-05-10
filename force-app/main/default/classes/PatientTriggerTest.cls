@isTest
private class PatientTriggerTest {
    // @TestSetup
    // static void makeData(){
    //     Patient__c[] ptList = new Patient__c[0];
    //     for(Integer i = 0; i < 200; i++) {
    //         Patient__c pt = new Patient__c();
    //         pt.Name = 'TestLast ' + i;
    //         pt.First_Name__c = 'TestFirst ' + i;
    //         pt.Date_Of_Birth__c = '01/01/2000';
    //         ptList.add(pt);
    //     }
    //     insert ptList;
    // } 
    @isTest static void newPatientWithoutContactTriggerTest() {
        Patient__c[] ptList = new Patient__c[0];
        for(Integer i = 0; i < 200; i++) {
            Patient__c pt = new Patient__c();
            pt.Name = 'TestLast ' + i;
            pt.First_Name__c = 'TestFirst ' + i;
            pt.Date_Of_Birth__c = Date.today();
            ptList.add(pt);
        }
        test.startTest();
        insert ptList;
        test.stopTest();

        List<Task> tList = [SELECT Id FROM Task];
        Patient__c testPt = [SELECT FullName__c FROM Patient__c Order By Name LIMIT 1];
        System.assertEquals(200, tList.size());
        System.assertEquals('TestFirst 0 TestLast 0', testPt.FullName__c);
    }
    @isTest static void newPatientUpdateTriggerTest() {
        Patient__c[] ptList = new Patient__c[0];
        for(Integer i = 0; i < 200; i++) {
            Patient__c pt = new Patient__c();
            pt.Name = 'TestLast ' + i;
            pt.First_Name__c = 'TestFirst ' + i;
            pt.Date_Of_Birth__c = Date.today();
            ptList.add(pt);
        }
        insert ptList;
        
        for(Integer i = 0; i < 200; i++) {
            ptList[i].First_Name__c = 'TestName ' + i;
        }
        test.startTest();
        update ptList;
        test.stopTest();

        Patient__c resultPt = [SELECT FullName__c FROM Patient__c WHERE Name = 'TestLast 0'];
        System.assertEquals('TestName 0 TestLast 0', resultPt.FullName__c);
    }
    // @isTest static void newPatientWithContactTriggerTest() {
    //     Patient__c[] ptList = new Patient__c[0];
    //     for(Integer i = 0; i < 200; i++) {
    //         Patient__c pt = new Patient__c();
    //         pt.Name = 'TestLast ' + i;
    //         pt.First_Name__c = 'TestFirst ' + i;
    //         pt.Date_Of_Birth__c = Date.today();
    //         pt.Phone__c = '492-123-4567';
    //         ptList.add(pt);
    //     }
    //     insert ptList;

    //     List<Task> tList = [SELECT Id FROM Task];
    //     System.assertEquals(200, tList.size());
    //     System.assertEquals('TestFirst 0 TestLast 0', ptList[0].FullName__c);
    // }
}

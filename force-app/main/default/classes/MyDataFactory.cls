@isTest
public class MyDataFactory {
    public static void insertTestPatient() {
        Patient__c pt = new Patient__c();
        pt.Name = 'Test Patient';
        pt.First_Name__c = 'Test First Name';
        pt.Date_Of_Birth__c = Date.today();
        insert pt;
    }

    public static void insertTestFormulary() {
        Formulary__c f = new Formulary__c();
        f.Name = 'Test Formulary';
        f.Inventory__c = 100;
        f.Type__c = 'Commercial';
        f.Backorder__c = false;
        insert f;
    }

    public static void insertTestPrescription() {
    }
}

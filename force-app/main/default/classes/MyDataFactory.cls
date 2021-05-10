@isTest
public class MyDataFactory {
    public static Patient__c insertTestPatient() {
        Patient__c pt = new Patient__c();
        pt.Name = 'Test Patient';
        pt.First_Name__c = 'Test First Name';
        pt.Date_Of_Birth__c = Date.today();
        insert pt;
        return pt;
    }

    public static List<Formulary__c> insertTestFormulary() {
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
        return fList;
    }

    public static void insertTestPrescription(Patient__c pt, List<Formulary> fList) {
        Prescription__c rx = new Prescription__c();
        rx.Patient__c = pt.id;
        rx.Product__c = fList[0].Id;
        rx.Quantity__c = 30;
        rx.Daily_Dose__c = 1;
        rx.Refills__c = 3;
        insert rx;
        return rx;
    }
}

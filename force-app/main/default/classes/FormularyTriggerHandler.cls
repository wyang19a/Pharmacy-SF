public class FormularyTriggerHandler {
    //firing on Formulary__c AFTER-UPDATE
    public static void handleBackorderedFormulary(List<Formulary__c> newList) {
        List<Patient__c> patientList = [SELECT Id FROM Patient__c WHERE Id IN (
            SELECT Patient__c FROM Prescription__c WHERE Product__c IN :newList)];
        List<Task> tList = new List<Task>();

        for(Formulary__c form : newList) {
            if(form.Backorder__c == true) {
                List<Patient__c> ptList = new List<Patient__c>();
                for(Patient__c pt : patientList) {
                    Task newTask = new Task();
                    newTask.OwnerId = UserInfo.getUserId();
                    newTask.Subject = 'Notify patient about the backorder on prescription';
                    newTask.Status = 'In Progress';
                    newTask.WhatId = pt.Id;
                    tList.add(newTask);
                }
            }
        }
        insert tList; 
    }
}

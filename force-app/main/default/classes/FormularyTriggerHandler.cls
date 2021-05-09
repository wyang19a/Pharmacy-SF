public class FormularyTriggerHandler {
    //firing on Formulary__c AFTER-UPDATE
    public static void handleBackorderedFormulary(List<Formulary__c> newList) {
        for(Formulary__c form : newList) {
            if(form.Backorder__c != true) {

                //TODO: refactor to pull in rx data to provide reference in Task.
                Patient__c[] patientList = [SELECT Id FROM Patient__c WHERE Id IN (
                    SELECT Patient__c FROM Prescription__c WHERE Product__c = :form.id
                    )];
                
                for(Patient__c patient : patientList) {
                    Task newTask = new Task();
                    newTask.OwnerId = UserInfo.getUserId();
                    newTask.Subject = 'Notify patient about the backorder on prescription';
                    newTask.Status = 'In Progress';
                    newTask.WhatId = patient.Id;

                    insert newTask; 
                }
            }
        }
    }
}

public class FormularyTriggerHandler {

    public static void handleBackorderedFormulary(List<Formulary__c> oldList) {
        for(Formulary__c form : oldList) {
            if(form.Backorder__c == true) {

                Patient__c[] patientList = [SELECT Id FROM Patient__c WHERE Id IN (
                    SELECT Patient__c FROM Prescription__c WHERE Product__c = :form.id
                    )];
                
                for(Patient__c patient : patientList) {
                    Task newTask = new Task();
                    newTask.OwnerId = UserInfo.getUserId();
                    newTask.Subject = 'Notify patient about the backorder on prescription';
                    newTask.Status = 'In Progress';
                    newTask.WhatId = patient.Id;
                }
            }
        }
    }
}

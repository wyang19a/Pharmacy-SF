public class FormularyTriggerHandler {
    //firing on Formulary__c AFTER-UPDATE
    public static void handleBackorderedFormulary(List<Formulary__c> newList) { //Formulary__c sObject has API Name Product__c... 
        List<Patient__c> patientList = [SELECT Id FROM Patient__c WHERE Id IN (
            SELECT Patient__c FROM Prescription__c WHERE Product__c IN :newList
            )];
            
        List<Task> tList = new List<Task>();
        for(Formulary__c form : newList) {
            if(form.Backorder__c == true) {
                for(Patient__c pt : patientList) {
                    Task newTask = new Task();
                    newTask.OwnerId = UserInfo.getUserId();
                    newTask.Subject = 'Notify patient about the backorder on prescription';
                    newTask.Status = 'In Progress';
                    newTask.WhatId = pt.Id;
                    newTask.Description = form.Name;
                    tList.add(newTask);
                }
            }
        }
        insert tList; 
    }

    public static void handleDeletedFormulary(List<Formulary__c> oldList) {
        List<Formulary_Archive__c> lArchive = new List<Formulary_Archive__c>();
        User userRecord = [SELECT Alias FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
        for(Formulary__c form : oldList) {
            Formulary_Archive__c newArc = new Formulary_Archive__c();
            newArc.Name = form.Formulary_Title__c;
            newArc.Deleted_By__c = userRecord.Name;
            newArc.Deleted_On__c = Date.today();
            lArchive.add(newArc);
        }
        System.debug(lArchive);
        insert lArchive;
    }
}
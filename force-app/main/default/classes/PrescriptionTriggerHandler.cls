public class PrescriptionTriggerHandler {

    public static void createReminderTaskAfterUpdate(List<Prescription__c> newList) {
        for(Prescription__c rx : newList) {
            if(rx.Refills__c <= 1) {
                Task newTask = new Task();
                newTask.OwnerId = UserInfo.getUserId();
                newTask.Subject = 'Notify patient';
                newTask.Status = 'In Progress';
                newTask.WhatId = rx.Id;
                insert newTask;
            }
        }
    }

}

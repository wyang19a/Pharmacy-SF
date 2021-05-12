public class PatientTriggerHandler {
    public static void handleNewPatients(List<Patient__c> newList) {
        for(Patient__c pt : newList) {
            pt.FullName__c = pt.First_Name__c + ' ' + pt.Name;
        }
    }
    public static void handlePatientsWithNoContact(List<Patient__c> newList) {
        Task[] tList = new Task[0];
        for(Patient__c pt : newList) {
            if(pt.Phone__c == NULL && pt.Email__c == NULL) {
                Task newTask = new Task();
                newTask.OwnerId = UserInfo.getUserId();
                newTask.Subject = 'Get patient contact info next visit';
                newTask.Status = 'In Progress';
                newTask.Priority = 'High';
                newTask.WhatId = pt.Id;
                tList.add(newTask);
            }
        }
        insert tList;
    }
}

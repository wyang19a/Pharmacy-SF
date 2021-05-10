trigger PrescriptionTrigger on Prescription__c (after update, before update, before insert) {
  if(Trigger.isAfter && Trigger.isUpdate) {
    PrescriptionTriggerHandler.createReminderTaskAfterUpdate(Trigger.New);
  }
}
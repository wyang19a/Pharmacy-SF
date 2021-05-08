trigger PrescriptionTrigger on Prescription__c (after update) {
  if(Trigger.isAfter && Trigger.isUpdate) {
    PrescriptionTriggerHandler.handleRxAfterUpdate(Trigger.New, Trigger.Old);
  }
}
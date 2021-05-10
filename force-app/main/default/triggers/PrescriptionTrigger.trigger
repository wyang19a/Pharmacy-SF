trigger PrescriptionTrigger on Prescription__c (before insert) {
  if(Trigger.isBefore && Trigger.isInsert) {
    PrescriptionTriggerHandler.blockDupeRx(Trigger.New);
  }
}
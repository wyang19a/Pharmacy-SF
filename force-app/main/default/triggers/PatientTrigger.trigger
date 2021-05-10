trigger PatientTrigger on Patient__c (before insert, before update, after insert) {
  if(Trigger.isBefore) {
    if (Trigger.isInsert) {
      PatientTriggerHandler.handleNewPatients(Trigger.new);
    }
    if (Trigger.isUpdate) {
      PatientTriggerHandler.handleNewPatients(Trigger.new);
    }
  }
  if(Trigger.isAfter && Trigger.isInsert) {
    PatientTriggerHandler.handlePatientsWithNoContact(Trigger.new);
  }
}
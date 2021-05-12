trigger PatientTrigger on Patient__c (before insert, before update, after insert) {
  if(Trigger.isBefore) {
    if (Trigger.isInsert || Trigger.isUpdate) {
      PatientTriggerHandler.handleNewPatients(Trigger.new);
    }
  }
  if(Trigger.isAfter && Trigger.isInsert) {
    PatientTriggerHandler.handlePatientsWithNoContact(Trigger.new);
  }
}
trigger FormularyTrigger on Formulary__c (after update, after delete) {
  if(Trigger.isAfter) {
    if(Trigger.isUpdate) {
      FormularyTriggerHandler.handleBackorderedFormulary(Trigger.New);
    }
    if(Trigger.isDelete) {
      FormularyTriggerHandler.handleDeletedFormulary(Trigger.Old);
    }
  }
}
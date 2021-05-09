trigger FormularyTrigger on Formulary__c (before update) {
  if(Trigger.isBefore) {
    if(Trigger.isUpdate) {
      FormularyTriggerHandler.handleBackorderedFormulary(Trigger.Old);
    }
  }
}
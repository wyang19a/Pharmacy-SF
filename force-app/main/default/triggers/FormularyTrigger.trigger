trigger FormularyTrigger on Formulary__c (after update) {
  if(Trigger.isAfter) {
    if(Trigger.isUpdate) {
        FormularyTriggerHandler.handleBackorderedFormulary(Trigger.New);
    }
  }
}
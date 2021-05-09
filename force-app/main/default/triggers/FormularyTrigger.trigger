trigger FormularyTrigger on Formulary__c (after update) {
  if(Trigger.isAfter && Trigger.isUpdate) {
      FormularyTriggerHandler.handleBackorderedFormulary(Trigger.New);
    
  }
}
trigger FormularyTrigger on Formulary__c (before insert, before update) {
  if(Trigger.isBefore) {
    if(Trigger.isInsert) {

    }
    if(Trigger.isUpdate) {
      
    }
  }
}
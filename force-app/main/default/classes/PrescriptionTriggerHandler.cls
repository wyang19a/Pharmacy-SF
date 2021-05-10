public class PrescriptionTriggerHandler {

    public static void createReminderTaskAfterUpdate(List<Prescription__c> newList) {
        for(Prescription__c rx : newList) {
            if(rx.Refills__c <= 1) {
            }
        }
    }

}
 
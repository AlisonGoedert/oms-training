public class LeadProcessor implements
Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID, Name FROM Lead');
    }
    public void execute(Database.BatchableContext bc, List<Lead> leads){
        // process each batch of records
        for (Lead lead : leads) {
            lead.leadSource = 'Dreamforce';
        }
        update leads;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('records processed. Shazam!');
    }
}
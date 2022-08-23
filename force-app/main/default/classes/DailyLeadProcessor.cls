public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx){
        List<Lead> leads = [SELECT Id, LeadSource
            FROM Lead
			WHERE LeadSource = null
            LIMIT 200];
        // process each batch of records
        for (Lead lead : leads) {
            lead.leadSource = 'Dreamforce';
        }
        update leads;
    }
}
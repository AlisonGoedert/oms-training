@isTest
public class DailyLeadProcessorTest {
    
    private static String CRON_EXP = '0 0 0 ? * *';

    @isTest
    private static void testScheduleClass() {
        List<Lead> leads = new List<Lead>();
        for(Integer i =0; i<500; i++) {
             if (i<250) {
                leads.add(new Lead(LastName='Connock', Company='Salesforce'));
            } else {
                leads.add(new Lead(LastName='Connock', Company='Salesforce', LeadSource='Other'));
            }
        }
        insert leads;
        
        Test.startTest();
        DailyLeadProcessor dlp = new DailyLeadProcessor();
        Id jobId = System.schedule('Process leads', CRON_EXP, dlp);
        Test.stopTest();
        
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'ERROR: at least ....');
        
        List<CronTrigger> cts = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
        System.debug('Next Fire time ' + cts[0].NextFireTime);
    }
    
}
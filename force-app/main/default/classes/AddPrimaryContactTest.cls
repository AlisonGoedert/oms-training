@isTest
public class AddPrimaryContactTest {

    @isTest
    private static void testQueuableClass(){
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i< 500; i++) {
            Account account = new Account(Name='Test Account' + i);
            if (i<250) {
                account.BillingState = 'NY';
            } else {
                account.BillingState = 'CA';
            }
            accounts.add(account);
        }
        insert accounts;
        
        Contact contact = new Contact(FirstName='Simon', LastName='Connock');
        insert contact;
        
        Test.startTest();
        
   		Id jobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

		List<Contact> contacts = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
		System.assertEquals(200, contacts.size(), 'ERROR...');       
    }
    
}
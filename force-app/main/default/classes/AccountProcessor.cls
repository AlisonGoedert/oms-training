public class AccountProcessor {
    @future(callout=true)
    public static void countContacts(List<String> accountIds) {
        List<Account> accounts =  [SELECT ID,Name, (SELECT ID FROM Contacts)
                           FROM Account
                           WHERE Id IN :accountIds];
        for (Account acc : accounts) {
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        update accounts;
        
    }
}
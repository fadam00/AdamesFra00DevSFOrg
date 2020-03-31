@isTest
private class ContactsCallableTest {
	
    static testMethod void testAccountandContact () {
        
        Account a = new Account();
        a.Name = 'TestyAccounty';
        
        insert a;
      
        Contact c = new Contact ();
        c.FirstName = 'Stephen';
        c.LastName = 'Curry';
        c.Phone = '7876667676';
        c.AccountId = a.Id;
        
        insert c;
        
        Contact c2 = new Contact ();
        c2.FirstName = 'Steven';
        c2.LastName = 'Cursy';
        c2.Phone = null;
        c2.AccountId = a.Id;
        
        insert c2;
        
         List<Account> callablecontacts = [SELECT Id, Name FROM Account WHERE Callable_Contacts__c >= 1];
        
        System.assertEquals(1, callablecontacts.size());
    }
    
}
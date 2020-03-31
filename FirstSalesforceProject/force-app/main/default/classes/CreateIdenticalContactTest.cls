@isTest
private class CreateIdenticalContactTest {

    @isTest static void createContactsTest()
    {
        Account a = new Account(Name='TestingforVictory');
        insert a;
        
      	String accId = a.Id;
        
        List<Contact> contList= [SELECT AccountID FROM Contact WHERE AccountID =:accId];
        
        System.debug(contList);
        
        System.assert(contList != null, 'It\'s null');
    }
}
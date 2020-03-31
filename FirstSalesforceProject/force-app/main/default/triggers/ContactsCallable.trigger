trigger ContactsCallable on Contact (after insert, after update, after delete) {
    
   Integer numOfCallableContacts;
    
   
    if(trigger.isUpdate || trigger.isInsert){
    
    for (Contact c:Trigger.new)
    
    {
        List<Contact> callContacts = [SELECT Name, Account.Name
                         FROM Contact 
                         WHERE (AccountId = :c.AccountId AND Phone != NULL)];
       
        Integer numOfCallableContacts = callContacts.size();
        
        Account a = callContacts[0].Account;
        
        a.Callable_Contacts__c = numOfCallableContacts; 
        
        update a;
    }
       
   }
    
    if(trigger.isDelete){
        
        for(Contact c: Trigger.old)
        
        {
            List<Contact> callContacts = [SELECT Name, Account.Name
                         FROM Contact 
                         WHERE (AccountId = :c.AccountId AND Phone != NULL)];
       
            Integer numOfCallableContacts = callContacts.size();
            
            Account a = callContacts[0].Account;
        
            a.Callable_Contacts__c = numOfCallableContacts; 
            
            update a;
        }
    }
       
    
 
    
}
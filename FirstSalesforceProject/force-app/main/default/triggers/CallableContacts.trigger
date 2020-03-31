trigger CallableContacts on Account (before insert, before update) {
    for (Account account:Trigger.new){  
        //Query to pull contacts from account that have a phone number
        List<Contact> callablecontacts = [SELECT Name,Id 
                                          FROM Contact 
                                          WHERE (Account.id = :account.Id) AND (Phone != null)];
        
        Integer numOfCallContact = callablecontacts.size();
        account.Callable_Contacts__c = numOfCallContact;
        System.debug('The Number of Callable Contacts is ' + account.Callable_Contacts__c);
        
    }
}
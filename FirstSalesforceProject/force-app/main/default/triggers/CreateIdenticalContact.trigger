trigger CreateIdenticalContact on Account (after insert) { //After insert instead of before, because assignment of Account ID in loop. ID only shows after account is created.

    List<Contact> contacts = new List<Contact>();
    
    for(Account a: Trigger.new)
        
    {
        
        Contact c1 = new Contact();
        c1.LastName = 'ThisAccountiskely';
        c1.AccountID = a.Id;
        
        Contact c2 = new Contact();
        c2.LastName = 'Hellnoitaint';
        c2.AccountId = a.Id;
        
        
        contacts.add(c1);
        contacts.add(c2);
      
     
    }
    
    insert contacts;
}
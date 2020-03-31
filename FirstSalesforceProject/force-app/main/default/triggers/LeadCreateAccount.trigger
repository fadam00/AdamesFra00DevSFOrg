trigger LeadCreateAccount on Lead (before insert) {
    
    List<Account> acctList = new List<Account>(); //Create List to store
    
    for(Lead l: Trigger.New){
        Account a = new Account(Name= l.Company);
        acctList.add(a);
    }
    
    insert acctList;
    System.debug('Account Inserted');
}
trigger CreateOppforAcc on Account (after insert) {
    
List<Opportunity> oppforAcc = new List<Opportunity>();
    
    for (Account acc: Trigger.New)
    {
        
        If (acc.NumberOfEmployees > 99)
        {
            Date today = Date.today();
            for (Integer i = 0; i < 10; i++)
            {
                Opportunity opp = new Opportunity();
                opp.AccountId = acc.Id;
                opp.Name = ('Opportunity' + i);
                opp.Amount = 1000;
                opp.Type = 'New Customer';
                opp.StageName = 'Prospecting';
                opp.CloseDate = today;
                
                oppforAcc.add(opp);
                
                System.debug(opp.Name + 'has been created');               
            }
            
        } else 
        
        {
            System.debug('Nothing happened, meng');
        }
    }
    
    System.debug(oppforAcc);
    insert oppforAcc;
}
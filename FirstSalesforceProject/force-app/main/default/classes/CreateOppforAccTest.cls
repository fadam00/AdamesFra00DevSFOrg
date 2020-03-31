@isTest
private class CreateOppforAccTest {

    @isTest static void create10Oppsfor99EmpAcc()
    
    {
        Account acc = new Account();
        acc.Name = 'TestAccforOpps99';
        acc.NumberOfEmployees = 100;
        
        insert acc;
        
        String accountId = acc.Id;
        
        List<Opportunity> oppForAcc= [SELECT Id FROM Opportunity WHERE AccountId =: accountId];
        
        Integer eleInOppList = oppForAcc.size();
        
        System.assertEquals(10, eleInOppList);
    }
    
     @isTest static void createNoOppsforAccWithNo99Emps()
    
    {
        Account acc = new Account();
        acc.Name = 'TestAccforOpps98';
        acc.NumberOfEmployees = 98;
        
        insert acc;
        
        String accountId = acc.Id;
        
        List<Opportunity> oppForAcc= [SELECT Id FROM Opportunity WHERE AccountId =: accountId];
        
        Integer eleInOppList = oppForAcc.size();
        
        System.assertEquals(0, eleInOppList);
    }
}
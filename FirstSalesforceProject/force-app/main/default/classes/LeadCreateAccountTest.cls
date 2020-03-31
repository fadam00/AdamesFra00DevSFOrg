@isTest
private class LeadCreateAccountTest {

    @isTest static void CheckAccount(){
        Lead testLead = new Lead(); //Create lead to execute trigger
        
        testLead.LastName = 'Adams';
        testLead.Company = 'AdamsFamily';
        
        insert testLead; //Insertion executes trigger to create Account with Company's name.
        
        String coName = testLead.Company; //Store Company name to test
        
        Account a = [SELECT Name FROM Account WHERE Name = :coName]; //Fetch Account with Company name
        String aName = a.Name; //Store results of query in variable
        
        System.assertEquals(aName,coName); //Company lead company name with account company name
        
        System.debug (a); //Show results fetched from query
    }
}
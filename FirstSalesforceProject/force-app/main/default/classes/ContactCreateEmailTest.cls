@isTest
private class ContactCreateEmailTest {

    @isTest static void assignEmail()
        
    { 
        Contact c = new Contact(LastName='Adamus'); 
        insert c;
        
        Contact cont = [SELECT Email FROM Contact WHERE LastName='Adamus']; //Fetch Email of Contact just created
        
        String cEmail = cont.Email; //Store email in variable
        
        System.assertEquals('hello@world.com', cEmail); //Compare result in variable to expected result.
    }
}
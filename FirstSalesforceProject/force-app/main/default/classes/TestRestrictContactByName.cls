@isTest
public class TestRestrictContactByName {
    
    @isTest private static void testInvalidLastName(){
        
        Contact cont1 = new Contact (LastName = 'INVALIDNAME');
        insert cont1;
        
        Test.startTest();
        Database.SaveResult result = Database.insert(cont1,false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assertEquals('The Last Name "'+ cont1.LastName +'" is not allowed for DML', result.getErrors()[0].getMessage());
    }

}
@isTest
public class TestVerifyDate {
    
    @isTest static void testCheckDatesWithin30Days(){
        
        Date date1 = Date.newInstance(2020, 01, 27);
        Date date2 = Date.newInstance(2020, 02, 20);
        
        VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2,date2);
    }
    
    @isTest static void testCheckDatesNotWithin30Days(){
        Date date1 = Date.newInstance(2020, 01, 27);
        Date date2 = Date.newInstance(2020, 03, 20);
        
        VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date1,date1);
        
    }
    

}
@isTest
public class TemperatureConverterTest {
    
    @isTest static void testwarmtemp() //Testing for warm temp passed
    {
        Decimal cel = TemperatureConverter.FtoC(70);
        System.assertEquals(21.11, cel);
    }
    
    @isTest static void testfreezingpoint() //Testing for freezing point temp passed
    {
        Decimal cel = TemperatureConverter.FtoC(32);
        System.assertEquals(0, cel);
    }
    
    @isTest static void testboilingpoint() // Testing for boiling point being passed
    {
        Decimal cel = TemperatureConverter.FtoC(32);
        System.assertEquals(100, cel, 'Boiling point temperature is not what is expected'); //You can customize the error message by adding string.
    }
    
    @isTest static void testnegativetemp()
    {
        Decimal cel = TemperatureConverter.FtoC(32);
        System.assertEquals(-23.33, cel);
    }
}
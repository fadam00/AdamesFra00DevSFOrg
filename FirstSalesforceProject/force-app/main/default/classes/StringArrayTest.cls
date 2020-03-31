public class StringArrayTest {

    public static List<String> generateStringArray (Integer n)
        
    {
        String[] test = new List<String>();
        
        for(Integer i = 0; i < n; i++){
            
            test.add('Test ' + i);
        } 
        
        return test;
                
    }
    
}
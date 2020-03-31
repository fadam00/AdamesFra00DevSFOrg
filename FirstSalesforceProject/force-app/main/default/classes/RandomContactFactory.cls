public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numConts, String fname){
        
        List<Contact> conts = new List<Contact>();
        
            for(Integer i=0;i<numConts;i++) {
            Contact c = new Contact(LastName='LastNameContact' + i, FirstName = fname + i);
            conts.add(c);
        
    }
        
      
        
        return conts;

}
}
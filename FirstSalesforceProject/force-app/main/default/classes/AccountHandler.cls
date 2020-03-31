public class AccountHandler {
    
    public static Account insertNewAccount (String name){
        
        Account a = new Account ();
        a.Name = name;
        
        try {
            
            insert a;
 
        } catch (DmlException e){
            
            return NULL;
        }
        
        return a;
        
    }
    

}
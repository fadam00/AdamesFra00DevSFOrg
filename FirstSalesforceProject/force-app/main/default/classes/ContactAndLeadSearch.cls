public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads (String s){
        
        List<List<sObject>> searchList = [FIND :s IN ALL FIELDS
                                         RETURNING Lead(FirstName, LastName), Contact(FirstName, LastName)];
            
         return searchList;
    }
}
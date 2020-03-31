public class ContactSearch {

    public static List<Contact> searchForContacts (String lastName, String postalCode){
        
        Contact[] contactList = [SELECT ID, Name 
                                 FROM Contact 
                                 WHERE LastName = :lastName AND MailingPostalCode = :postalCode];
        
        return contactList;
        
    }
}
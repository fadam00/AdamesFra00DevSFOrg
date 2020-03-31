//Example of Batch Apex
//After implementing the Database.Batchable class you must implement the start, execute, and finish methods.
global class UpdateContactAddInfo implements Database.Batchable<sObject> 

{
    //Start method -- Gathers the records for the batch Apex job.
    //Done through Queries.
	global Database.QueryLocator start(Database.BatchableContext bc)
    {//Using String Query, the query below is fetching all accounts, the associated contacts, of which state is TX
        return Database.getQueryLocator
            (
            'SELECT Id,BillingStreet,BillingCity,BillingState, '+
                'BillingPostalCode,'+
                '(SELECT Id, MailingStreet,MailingCity, '+
                'MailingState, MailingPostalCode FROM Contacts) FROM Account ' +
				'where BillingState=\'TX\''
            ); //Test query above (not in string form) in the Query editor to make sure it pulls up desired records.
    }
    //Once the records are fetched from the Start method then they're passed to the Execute method
    //Takes two parameters, 1) the batchable context 'bc' and the records from the Start method
  	//Then goes over the 'scope' method which simply goes over all of the records and executes code
    global void execute(Database.BatchableContext bc, List<Account> scope) //scope contains all of the records, we create an Account list to contain the records
    {
        List<Contact> contacts= new List<Contact>(); //Create a list to store the contacts
        for(Account acc:scope) //iterating over the account records and storing them in the acc variable for each loop round
        {
            //along with iterating over the accounts, it iterates over each contact for the iterated account (in the acc variable)
            //and stores each contact within the iterating account in the contact variable.
           
            for(Contact contact:acc.contacts) //<sObject> [variable][: -- meaning iterate over][sObject]
                //The above loop means that it is storing ever contact found in the account in the contact variable
            {
                contact.MailingStreet = acc.BillingStreet;
                contact.MailingCity = acc.BillingCity;
                contact.MailingState = acc.BillingState;
                contact.MailingPostalCode = acc.BillingPostalCode;
                contacts.add(contact); //Updates the information above and adds it to the Contacts list created above
                
                
            }
            
        }
        //DML operation for Salesforce
        update contacts;
    }
    global void finish(Database.BatchableContext bc)
    {
        
    }
}
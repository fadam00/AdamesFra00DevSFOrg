public class AcctUtility {
	public static void mainProcessing()
    {
        try{
        insertAccount();
        } catch (AccountException ae){
            system.debug('Message: ' +ae.getMessage());
        }
    }
    
    public static void insertAccount()
    {
        try{
        Account a=new Account();
        insert a;
        }
        catch(DMLException e){
            throw new AccountException('Account cannot be created because the required field Name is missing', e);
        }
    }
}
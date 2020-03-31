//Apex Transaction Example
public class ApexTransactionEx {
    public static void insertLeadandAcc (String accName, String leadName, String leadCompany)
    {//This is the transaction - multiple DML in one unit
        Account a = new Account(Name=accName);
        insert a;
        Lead l= new Lead(LastName=leadName, Company=leadCompany); //Transaction will be rolled back because of the validation rule in Leads object
        insert l;
        Lead l2= new Lead(LastName=leadName, Company='SemadaStudios');
        insert l2;
    }
}
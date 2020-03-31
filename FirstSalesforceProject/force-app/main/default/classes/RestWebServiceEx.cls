@RestResource(urlMapping='/Account/*') //Add the REST Annotation first for URLMapping it exposes the class if the url mapped shows

global with sharing class RestWebServiceEx {

@httpget //Used to retrieve information on record
    global static Account getAccountById(){
        RestRequest request=RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Account result= [Select AccountNumber,Name,BillingState FROm Account where Id=:accountId];
        return result;
    }
    
@httpPost //Used to create new record
    global static Id createAccount(String name)
    {
        Account thisAccount= new Account(Name=name);
        insert thisAccount;
        return thisAccount.Id;
    }
    
@httpDelete
    global static void deleteAccount()
    {
         RestRequest request=RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Account thisAccount = [Select Id from Account where Id=:accountId];
        delete thisAccount;
    }
    
@httpPut //Used for update or insert (upsert) operations. We pass ID below as a parameter to determine if it's going to be an insert or an update operation.
    global static ID upsertAccount(String name, String Id)
    {
        Account thisAccount= new Account(Id=id,Name=name); //If the ID isn't present it will create one, otherwise when the ID parameter is passed it will update given the other parameters.
        upsert thisAccount;
        return thisAccount.id;
    }
    
@httpPatch //Used for "patching" or updating.
    global static ID updateAccountFields()
    {
        RestRequest request=RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
       Account thisAccount=[Select Id from Account Where Id=:accountId];
        Map<String,Object> params=(Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
        for(String fieldName:params.keySet())
        {
            thisAccount.put(fieldName,params.get(fieldName));
        }
        update thisAccount;
        return thisAccount.Id;
    }
}
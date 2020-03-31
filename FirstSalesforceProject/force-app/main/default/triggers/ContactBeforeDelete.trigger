trigger ContactBeforeDelete on Contact (before delete) {

    for (Contact c:Trigger.Old){
        if(c.AccountID==null)
        {
            c.addError('You are not authorized to delete this contact!');
        }
    }

}
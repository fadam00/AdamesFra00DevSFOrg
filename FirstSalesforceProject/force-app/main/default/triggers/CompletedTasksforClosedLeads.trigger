trigger CompletedTasksforClosedLeads on Lead (after update) {
    
    //Set Task to complete only when associated Lead's status is set to Closed - Converted or Closed - Not Converted
    Task[] tasksToUpdate = new List<Task>();
    
    for(Lead l : Trigger.new){
        
        //Access the "old" record by its ID in Trigger.oldMap
        Lead oldLead = Trigger.oldMap.get(l.Id);
        
        //Compare the "old" status vs. the "new" status to see if the status has changed.
      	
        Boolean oldLeadIsCon = oldLead.Status.contains('Closed');
        Boolean newLeadIsCon = l.Status.contains('Closed');
        
        
       	//Check that the field was changed to the correct value
        If (!oldLeadIsCon && newLeadIsCon)
        {
            for(Task t : [SELECT Id, Status FROM Task WHERE WhoId = :l.Id])
            
            {
                
                t.status = 'Completed';
                tasksToUpdate.add(t);
                
            }
            
            
            
            update tasksToUpdate;
            
        }
        
        //Gather Lead Owner Emails
        Lead[] leadOwnerEmails  = [SELECT Id, Owner.Email FROM Lead WHERE Id IN :Trigger.new];
        
        for(Lead lead : leadOwnerEmails)
        
        {
         
        String ownerEmail = lead.Owner.Email;
        //Call sendMail Method from EmailManager Class to send email.
        EmailManager.sendMail(ownerEmail, 'Task Status Change Due to Lead', 'Your Task has automatically been set to complete!');
            
        }
        
    }
    
    
    
}
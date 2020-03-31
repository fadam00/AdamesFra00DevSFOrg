trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    
   List<Task> tasksToAdd = new List<Task> ();
    
    for(Opportunity opp : Trigger.new)
    {
        if (opp.stagename == 'Closed Won' ) {
            
            Task t = new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id);
            tasksToAdd.add(t);
            
        }
    }
    
    insert tasksToAdd;
    

}
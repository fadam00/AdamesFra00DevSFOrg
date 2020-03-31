trigger LeadKeyFieldsPopulated on Lead (before insert) {
    
    List<Integer> keysPopulated = new List<Integer>();
    List<Task> tskList = new List<Task>();
   
    for (Lead l:Trigger.new) {
        
    
        String a = l.FirstName;
        
    
        if (l.FirstName != null)
        {
            keysPopulated.add(1);
            Task tskFirstName = new Task();
            tskFirstName.Subject = 'Verify the FirstName field';
            tskList.add(tskFirstName);
            
            
        } 
        
        if (l.LastName != null)
        {
            keysPopulated.add(2);
            Task tskLastName = new Task();
            tskLastName.Subject = 'Verify the LastName field';
            tskList.add(tskLastName);

        } 
        
        
        if (l.Email != null)
        {
            keysPopulated.add(3);
            Task tskEmail = new Task();
            tskEmail.Subject = 'Verify the Email field';
            tskList.add(tskEmail);
          
        }
        
        if (l.Phone != null)
        {
            keysPopulated.add(4);
            Task tskPhone = new Task();
            tskPhone.Subject = 'Verify the Phone field';
            tskList.add(tskPhone);
           

        }
        
        if (l.Website != null)
        {
            keysPopulated.add(5);
            Task tskWebsite = new Task();
            tskWebsite.Subject = 'Verify the Website field';
            tskList.add(tskWebsite);
           

        }
        
        if (l.Title != null)
        {
            keysPopulated.add(6);
            Task tskTitle = new Task();
            tskTitle.Subject = 'Verify the Title field';
            tskList.add(tskTitle);
          
        } 
        
        Integer numOfFieldsPop = keysPopulated.size();
        l.Key_Fields_Populated2__c= numOfFieldsPop;
        system.debug(a);
        
        
    }
      
        
        insert tskList;

}
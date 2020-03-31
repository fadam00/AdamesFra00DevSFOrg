trigger LeadKeyFieldsPopulated2 on Lead (before insert) {
    
    for( Lead l: Trigger.new)
    
        if(l.Bypass_Triggers__c == TRUE){  
        
         {
       
        //Variables
        
        String ln = 'LastName';
        String fn = 'FirstName';
        String em = 'Email';
        String tl = 'Title';
        String ph = 'Phone';
        String we = 'Website';
        
        //Lists
        
        //List containing all key fields to test for null values
        List<String> keyFields= new List<String>();
        
        //List containing all key fields that are not null
        List<String> keyFieldsPop = new List<String>();
        
        //List containing tasks to be created if Key_Fields_Populated2__c field is more than 3
        List<Task> tskList = new List<Task>();
        
        //List of field labels for the WARNING task
        List<String> tskDesc = new List<String>();
        
        keyFields.add(l.LastName);
        keyFields.add(l.FirstName);
        keyFields.add(l.Email);
        keyFields.add(l.Phone);
        keyFields.add(l.Website);
        keyFields.add(l.Title);
        
        
        
        for (String i:keyFields){
            if (i != null){
                
                keyFieldsPop.add(i);
            }
           
            
        }
        
       //Set value to Key Fields Populated Lead Field
        Integer keyFieldsPopField = keyFieldsPop.size();
        l.Key_Fields_Populated2__c = keyFieldsPopField;
        
        
        //Create Tasks to verify each field if more than 3 key fields populated
        if (keyFieldsPopField > 3 ){
           
            if(l.LastName != null){
                
                Task tsk1 = new Task(Subject='Verify the Last Name field');
                tskList.add(tsk1);
                
                if(l.LastName.containsIgnoreCase('test') == TRUE){
                    
                    tskDesc.add(ln);
                    
                }
            }
            
            if(l.FirstName != null){
                
                Task tsk2 = new Task(Subject='Verify the First Name field');
                tskList.add(tsk2);
                
                if(l.FirstName.containsIgnoreCase('test') == TRUE){
                    
                    tskDesc.add(fn);
                    
                }
            }
                
                if(l.Email != null){
                
                Task tsk3 = new Task(Subject='Verify the Email field');
                tskList.add(tsk3);
                    
                    if(l.Email.containsIgnoreCase('test') == TRUE){
                    
                    tskDesc.add(em);
                    
                }
            }
              
                if(l.Phone != null){
                
                Task tsk4 = new Task(Subject='Verify the Phone field');
                tskList.add(tsk4);
                    
                    if(l.Phone.containsIgnoreCase('test') == TRUE){
                    
                    tskDesc.add(ph);
                    
                }
            }
            
            if(l.Website != null){
                
                Task tsk5 = new Task(Subject='Verify the Website field');
                tskList.add(tsk5);
                
                if(l.Website.containsIgnoreCase('test') == TRUE){
                    
                    tskDesc.add(we);
                    
                }
            }
            
            if(l.Title != null){
                
                Task tsk6 = new Task(Subject='Verify the Title field');
                tskList.add(tsk6);
                
                if(l.Title.containsIgnoreCase('test') == TRUE){
                    
                    tskDesc.add(tl);
                    
                }
            }
            
        }
        
        String separator = ', ';
        String d = String.join(tskDesc, separator);
        
        if(tskDesc.isEmpty()== FALSE){
            
            Task warning = new Task(Subject='WARNING', Description='This Lead contains the TEST keyword in the following key fields: '+d);
            insert warning;
        }
        
        insert tskList;
        
        System.debug(keyFields);
        System.debug(keyFieldsPop);
        System.debug(tskList);
        System.debug(tskDesc);
        
    }
            
        }
}
public class NewCaseListController {
    private String statusOption = 'New';
    public List<Case> getNewCases() {
        
        List<Case> results = Database.query(
            'SELECT ID, CaseNumber ' +
            'FROM Case ' + 
            'WHERE Status = '+ '\'' + statusOption+ '\'' + 
            ' LIMIT 10'
        
        );
        
         return results;
    }
    
 

}
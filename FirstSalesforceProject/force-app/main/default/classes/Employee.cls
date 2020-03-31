public class Employee {
    
    public string name; //object attribute
    public string designation; //object attribute
    
    public void show() //class method
    {
        System.debug('Name of employee '+name);
        System.debug('Designation of employee ' +designation);
    }

}
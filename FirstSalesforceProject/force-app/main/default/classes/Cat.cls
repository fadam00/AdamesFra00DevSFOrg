public class Cat {
	private string name;
    private integer size;
    
    //Constructor to initialize the instance variables
    //Allows for story variables while creating object
    //Cat c1= new Cat('Maurin', 13);
    public Cat(String n, Integer s){
        name=n;
        size=s;
    }
    
    //Object Method to Set value to variable (control and validation);
    public void setName(string n)
    {
        name=n;
    }
    
    public void setSize(integer s)
    {
        if(s<=0){
          System.debug('0 is not a valid size. Try again.');  
        }
        
        else
        {
            size=s;
        }
    }
    
    public void display()
    {
        System.debug('Name of my cat is: '+name);
        System.debug('Size of my cat is: ' +size);
    }
}
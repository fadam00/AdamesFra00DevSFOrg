public class Truck extends Vehicle

{ 
    
    private string model;

    public Truck(string m)
    {
        model=m;
    }
    
    public void typeOfTruck()
    {
        System.debug('This is a ' +model+ ' truck!');
    }
    
    public override void speed()
    {
        System.debug('Speed of the ' +model+ ' truck is 50mph!');
    }
}
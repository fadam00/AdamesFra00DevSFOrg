public virtual class Vehicle 
{

    public void model()
    {
        System.debug('Model method of Vehicle class');
    }
    
    
    public virtual void speed()
    {
        System.debug('Speed of the vehicle depends on the type of the vehicle');
    }
}
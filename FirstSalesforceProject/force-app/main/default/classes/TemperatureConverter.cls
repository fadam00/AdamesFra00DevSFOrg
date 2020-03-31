public class TemperatureConverter 
{
	public static Decimal FtoC(Decimal fh)
    {
        Decimal cel = ((fh-32)*5)/9;
        return cel.setScale(2);
    }
}
@isTest
public class TaskUtilityTest 

{
	@isTest static void testTaskPriority()
    {
        String priority = TaskUtility.getTaskPriority('AU');
        System.assertEquals('Normal', priority);
    }
    
    @isTest static void testTaskPriorityHigh()
    {
        String priority = TaskUtility.getTaskPriority('US');
        System.assertEquals('High', priority);
    }
    @isTest static void testPriorityInvalid()
    {
        String priority = TaskUtility.getTaskPriority('India');
        System.assertEquals(null, priority);
    }
}
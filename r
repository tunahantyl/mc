import java.util.*;

class Resource
{
	private Stack<Integer> stack;
	private final int MAX = 5;
	private Random random;
			
	public Resource(int startLevel)
	{
		stack = new Stack<Integer>();
		random = new Random();
	}
	
	public int getLevel()
	{
		return stack.size();
	}
	
	public synchronized void addOne()
	{dfgdfgdfgd
		try
		{
			while (stack.size() >= MAX)
			{
				System.out.println("STACK IS FULL");
				wait();
			}
			
			int newItem = random.nextInt(100); // Generate random number between 0-99
			stack.push(newItem);
			System.out.println("PUSHED ITEM = " + newItem);
			
			notifyAll();
		}
		catch (InterruptedException interruptEx)
		{
			System.out.println(interruptEx);
		}
	}
	
	public synchronized int takeOne()
	{
		try
		{
			while (stack.isEmpty())
			{
				System.out.println("STACK IS EMPTY");
				wait();
			}
			
			int item = stack.pop();
			System.out.println("POPED ITEM = " + item);
			
			notify();
			return item;
		}
		catch (InterruptedException interruptEx)
		{
			System.out.println(interruptEx);
			return -1;
		}
	}
}

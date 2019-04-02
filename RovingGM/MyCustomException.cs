using System;

namespace RovingGM
{
	/// <summary>
	/// Summary description for MyCustomException.
	/// </summary>
	public class MyCustomException:
		System.ApplicationException
	{
		public MyCustomException (string message):
			base(message)
		{
		}
	}
}

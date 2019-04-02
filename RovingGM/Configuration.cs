using System;
using System.Xml;
using System.Configuration;
using System.Collections.Specialized;
using System.Diagnostics;

namespace RovingGM
{
	/// <summary>
	/// Summary description for Configuration.
	/// </summary>
	public class Configuration
	{
		public const string DB_CONN_STR="DSN";

		private static TraceSwitch g_traceSwitch=null;


		public static string GetValue(string p_key)
		{
			NameValueCollection settings=
				ConfigurationManager.AppSettings;
			
			return settings.Get(p_key);	
		}

		public static TraceSwitch TestContactTraceSwitch
		{
			get
			{
				if (g_traceSwitch==null)
				{
					g_traceSwitch=new TraceSwitch(
						"TestContactTraceSwitch", 
						"TestContact Trace Messages");
				}

				return g_traceSwitch;
			}
		}
	}
}

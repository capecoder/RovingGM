using System;

namespace RovingGM
{
	/// <summary>
	/// Summary description for SessionWrapper.
	/// </summary>
	public class SessionWrapper
	{
		private System.Web.HttpContext m_context;

		public SessionWrapper()
		{
			m_context = System.Web.HttpContext.Current;
		}

		public string UserEmail 
		{
			set 
			{
				m_context.Session["UserEmail"] = value;
			} 
			get 
			{
				if (m_context.Session["UserEmail"] == null) 
				{
					return "";
				} 
				else 
				{
					return (string)m_context.Session["UserEmail"];
				}
			}
		}
		
		public int UserID 
		{
			set 
			{
				m_context.Session["UserID"] = value;
			} 
			get 
			{
				if (m_context.Session["UserID"] == null) 
				{
					return -1;
				} 
				else 
				{
					return (int)m_context.Session["UserID"];
				}
			}
		}

        public int ManagerID
        {
            set
            {
                m_context.Session["ManagerID"] = value;
            }
            get
            {
                if (m_context.Session["ManagerID"] == null)
                {
                    return -1;
                }
                else
                {
                    return (int)m_context.Session["ManagerID"];
                }
            }
        }

        public int StoreID
        {
            set
            {
                m_context.Session["StoreID"] = value;
            }
            get
            {
                if (m_context.Session["StoreID"] == null)
                {
                    return -1;
                }
                else
                {
                    return (int)m_context.Session["StoreID"];
                }
            }
        }

        public int VisitID
        {
            set
            {
                m_context.Session["VisitID"] = value;
            }
            get
            {
                if (m_context.Session["VisitID"] == null)
                {
                    return -1;
                }
                else
                {
                    return (int)m_context.Session["VisitID"];
                }
            }
        }

        public int SecurityLevel
        {
			set 
			{
				m_context.Session["SecurityLevel"] = value;
			} 
			get 
			{
				if (m_context.Session["SecurityLevel"] == null) 
				{
					return -1;
				} 
				else 
				{
					return (int)m_context.Session["SecurityLevel"];
				}
			}
		}

		public string RedirectPage 
		{
			set 
			{
				m_context.Session["RedirectPage"] = value;
			} 
			get 
			{
				if (m_context.Session["RedirectPage"] == null) 
				{
					return "";
				} 
				else 
				{
					return (string)m_context.Session["RedirectPage"];
				}
			}
		}

		public string userName 
		{
			set 
			{
				m_context.Session["userName"] = value;
			} 
			get 
			{
				if (m_context.Session["userName"] == null) 
				{
					return "";
				} 
				else 
				{
					return (string)m_context.Session["userName"];
				}
			}
		}

		public string redirectMsg 
		{
			set 
			{
				m_context.Session["redirectMsg"] = value;
			} 
			get 
			{
				if (m_context.Session["redirectMsg"] == null) 
				{
					return "";
				} 
				else 
				{
					return (string)m_context.Session["redirectMsg"];
				}
			}
		}

        public string arrivalTime
        {
            set
            {
                m_context.Session["arrivalTime"] = value;
            }
            get
            {
                if (m_context.Session["arrivalTime"] == null)
                {
                    return "";
                }
                else
                {
                    return (string)m_context.Session["arrivalTime"];
                }
            }
            }

        public string departureTime
        {
            set
            {
                m_context.Session["departureTime"] = value;
            }
            get
            {
                if (m_context.Session["departureTime"] == null)
                {
                    return "";
                }
                else
                {
                    return (string)m_context.Session["departureTime"];
                }
            }
        }

        public string visitDate
        {
            set
            {
                m_context.Session["visitDate"] = value;
            }
            get
            {
                if (m_context.Session["visitDate"] == null)
                {
                    return "";
                }
                else
                {
                    return (string)m_context.Session["visitDate"];
                }
            }
        }
    }
}

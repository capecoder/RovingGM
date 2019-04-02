using System;
using System.Configuration;
using RovingGM.DataAccess;

namespace RovingGM
{
    /// <summary>
    /// Summary description for User.
    /// Revised 5/27/05, added static variables
    /// Revised 6/3/05: removed Approve_Extended_Permission_Level, created Initiate_Claims_Permission_Level
    /// </summary>
    public class User
    {
        private dsUser m_dataset = new dsUser();
        private dsUser.UsersRow m_datarow = new dsUser.UsersRow();
        private daUser m_da = new daUser();

        public static string READ_ONLY_PERMISSION_LEVEL
        {
            get { return Configuration.GetValue("ReadOnlySecurityLevel"); }
        }

        public static string MANAGER_PERMISSION_LEVEL
        {
            get { return Configuration.GetValue("ManagerSecurityLevel"); }
        }


        public static string ADMINISTRATOR_PERMISSION_LEVEL
        {
            get { return Configuration.GetValue("AdministratorSecurityLevel"); }
        }

        public User()
        {
            m_dataset = new dsUser();

        }
        public User(string email, string password)
        {
            FindUserByEmailPassword(email,password);
             
        }

        public User(string email)
        {
            LoadByEmail(email);
        }


        public User(int UserID)
        {
            LoadByUserID(UserID);
        }


        public User LoadByEmail(string Email)
        {
            DatabaseCalls dc = new DatabaseCalls();
            System.Data.DataTable dt = dc.GetUserByEmail(Email);//check: todo ??
            if (dt.Rows.Count >= 1)
            {
                this.UserID = Convert.ToInt16(dt.Rows[0]["id"]) ;
                this.Password = Password;
                this.FirstName = dt.Rows[0]["FName"].ToString();
                this.LastName = dt.Rows[0]["LName"].ToString();
                this.SecurityLevel = Convert.ToInt16(dt.Rows[0]["SecurityLevel"]);
                return this;
            }
            else
            {
                return null;
            }
        }

        public User FindUserByEmailPassword(string Email, string Password)
        {
            DatabaseCalls dc = new DatabaseCalls();
            System.Data.DataTable dt = dc.FindUserByEmailPassword(Email, Password);
            if (dt.Rows.Count >= 1)
            {
                this.Email = Email;
                UserID = Convert.ToInt16(dt.Rows[0]["Id"]);
                this.Password = Password;
                FirstName = dt.Rows[0]["FName"].ToString();
                LastName = dt.Rows[0]["LName"].ToString();
                SecurityLevel = Convert.ToInt16(dt.Rows[0]["SecurityLevel"]);
                //check for nulls
                if(dsUser.IsItNull(dt.Rows[0]["managerID"].ToString()))
                    ManagerID = 0;
                else
                    ManagerID = Convert.ToInt16(dt.Rows[0]["managerID"]);
                if (dsUser.IsItNull(dt.Rows[0]["storeID"].ToString()))
                    StoreID = 0;
                else
                    StoreID = Convert.ToInt16(dt.Rows[0]["storeID"]);

                //this.Email = dt.Rows[0]["Email"].ToString();
                return this;
            }
            else
            {
                return null;
            }
        }

        private User LoadByUserID(int UserID)
        {
            DatabaseCalls dc = new DatabaseCalls();
            System.Data.DataTable dt = dc.GetUserByID(UserID);
            if (dt.Rows.Count >= 1)
            {
                this.UserID = UserID;
                this.Password = Password;
                this.FirstName = dt.Rows[0]["FName"].ToString();
                this.LastName = dt.Rows[0]["LName"].ToString();
                this.SecurityLevel = Convert.ToInt16(dt.Rows[0]["SecurityLevel"]);
                this.Email = dt.Rows[0]["Email"].ToString();
                return this;
            }
            else
            {
                return null;
            }
        }

        public void Save()
        {
            m_da = new daUser();
            m_da.Save(m_dataset);
        }

        public bool IsInitialized
        {
            get
            {
                if (m_datarow == null)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }

        public int UserID
        {
            get;
            set;

        }



        public string Email
        {
            set
            {
                m_datarow.Email = value;
            }
            get
            {
                if (m_datarow.IsEmailNull())
                {
                    return "";
                }
                else
                {
                    return m_datarow.Email;
                }
            }

        }

        public string FirstName
        {
            set
            {
                m_datarow.FirstName = value;
            }
            get
            {
                if (m_datarow.IsFirstNameNull())
                {
                    return "";
                }
                else
                {
                    return m_datarow.FirstName;
                }

            }

        }

        public string LastName
        {
            set
            {
                m_datarow.LastName = value;
            }
            get
            {
                if (m_datarow.IsLastNameNull())
                {
                    return "";
                }
                else
                {
                    return m_datarow.LastName;
                }

            }

        }

        public string Password
        {
            set
            {
                m_datarow.Password = value;
            }
            get
            {
                if (m_datarow.IsPasswordNull())
                {
                    return "";
                }
                else
                {
                    return m_datarow.Password;
                }

            }

        }

        public int SecurityLevel
        {
            set
            {
                m_datarow.SecurityLevel = value;
            }
            get
            {
                if (m_datarow.IsSecurityLevelNull())
                {
                    return 0;
                }
                else
                {
                    return m_datarow.SecurityLevel;
                }

            }

        }


        public DateTime DateCreated
        {
            set
            {
                m_datarow.DateCreated = value;
            }
            get
            {
                if (m_datarow.IsDateCreatedNull())
                {
                    return new DateTime(1900, 1, 1);
                }
                else
                {
                    return m_datarow.DateCreated;
                }

            }

        }

        public string CreatedBy
        {
            set
            {
                m_datarow.CreatedBy = value;
            }
            get
            {
                if (m_datarow.IsCreatedByNull())
                {
                    return "";
                }
                else
                {
                    return m_datarow.CreatedBy;
                }

            }

        }

        public int StoreID
        {
            set
            {
                m_datarow.StoreID = value;
            }
            get
            {
                if (m_datarow.IsStoreIDNull())
                {
                    return 0;
                }
                else
                {
                    return m_datarow.StoreID;
                }

            }

        }

        public int ManagerID
        {
            set
            {
                m_datarow.ManagerID = value;
            }
            get
            {
                if (m_datarow.IsManagerIDNull())
                {
                    return 0;
                }
                else
                {
                    return m_datarow.StoreID;
                }

            }

        }


    }

    public class Manager:User
    {

        public Manager ManagerByEmail(string Email)
        {
            DatabaseCalls dc = new DatabaseCalls();
            System.Data.DataTable dt = dc.GetManagerByEmail(Email);
            if (dt.Rows.Count >= 1)
            {
                this.ManagerID = Convert.ToInt16(dt.Rows[0]["ManagerID"]);
                this.StoreID = Convert.ToInt16(dt.Rows[0]["StoreID"]);
                return this;
            }
            else
            {
                return null;
            }
        }

    }
}

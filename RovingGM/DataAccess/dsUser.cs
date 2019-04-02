using System;
using System.Collections.Generic;
using System.Data;
using System.Web;

namespace RovingGM.DataAccess
{
    /// <summary>
    /// Summary description for dsUser
    /// </summary>
    /// 


    public class dsUser : DataSet
    {

        public class Users : DataTable
        { }

        public class UsersRow
        {
            public int UserID;

            public int SecurityLevel;

            public DateTime DateCreated;

            public string Password;

            public int StoreID;

            public int ManagerID;

            public string LastName;

            public string FirstName;

            public string CreatedBy;

            public string Email ;//return here for null check

            public bool IsEmailNull()
            {
                return IsItNull(Email);
            }

            public bool IsFirstNameNull()
            {
                return IsItNull(FirstName);
            }

            public bool IsLastNameNull()
            {
                return IsItNull(LastName);
            }

            public bool IsPasswordNull()
            {
                return IsItNull(Password);
            }


            public bool IsCreatedByNull()
            {
                return IsItNull(CreatedBy);
            }

            public bool IsStoreIDNull()
            {
                return IsItNull(StoreID.ToString());
            }

            public bool IsManagerIDNull()
            {
                return IsItNull(ManagerID.ToString());
            }


            public bool IsDateCreatedNull()
            {
                return IsItNull(DateCreated.ToString());
            }
            public bool ISCreatedByNull()
            {
                return IsItNull(CreatedBy);
            }

            public bool IsSecurityLevelNull()
            {
                return IsItNull(SecurityLevel.ToString());
            }


        }
 

        public class NewUsersRow: UsersRow
        {
            public int UserId;

            public bool Delete(int userId)
            {
                return IsItNull(userId.ToString());
            }

        }


        public static bool IsItNull(string theValue)
        {
            bool result = false;
            if (string.IsNullOrEmpty(theValue))
                result = true;
            return result;
        }
    }
}
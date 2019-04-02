using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace RovingGM
{
    public class clsGoals
    {
        DatabaseCalls dc = new DatabaseCalls();

        public decimal Goal { get; set; }
        public int Store { get; set; }
        public int Department { get; set; }
        public int Closes { get; set; }
        public string Month { get; set; }

        public DataTable Fetch()
        {
            return dc.GetGoals();
        }

        public int Insert(decimal Goal, int Department, int Store, int Closes, string Month)
        {
            return dc.InsertGoal(Goal, Department, Store, Closes, Month);
        }

        public int Update(int id, decimal Goal, int Department, int Store, int Closes, string Month)
        {
            return dc.UpdateGoals(id, Goal, Department, Store, Closes, Month);
        }

        public DataTable FetchDepartment()
        {
            return dc.GetDepartments();
        }

        public void Delete(int id)
        {
            dc.DeleteGoals(id);
        }





    }
}
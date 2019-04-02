using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace RovingGM
{
    public class clsCustomerIssue
    {
        SessionWrapper sw = new SessionWrapper();
        DatabaseCalls dc = new DatabaseCalls();

        public int id { get; }
        public int visitsId { get; set; }
        public string customerName { get; set; }
        public string issue { get; set; }
        public string resolution { get; set; }

        public DataTable Fetch()
        {
            DataTable dt = dc.GetCustomerIssues();
            return dt;
        }

        public int Insert(string txtNewCustomerName, string txtIssue, string txtResolution)
        {
            int result = 0;
            if (sw.VisitID != -1)
                result = dc.InsertCustomerIssues(sw.VisitID, txtNewCustomerName, txtIssue, txtResolution);
            return result;
        }

        public int Update(int id, string txtNewCustomerName, string txtIssue, string txtResolution)
        {
            int result = 0;
            if (sw.VisitID != -1)
                result = dc.UpdateCustomerIssues(id, sw.VisitID, txtNewCustomerName, txtIssue, txtResolution);
            return result;
        }

        public int Delete(int id)
        {
            return dc.DeleteCustomerIssues(id);
        }
    }
}







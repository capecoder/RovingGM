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

/// <summary>
/// Summary description for clsEmployeesTrained
/// </summary>
namespace RovingGM
{
    public class clsLeadsContacted
    {
        SessionWrapper sw = new SessionWrapper();
        DatabaseCalls dc = new DatabaseCalls();

        public int id { get; set; }
        public int visitId { get; set; }
        public string customerName { get; set; }
        public string customerEmail { get; set; }
        public string result { get; set; }

        public DataTable Fetch()
        {
            return dc.GetLeadsContacted();
        }

        public int Insert(string customerName, string customerEmail, string result)
        {
            return dc.InsertLeadsContacted(sw.VisitID, customerName, customerEmail, result);
        }

        public int Update(int id, string customerName, string customerEmail, string result)
        {
            return dc.UpdateLeadsContacted(id, sw.VisitID, customerName, customerEmail, result);
        }

        public int Delete(int id)
        {
            return dc.DeleteLeadsContacted(id);
        }
    }
}

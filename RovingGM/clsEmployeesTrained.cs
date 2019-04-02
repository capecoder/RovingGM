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
    public class clsEmployeesTrained
    {
        SessionWrapper sw = new SessionWrapper();
        DatabaseCalls dc = new DatabaseCalls();

        public int id { get; set; }
        public int visitId { get; set; }
        public string employeeName { get; set; }
        public string topicsCovered { get; set; }
        public string resolution { get; set; }

        public DataTable Fetch()
        {
            return dc.GetEmployeesTrained();
        }

        public int Insert(string employeeName, string topicsCovered, string resolution)
        {
            return dc.InsertEmployeesTrained(sw.VisitID, employeeName, topicsCovered, resolution);
        }

        public int Update(int id, string employeeName, string topicsCovered, string resolution)
        {
            return dc.UpdateEmployeesTrained(id, sw.VisitID, employeeName, topicsCovered, resolution);
        }

        public int Delete(int id)
        {
            return dc.DeleteEmployeesTrained(id);
        }
    }
}

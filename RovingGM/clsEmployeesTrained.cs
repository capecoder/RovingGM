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
    public class ClsEmployeesTrained
    {
        SessionWrapper sw = new SessionWrapper();
        DatabaseCalls dc = new DatabaseCalls();

        public int Id { get; set; }
        public int VisitId { get; set; }
        public string EmployeeName { get; set; }
        public string TopicsCovered { get; set; }
        public string Resolution { get; set; }

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

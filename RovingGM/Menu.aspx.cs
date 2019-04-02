using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionWrapper sw = new SessionWrapper();
            if (sw.ManagerID == 0)
                DataEntryLink.Visible = false;
            if (sw.SecurityLevel < 500)
            { 
                GoalsLink.Visible = false;
                SalesLink.Visible = false;
                IssuesLink.Visible = false;
                PartsLink.Visible = false;
                EmployeesTrainedLink.Visible = false;
                CustomerIssuesLink.Visible = false;
                LeadsLink.Visible = false;
            }
        }
    }
}
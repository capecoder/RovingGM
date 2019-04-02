using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class ContactReportResult : System.Web.UI.Page
    {
        SessionWrapper sw = new SessionWrapper();
        DatabaseCalls dc = new DatabaseCalls();

        protected void Page_Load(object sender, EventArgs e)
        {
            SetDataSource();
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SetDataSource();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void SetDataSource()
        {
            if (sw.SecurityLevel == 500)
                GridView1.DataSource = dc.GetAllVisits();
            else
                GridView1.DataSource = dc.GetVisitsByStoreManager(sw.StoreID, sw.ManagerID);
        }
    }
}
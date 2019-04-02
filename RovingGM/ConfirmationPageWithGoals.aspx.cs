using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class ConfirmationPageWithGoals : System.Web.UI.Page
    {
        SessionWrapper sw = new SessionWrapper();

        protected void Page_Load(object sender, EventArgs e)
        {
            DatabaseCalls dc = new DatabaseCalls();
            clsContactReport cr = new clsContactReport(Request);
            cr.ArrivalTime = sw.arrivalTime;
            if (!string.IsNullOrEmpty(sw.departureTime))
            {
                cr.DepartureTime = DateTime.Now.ToShortTimeString();
                sw.departureTime = cr.DepartureTime;
            }
            cr.VisitDate = sw.visitDate;
            cr.VisitId = dc.InsertVisit(cr);
            var list = new List<clsContactReport> { cr };
            DetailsView1.DataSource = list;
            DetailsView1.DataBind();
        }
    }
}
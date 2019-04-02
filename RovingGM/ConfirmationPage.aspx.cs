using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class ConfirmationPage : System.Web.UI.Page
    {
        SessionWrapper sw = new SessionWrapper();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DatabaseCalls dc = new DatabaseCalls();
                clsContactReport cr = new clsContactReport(Request);
                cr.ArrivalTime = sw.arrivalTime;
                if (string.IsNullOrEmpty(sw.departureTime))
                {
                    cr.DepartureTime = DateTime.Now.ToShortTimeString();
                    sw.departureTime = cr.DepartureTime;
                }
                cr.VisitDate = sw.visitDate;
                if (sw.VisitID > 0 )
                {
                    cr.VisitId = sw.VisitID;
                    dc.UpdateVisit(cr);
                }
                else
                {
                    cr.VisitId = dc.InsertVisit(cr);
                    sw.VisitID = cr.VisitId;
                }
                var list = new List<clsContactReport> { cr };
                DetailsView1.DataSource = list;
                DetailsView1.DataBind();
            }
            catch (Exception exc)
            {
                Response.Write(exc.Message);
            }
        }
    }
}
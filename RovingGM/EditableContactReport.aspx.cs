using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// contact report editable on same day as originally created

namespace RovingGM
{
    public partial class EditableContactReport : System.Web.UI.Page
    {
        SessionWrapper sw = new SessionWrapper();
        DatabaseCalls dc = new DatabaseCalls();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadValues();
        }

        private void LoadValues()
        {

            //find contact report data for logged in store manager and created today
            //if not found, provide link to ContactReport
            dc.GetEditableContactReport(sw.StoreID, sw.UserID, DateTime.Now);
            
        }
    }
}
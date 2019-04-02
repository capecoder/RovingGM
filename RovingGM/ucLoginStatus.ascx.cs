using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{

    public partial class ucLoginStatus : System.Web.UI.UserControl
    {

        public string RQSparams = "";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            CheckPermissions();
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        ///		Required method for Designer support - do not modify
        ///		the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {


        }
        #endregion

        private void CheckPermissions()
        {
            SessionWrapper sw = new SessionWrapper();
            if (string.IsNullOrEmpty(sw.userName))
                lblLoginName.Text = "Unknown User";
            else
                lblLoginName.Text = sw.userName;
            //if user is not logged in, redirect to login
            if (sw.SecurityLevel < 100)
                Response.Redirect("login.aspx");
        }
    }
}
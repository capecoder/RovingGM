using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;


namespace RovingGM
{
	/// <summary>
	/// Summary description for login.
	/// </summary>
	public partial class login : System.Web.UI.Page
	{
        SessionWrapper sw = new SessionWrapper();
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            //Response.Write(".NET Version:" + System.Environment.Version);
            // Log out
            if (Request.Params["logout"] == "Y")
            {
                lblUserError.Text = "You are now logged out. <a href='login.aspx' class='login'>Login</a>";
                lblUserError.Visible = true;
                divLogin.Visible = false;
            }
            else
            {
			if(!Page.IsPostBack)
                {
                    // clear session                
                    System.Web.HttpContext.Current.Session.Clear();
                    //new 12/13: check for cookie
                    if (Request.Cookies["rovinggm.com"] != null)
			{
                        //lblCookie.Text = "Cookie found.";

                        System.Collections.Specialized.NameValueCollection
                                UserInfoCookieCollection;

                        UserInfoCookieCollection = Request.Cookies["newenglandpowersports.com"].Values;
                        sw.UserID = Convert.ToInt32(Server.HtmlEncode(UserInfoCookieCollection["userId"]));
                        sw.UserEmail = Server.HtmlEncode(UserInfoCookieCollection["userEmail"]);
                        sw.PermissionLevel = Convert.ToInt32(Server.HtmlEncode(UserInfoCookieCollection["PermissionLevel"]));
                        CheckPermissionLevel();
			}
                }
            }
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
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

		protected void btnLogin_Click(object sender, System.EventArgs e)
		{
			try
			{
				User thisuser = new User(txtUserEmail.Text.Trim(), txtPassword.Text.Trim());
				sw.UserID = thisuser.UserID;
				if(thisuser.UserID == 0)
				{
                MyCustomException f = new MyCustomException("Usernotfound");
					throw f;
				}
				sw.UserEmail = thisuser.Email;
				sw.PermissionLevel = thisuser.PermissionLevel;
                Response.Cookies["newenglandpowersports.com"]["userId"] = thisuser.UserID.ToString();
                Response.Cookies["newenglandpowersports.com"]["userEmail"] = thisuser.Email;
                Response.Cookies["newenglandpowersports.com"]["PermissionLevel"] = thisuser.PermissionLevel.ToString();
				if(sw.RedirectPage != "")
					Response.Redirect(sw.RedirectPage);
				else
					if(txtPassword.Text != thisuser.Password)
				{
					MyCustomException g = new MyCustomException("Usernotfound");
					throw g;
				}
                CheckPermissionLevel();
			}
			catch (SqlException objSqlException)
			{
				lblUserError.Text = "You do not have permission to use this site.";
				lblUserError.Visible = true;
				string SQLExceptions = "";
				for (int i=0; i < objSqlException.Errors.Count; i++)
				{
					SQLExceptions += "Index #" + i + "\n";
					SQLExceptions += "Error: " + objSqlException.Errors[i].ToString() + "\n";
				}
				//ErrorFile.WriteFile("Invalid user email at login "+txtUserEmail.Text.Trim()+ SQLExceptions);
				lblUserError.Text = "We could not find your email address.  Please try again.";
				lblUserError.Visible = true;
			}
			catch(System.Threading.ThreadAbortException)
			{
				//this fires on redirect, ignore
			}
			catch(MyCustomException g)
			{
				//ErrorFile.WriteFile("Password "+txtPassword.Text+" does not match for user "+txtUserEmail.Text.Trim()+" "+g.Message);
				lblUserError.Text = "This password does not match our records.";
				lblUserError.Visible = true;
			}
			catch(Exception exc)
			{
				//ErrorFile.WriteFile("Invalid user email at login "+txtUserEmail.Text.Trim()+" "+ exc.Message);
				lblUserError.Text = "You do not have permission to use this site.";
				lblUserError.Visible = true;
			}
		}
        private void CheckPermissionLevel()
        {
            if ((int)sw.PermissionLevel >= 200)
                Response.Redirect("admin.aspx");
            else
                Response.Redirect("warrantystart.aspx");
	}
    }
}

using System;
using System.Web.UI;
using System.Data.SqlClient;
namespace RovingGM
{
    public partial class Login : System.Web.UI.Page
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
                if (!Page.IsPostBack)
                {
                    // clear session                
                    System.Web.HttpContext.Current.Session.Clear();
                    //new 12/13: check for cookie
                    if (Request.Cookies["rovinggm.com"] != null)
                    {
                        //lblCookie.Text = "Cookie found.";

                        System.Collections.Specialized.NameValueCollection
                                UserInfoCookieCollection;

                        UserInfoCookieCollection = Request.Cookies["rovinggm.com"].Values;
                        sw.UserID = Convert.ToInt32(Server.HtmlEncode(UserInfoCookieCollection["userId"]));
                        sw.UserEmail = Server.HtmlEncode(UserInfoCookieCollection["userEmail"]);
                        sw.SecurityLevel = Convert.ToInt32(Server.HtmlEncode(UserInfoCookieCollection["SecurityLevel"]));
                        CheckSecurityLevel();
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
                User thisUser = new User();
                thisUser = thisUser.FindUserByEmailPassword(txtUserEmail.Text.Trim(), txtPassword.Text.Trim());
                sw.UserID = thisUser.UserID;
                //if (thisUser.ManagerID != 0 && thisUser.StoreID != 0)
                //{
                    sw.StoreID = thisUser.StoreID;
                    sw.ManagerID = thisUser.ManagerID;
                //}
                if (thisUser.UserID == 0)
                {
                    MyCustomException f = new MyCustomException("Usernotfound");
                    throw f;
                }
                sw.UserEmail = thisUser.Email;
                sw.SecurityLevel = thisUser.SecurityLevel;
                sw.userName = thisUser.FirstName + " " + thisUser.LastName;
                Response.Cookies["newenglandpowersports.com"]["userId"] = thisUser.UserID.ToString();
                Response.Cookies["newenglandpowersports.com"]["userEmail"] = thisUser.Email;
                Response.Cookies["newenglandpowersports.com"]["manager"] = thisUser.ManagerID.ToString();
                Response.Cookies["newenglandpowersports.com"]["SecurityLevel"] = thisUser.SecurityLevel.ToString();
                if (sw.RedirectPage != "")
                    Response.Redirect(sw.RedirectPage);
                else
                    if (txtPassword.Text != thisUser.Password)
                {
                    MyCustomException g = new MyCustomException("Usernotfound");
                    throw g;
                }
                CheckSecurityLevel();
            }
            catch (SqlException objSqlException)
            {
                lblUserError.Text = "You do not have permission to use this site. " + objSqlException;
                lblUserError.Visible = true;
                string SQLExceptions = "";
                for (int i = 0; i < objSqlException.Errors.Count; i++)
                {
                    SQLExceptions += "Index #" + i + "\n";
                    SQLExceptions += "Error: " + objSqlException.Errors[i].ToString() + "\n";
                }
                //ErrorFile.WriteFile("Invalid user email at login "+txtUserEmail.Text.Trim()+ SQLExceptions);
                lblUserError.Text = "We could not find your email address.  Please try again.";
                lblUserError.Visible = true;
            }
            catch (System.Threading.ThreadAbortException)
            {
                //this fires on redirect, ignore
            }
            catch (MyCustomException g)
            {
                //ErrorFile.WriteFile("Password "+txtPassword.Text+" does not match for user "+txtUserEmail.Text.Trim()+" "+g.Message);
                lblUserError.Text = "This password does not match our records. " + g.Message;
                lblUserError.Visible = true;
            }
            catch (Exception exc)
            {
                //ErrorFile.WriteFile("Invalid user email at login "+txtUserEmail.Text.Trim()+" "+ exc.Message);
                lblUserError.Text = "Invalid email; you do not have permission to use this site. " + exc.StackTrace;
                lblUserError.Visible = true;
            }
        }
        private void CheckSecurityLevel()
        {
            if ((int)sw.SecurityLevel >= 100)
                Response.Redirect("Menu.aspx");
            else
            {
                lblUserError.Text = "You do not have permission to use this site.";
                lblUserError.Visible = true;
            }
        }
    }
}
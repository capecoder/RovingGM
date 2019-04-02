using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class CustomerIssues : System.Web.UI.Page
    {

        clsCustomerIssue customer = new clsCustomerIssue();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FillCustomerInGrid();
        }

        private void FillCustomerInGrid()
        {
            DataTable dtCustomer = customer.Fetch();

            if (dtCustomer.Rows.Count > 0)
            {
                GridView1.DataSource = dtCustomer;
                GridView1.DataBind();
            }
            else
            {
                dtCustomer.Rows.Add(dtCustomer.NewRow());
                GridView1.DataSource = dtCustomer;
                GridView1.DataBind();

                int TotalColumns = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                GridView1.Rows[0].Cells[0].Text = "No Record Found";
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtNewCustomerName = (TextBox)GridView1.FooterRow.FindControl("txtNewCustomerName");

                TextBox txtNewIssue = (TextBox)GridView1.FooterRow.FindControl("txtNewIssue");
                TextBox txtNewResolution = (TextBox)GridView1.FooterRow.FindControl("txtNewResolution");

                customer.Insert(txtNewCustomerName.Text, txtNewIssue.Text, txtNewResolution.Text);
                FillCustomerInGrid();
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillCustomerInGrid();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            customer.Delete(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()));
            FillCustomerInGrid();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillCustomerInGrid();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCustomerName");
            TextBox txtIssue = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtIssue");
            TextBox txtResolution = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtResolution");

            customer.Update(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()), txtName.Text, txtIssue.Text, txtResolution.Text);
            GridView1.EditIndex = -1;
            FillCustomerInGrid();
        }

    }
}
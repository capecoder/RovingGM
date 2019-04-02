using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class LeadsContacted: System.Web.UI.Page
    {

        clsLeadsContacted Leads = new clsLeadsContacted();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FillLeadsInGrid();
        }

        private void FillLeadsInGrid()
        {
            DataTable dtLeads = Leads.Fetch();

            if (dtLeads.Rows.Count > 0)
            {
                GridView1.DataSource = dtLeads;
                GridView1.DataBind();
            }
            else
            {
                dtLeads.Rows.Add(dtLeads.NewRow());
                GridView1.DataSource = dtLeads;
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
                DropDownList cmbVisitsId = (DropDownList)GridView1.FooterRow.FindControl("cmbVisitsId");
                TextBox txtNewCustomerEmail = (TextBox)GridView1.FooterRow.FindControl("txtNewCustomerEmail");
                TextBox txtNewResult = (TextBox)GridView1.FooterRow.FindControl("txtNewResult");

                Leads.Insert(txtNewCustomerName.Text, txtNewCustomerEmail.Text, txtNewResult.Text);
                FillLeadsInGrid();
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillLeadsInGrid();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Leads.Delete(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()));
            FillLeadsInGrid();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillLeadsInGrid();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtCustomerName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCustomerName");
            TextBox txtCustomerEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCustomerEmail");
            TextBox txtResult = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtResult");

            Leads.Update(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()), txtCustomerName.Text, txtCustomerEmail.Text, txtResult.Text);
            GridView1.EditIndex = -1;
            FillLeadsInGrid();
        }

    }
}
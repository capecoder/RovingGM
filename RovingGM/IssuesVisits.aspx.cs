using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class IssuesVisits : System.Web.UI.Page
    {
        DatabaseCalls dc = new DatabaseCalls();

        protected void Page_Load(object sender, EventArgs e)
        {
            FillInGrid();
        }

        private void FillInGrid()
        {
            DataTable dt = dc.Fetch("Issues");

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource = dt;
                GridView1.DataBind();

                //int TotalColumns = DataList1.Rows[0].Cells.Count;
                //DataList1..Rows[0].Cells.Clear();
                //DataList1.Rows[0].Cells.Add(new TableCell());
                //DataList1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                //DataList1.Rows[0].Cells[0].Text = "No Record Found";
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridView1.EditIndex = e.RowIndex;
            // Rebind the data
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            // Rebind the data
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView1.EditIndex = e.RowIndex;
            // Rebind the data
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                MessageLabel.Text = "Row deleted successfully.";
            }
            else
            {
                MessageLabel.Text = "An error occurred while attempting to delete the row.";
                e.ExceptionHandled = true;
            }

        }
    }
}
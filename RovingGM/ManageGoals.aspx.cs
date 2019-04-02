using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class ManageGoals : System.Web.UI.Page
    {
        clsGoals Goals = new clsGoals();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FillGoalsInGrid();
        }

        private void FillGoalsInGrid()
        {
            DataTable dtGoals = Goals.Fetch();

            if (dtGoals.Rows.Count > 0)
            {
                GridView1.DataSource = dtGoals;
                GridView1.DataBind();
            }
            else
            {
                dtGoals.Rows.Add(dtGoals.NewRow());
                GridView1.DataSource = dtGoals;
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
                TextBox txtNewGoal = (TextBox)GridView1.FooterRow.FindControl("txtNewGoal");
                DropDownList cmbNewDepartment = (DropDownList)GridView1.FooterRow.FindControl("cmbNewDepartment");
                TextBox txtNewCloses = (TextBox)GridView1.FooterRow.FindControl("txtNewCloses");
                TextBox txtNewMonth = (TextBox)GridView1.FooterRow.FindControl("txtNewMonth");
                DropDownList cmbNewStore = (DropDownList)GridView1.FooterRow.FindControl("cmbNewStore");
                if (String.IsNullOrWhiteSpace(txtNewGoal.Text))
                    txtNewGoal.Text = "0";
                if (String.IsNullOrWhiteSpace(txtNewCloses.Text))
                    txtNewCloses.Text = "0";
                int result = Goals.Insert(Convert.ToDecimal(txtNewGoal.Text), cmbNewDepartment.SelectedIndex, cmbNewStore.SelectedIndex, Convert.ToInt16(txtNewCloses.Text),txtNewMonth.Text);
                FillGoalsInGrid();
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList cmbType = (DropDownList)e.Row.FindControl("cmbDepartment");

                if (cmbType != null)
                {
                    cmbType.DataSource = Goals.FetchDepartment();
                    cmbType.DataBind();
                    cmbType.SelectedValue = GridView1.DataKeys[e.Row.RowIndex].Values[1].ToString();
                }
            }

            //if (e.Row.RowType == DataControlRowType.Footer)
            //{
            //    DropDownList cmbNewType = (DropDownList)e.Row.FindControl("cmbDepartment");
            //    cmbNewType.DataSource = Goals.FetchDepartment();
            //    cmbNewType.DataBind();
            //}
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillGoalsInGrid();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Goals.Delete(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()));
            FillGoalsInGrid();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillGoalsInGrid();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtGoal = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGoal");
            DropDownList cmbDepartment = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("cmbDepartment");
            TextBox txtCloses = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCloses");
            DropDownList cmbStore = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("cmbStore");
            TextBox txtMonth = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Month");

            Goals.Update(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()), 
                Convert.ToDecimal(txtGoal.Text), 
                cmbDepartment.SelectedIndex, 
                cmbStore.SelectedIndex, 
                Convert.ToInt16(txtCloses.Text), txtMonth.Text);
            GridView1.EditIndex = -1;
            FillGoalsInGrid();
        }

    }
}

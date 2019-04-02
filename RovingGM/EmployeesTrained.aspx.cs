using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class EmployeesTrained: System.Web.UI.Page
    {

        clsEmployeesTrained Employee = new clsEmployeesTrained();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FillEmployeeInGrid();
        }

        private void FillEmployeeInGrid()
        {
            DataTable dtEmployee = Employee.Fetch();

            if (dtEmployee.Rows.Count > 0)
            {
                GridView1.DataSource = dtEmployee;
                GridView1.DataBind();
            }
            else
            {
                dtEmployee.Rows.Add(dtEmployee.NewRow());
                GridView1.DataSource = dtEmployee;
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
                TextBox txtNewEmployeeName = (TextBox)GridView1.FooterRow.FindControl("txtNewEmployeeName");
                DropDownList cmbVisitsId = (DropDownList)GridView1.FooterRow.FindControl("cmbVisitsId");
                TextBox txtNewTopicsCovered = (TextBox)GridView1.FooterRow.FindControl("txtNewTopicsCovered");
                TextBox txtNewResolution = (TextBox)GridView1.FooterRow.FindControl("txtNewResolution");

                Employee.Insert(txtNewEmployeeName.Text, txtNewTopicsCovered.Text, txtNewResolution.Text);
                FillEmployeeInGrid();
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillEmployeeInGrid();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Employee.Delete(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()));
            FillEmployeeInGrid();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillEmployeeInGrid();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtEmployeeName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEmployeeName");
            TextBox txtTopicsCovered = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtTopicsCovered");
            TextBox txtResolution = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtResolution");

            Employee.Update(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()), txtEmployeeName.Text, txtTopicsCovered.Text, txtResolution.Text);
            GridView1.EditIndex = -1;
            FillEmployeeInGrid();
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class ContactReportWithGoals : System.Web.UI.Page
    {
        SessionWrapper sw = new SessionWrapper();
        DatabaseCalls dc = new DatabaseCalls();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadValues();
        }

        private void LoadValues()
        {
            if (!string.IsNullOrEmpty(sw.ManagerID.ToString()))
                SelectGM.SelectedIndex = Convert.ToInt16(sw.ManagerID);
            if (!string.IsNullOrEmpty(sw.StoreID.ToString()))
                SelectStore.SelectedIndex = Convert.ToInt16(sw.StoreID);
            if (!string.IsNullOrEmpty(sw.visitDate))
                sw.visitDate = DateTime.Now.Date.ToShortDateString();
            if (!string.IsNullOrEmpty(sw.arrivalTime))
                sw.arrivalTime = DateTime.Now.ToShortTimeString();

            //find contact report data for logged in store manager and created today
            System.Data.DataTable dt = dc.GetEditableContactReport(sw.StoreID, sw.UserID, DateTime.Now.Date);
            //if found, make SelectGM, SelectStore non-editable

            string departureTime = string.Empty;
            if (dt.Rows.Count > 0)
            {
                SelectGM.SelectedIndex = Convert.ToInt16(dt.Rows[0]["ManagerID"]);
                SelectGM.Disabled = true;
                SelectStore.SelectedIndex = Convert.ToInt16(dt.Rows[0]["StoreID"]);
                SelectStore.Disabled = true;
                sw.visitDate = dt.Rows[0]["VisitDate"].ToString();

                //determine if remainder of form can be edited by checking today's date
                if (DateTime.Now.Date > Convert.ToDateTime(sw.visitDate).Date)
                {
                    //show db values, disable all inputs
                    departureTime = dt.Rows[0]["DepartureTime"].ToString();
                    UnitsSold_Today.Value = dt.Rows[0]["UnitsSold_Today"].ToString();
                    UnitsSoldGP_Today.Value = dt.Rows[0]["UnitsSoldGP_Today"].ToString();
                    UnitsDelivered_MTD.Value = dt.Rows[0]["UnitsDelivered_MTD"].ToString();
                    UnitGoalAchieved.Value = dt.Rows[0]["UnitGoalAchieved"].ToString();
                    UnitsSoldTotalGP_MTD.Value = dt.Rows[0]["UnitsSoldTotalGP_MTD"].ToString();
                    GPGoalAchieved.Value = dt.Rows[0]["GPGoalAchieved"].ToString();
                    MTDGPPU.Value = dt.Rows[0]["MTDGPPU"].ToString();
                    UsedReady.Value = dt.Rows[0]["UsedReady"].ToString();
                    ModelMix.Value = dt.Rows[0]["ModelMix"].ToString();
                    PricingAge.Value = dt.Rows[0]["PricingAge"].ToString();
                    boGrossProfit_Today.Value = dt.Rows[0]["boGrossProfit_Today"].ToString();
                    boCloses_Today.Value = dt.Rows[0]["boCloses_Today"].ToString();
                    boGPPU_Today.Value = dt.Rows[0]["boGPPU_Today"].ToString();
                    boGrossProfit_MTD.Value = dt.Rows[0]["boGPPU_Today"].ToString();
                    boCloses_MTD.Value = dt.Rows[0]["boGPPU_Today"].ToString();
                    boGoal.Value = dt.Rows[0]["boGoal"].ToString();
                    boGoalAchievement.Value = dt.Rows[0]["boGoalAchievement"].ToString();
                    partsSales_MTD.Value = dt.Rows[0]["partsSales_MTD"].ToString();
                    partsGoal_MTD.Value = dt.Rows[0]["partsGoal_MTD"].ToString();
                    partsGoalAchieve.Value = dt.Rows[0]["partsGoalAchieve"].ToString();
                    ServiceSales_MTD.Value = dt.Rows[0]["ServiceSales_MTD"].ToString();
                    ServiceGoal_MTD.Value = dt.Rows[0]["ServiceGoal_MTD"].ToString();
                    ServGoalAchivement.Value = dt.Rows[0]["ServiceGoalAchivement"].ToString();
                    CustomerIssues.Value = dt.Rows[0]["CustomerIssues"].ToString();
                    EmployeesTrained.Value = dt.Rows[0]["EmployeesTrained"].ToString();
                    DisableElements();
                }
            }
        }

        private void DisableElements()
        {
            UnitsSold_Today.Disabled = true;
            UnitsSoldGP_Today.Disabled = true;
            UnitsDelivered_MTD.Disabled = true;
            UnitGoalAchieved.Disabled = true;
            UnitsSoldTotalGP_MTD.Disabled = true;
            GPGoalAchieved.Disabled = true;
            MTDGPPU.Disabled = true;
            UsedReady.Disabled = true;
            ModelMix.Disabled = true;
            PricingAge.Disabled = true;
            boGrossProfit_Today.Disabled = true;
            boCloses_Today.Disabled = true;
            boGPPU_Today.Disabled = true;
            boGrossProfit_MTD.Disabled = true;
            boCloses_MTD.Disabled = true;
            boGoal.Disabled = true;
            boGoalAchievement.Disabled = true;
            partsSales_MTD.Disabled = true;
            partsGoal_MTD.Disabled = true;
            partsGoalAchieve.Disabled = true;
            ServiceSales_MTD.Disabled = true;
            ServiceGoal_MTD.Disabled = true;
            ServGoalAchivement.Disabled = true;
            CustomerIssues.Disabled = true;
            EmployeesTrained.Disabled = true;
        }

        public void Submit(object sender, EventArgs e)
        {

        }
    }
}
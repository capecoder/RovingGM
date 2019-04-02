using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RovingGM
{
    public partial class ContactReport : System.Web.UI.Page
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
            if (string.IsNullOrEmpty(sw.visitDate))
                sw.visitDate = DateTime.Now.Date.ToShortDateString();
            if (string.IsNullOrEmpty(sw.arrivalTime))
                sw.arrivalTime = DateTime.Now.ToShortTimeString();

            //find contact report data for logged in store manager and created today
            System.Data.DataTable dt = dc.GetEditableContactReport(sw.StoreID, sw.ManagerID, DateTime.Now.Date);
            //if found, make SelectGM, SelectStore non-editable

            string departureTime = string.Empty;
            if (dt.Rows.Count > 0)
            {
                SelectGM.SelectedIndex = Convert.ToInt16(dt.Rows[0]["Manager"]);
                SelectGM.Disabled = true;
                SelectStore.SelectedIndex = Convert.ToInt16(dt.Rows[0]["Store"]);
                SelectStore.Disabled = true;
                sw.visitDate = Utilities.MakeDateTime(dt.Rows[0]["VisitDate"].ToString()).ToShortDateString();
                sw.arrivalTime = dt.Rows[0]["ArrivalTime"].ToString();
                sw.VisitID = Convert.ToInt16(dt.Rows[0]["id"]);
                Visit_Date.Value = sw.visitDate;
                departureTime = dt.Rows[0]["DepartureTime"].ToString();
                UnitsSold_Today.Value = dt.Rows[0]["UnitsSold_Today"].ToString();
                UnitsSoldGP_Today.Value = Utilities.TwoDecimals(dt.Rows[0]["UnitsSoldGP_Today"]);
                //GPPUToday.Value = Utilities.ProfitPerUnit(UnitsSoldGP_Today.Value, UnitsSold_Today.Value).ToString();
                UnitsDelivered_MTD.Value = dt.Rows[0]["UnitsDelivered_MTD"].ToString();
                UnitsSoldTotalGP_MTD.Value = Utilities.TwoDecimals(dt.Rows[0]["UnitsSoldTotalGP_MTD"]);
                //MTDGPPU.Value = Utilities.ProfitPerUnit(UnitsSoldTotalGP_MTD.Value,UnitsDelivered_MTD.Value);
                ReadyForSaleStatus.Value = dt.Rows[0]["ReadyForSaleStatus"].ToString();
                ModelMix.Value = dt.Rows[0]["ModelMix"].ToString();
                PricingAge.Value = dt.Rows[0]["PricingVsAge"].ToString();
                boGrossProfit_Today.Value = Utilities.TwoDecimals(dt.Rows[0]["boGrossProfit_Today"]);
                boCloses_Today.Value = dt.Rows[0]["boCloses_Today"].ToString();
                // boGPPU_Today.Value = dt.Rows[0]["boGPPU_Today"].ToString();
                //boGPPU_Today.Value = Utilities.ProfitPerUnit(boGrossProfit_Today.Value, boCloses_Today.Value);
                boGrossProfit_MTD.Value = Utilities.TwoDecimals(dt.Rows[0]["boGrossProfit_Today"]);
                boCloses_MTD.Value = dt.Rows[0]["boCloses_MTD"].ToString();
                partsSales_MTD.Value = Utilities.TwoDecimals(dt.Rows[0]["partsSales_MTD"]);
                ServiceSales_MTD.Value = Utilities.TwoDecimals(dt.Rows[0]["ServiceSales_MTD"]);
                Displays.Value = dt.Rows[0]["Displays"].ToString();
                Cleanliness_Organization.Value = dt.Rows[0]["Cleanliness_Organization"].ToString();
                OverallConditions.Value = dt.Rows[0]["OverallConditions"].ToString();
                Improve.Value = dt.Rows[0]["Improve"].ToString();
                StaffingReview.Value = dt.Rows[0]["StaffingReview"].ToString();
                WebsiteSales.Value = dt.Rows[0]["WebsiteSales"].ToString();
                WebsiteBusOff.Value = dt.Rows[0]["WebsiteBusOff"].ToString();
                WebsiteService.Value = dt.Rows[0]["WebsiteService"].ToString();
                WebsiteParts.Value = dt.Rows[0]["WebsiteParts"].ToString();

                //determine if remainder of form can be edited by checking today's date
                if (DateTime.Now.Date > Convert.ToDateTime(sw.visitDate).Date)
                {
                    DisableElements();
                }
            }
            else
            {
                Visit_Date.Value = DateTime.Now.ToShortDateString();
                sw.visitDate = Visit_Date.Value;
            }
        }

        private void DisableElements()
        {
            UnitsSold_Today.Disabled = true;
            UnitsSoldGP_Today.Disabled = true;
            UnitsDelivered_MTD.Disabled = true;
            UnitsSoldTotalGP_MTD.Disabled = true;
            //MTDGPPU.Disabled = true;
            ReadyForSaleStatus.Disabled = true;
            ModelMix.Disabled = true;
            PricingAge.Disabled = true;
            boGrossProfit_Today.Disabled = true;
            boCloses_Today.Disabled = true;
            //boGPPU_Today.Disabled = true;
            boGrossProfit_MTD.Disabled = true;
            boCloses_MTD.Disabled = true;
            partsSales_MTD.Disabled = true;
            ServiceSales_MTD.Disabled = true;
            OverallConditions.Disabled = true;
            StaffingReview.Disabled = true;
            Displays.Disabled = true;
            Cleanliness_Organization.Disabled = true;
            Improve.Disabled = true;
            WebsiteSales.Disabled = true;
            WebsiteBusOff.Disabled = true;
            WebsiteService.Disabled = true;
            WebsiteParts.Disabled = true;
        }

        public void Submit(object sender, EventArgs e)
        {

        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

    }
}
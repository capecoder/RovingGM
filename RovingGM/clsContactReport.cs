using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RovingGM
{
    public class clsContactReport
    {
        SessionWrapper sw = new SessionWrapper();

        public int VisitId { get; set; }
        public int Store { get; set; }
        public string VisitDate { get; set; }
        public int GeneralManager { get; set; }
        public string ArrivalTime { get; set; }
        public string DepartureTime { get; set; }
        public int UnitsSold_Today { get; set; }
        public decimal UnitsSoldGP_Today { get; set; }
        public decimal GPPU_Today { get; set; } //calculated field: Units Sold GP/Units Sold
        public int UnitsDelivered_MTD { get; set; }
        public decimal UnitGoalAchieved { get; set; } //calculated field: Units Delivered/Closes
        public decimal UnitsSoldTotalGP_MTD { get; set; }
        public decimal GPGoalAchieved { get; set; } //calculated field: Units Sold Total GP/Goal
        public decimal MTDGPPU { get; set; }  //calculated field: Units Delivered MTD/Units Sold Total GP MTD
        public string ReadyForSaleStatus { get; set; }
        public string ModelMix { get; set; }
        public string PricingVsAge { get; set; }
        public int boCloses_Today { get; set; }
        public decimal boGrossProfit_Today { get; set; }
        public decimal boGPPU_Today { get; set; } //calculated field: Gross Profit/Closes
        public decimal boGrossProfit_MTD { get; set; }
        public int boCloses_MTD { get; set; }
        public decimal boGoal { get; set; }
        public decimal boGoalAchievement { get; set; }  //calculated field: todo
        public decimal partsSales_MTD { get; set; }
        public decimal partsGoal_MTD { get; set; }
        public decimal partsGoalAchieve { get; set; } //calculated field: partsSales_MTD/partsGoal_MTD
        public decimal ServiceSales_MTD { get; set; }
        public decimal serviceGoal_MTD { get; set; }
        public decimal serviceGoalAchieve { get; set; } //calculated field: serviceSales_MTD/serviceGoal_MTD
        public string Displays { get; set; }
        public string Cleanliness_Organization { get; set; }
        public string StaffingReview { get; set; }
        public string OverallConditions { get; set; }
        public string Improve { get; set; }
        public string WebsiteSales { get; set; }
        public string WebsiteBusOff { get; set; }
        public string WebsiteService { get; set; }
        public string WebsiteParts { get; set; }

        public clsContactReport(System.Web.HttpRequest Request)
        {
            this.ArrivalTime = sw.arrivalTime;
            this.boCloses_MTD = Utilities.MakeInteger(Request.Form["boCloses_MTD"]);
            this.Store = Utilities.MakeInteger(Request.Form["SelectStore"]);
            this.VisitDate = sw.visitDate;
            this.GeneralManager = Utilities.MakeInteger(Request.Form["SelectGM"]);
            this.DepartureTime = DateTime.Now.ToString();
            this.UnitsSold_Today = Utilities.MakeInteger(Request.Form["UnitsSold_Today"]);
            this.UnitsSoldGP_Today = Utilities.MakeDecimal(Request.Form["UnitsSoldGP_Today"]);
            this.GPPU_Today = Utilities.PreventDivideByZero(UnitsSoldGP_Today, UnitsSold_Today); //calculated field: Units Sold GP/Units Sold
            this.UnitsDelivered_MTD = Utilities.MakeInteger(Request.Form["UnitsDelivered_MTD"]);
            this.UnitGoalAchieved = Utilities.PreventDivideByZero(UnitsDelivered_MTD, boCloses_MTD); //calculated field: Units Delivered/Closes
            //check for divide by zero
            this.UnitsSoldTotalGP_MTD = Utilities.MakeDecimal(Request.Form["UnitsSoldTotalGP_MTD"]);
            this.GPGoalAchieved = Utilities.PreventDivideByZero(UnitsSoldGP_Today, UnitsSold_Today); //calculated field: Units Sold Total GP/Goal
            this.MTDGPPU = Utilities.PreventDivideByZero(UnitsSoldTotalGP_MTD, UnitsDelivered_MTD);  //calculated field: Units Delivered MTD/Units Sold Total GP MTD
            this.ReadyForSaleStatus = Request.Form["ReadyForSaleStatus"];
            this.ModelMix = Request.Form["ModelMix"];
            this.PricingVsAge = Request.Form["PricingAge"];
            this.boCloses_Today = Utilities.MakeInteger(Request.Form["boCloses_Today"]);
            this.boGrossProfit_Today = Utilities.MakeDecimal(Request.Form["boGrossProfit_Today"]);
            this.boGPPU_Today = Utilities.PreventDivideByZero(boGrossProfit_Today, boCloses_Today);
            this.boGrossProfit_MTD = Utilities.MakeDecimal(Request.Form["boGrossProfit_MTD"]);
            this.boCloses_MTD = Utilities.MakeInteger(Request.Form["boCloses_MTD"]);
            this.boGoal = Utilities.MakeDecimal(Request.Form["boGoal"]);  //todo: select from Goals table
            this.boGoalAchievement = Utilities.PreventDivideByZero(boCloses_MTD, boGoal);// calculated field
            this.partsSales_MTD = Utilities.MakeDecimal(Request.Form["partsSales_MTD"]);
            this.partsGoal_MTD = Utilities.MakeDecimal(Request.Form["partsGoal_MTD"]); //todo: select from Goals table
            this.partsGoalAchieve = Utilities.PreventDivideByZero(partsSales_MTD, partsGoal_MTD); //todo: select from Goals table
            this.ServiceSales_MTD = Utilities.MakeDecimal(Request.Form["serviceSales_MTD"]);
            this.serviceGoal_MTD = Utilities.MakeDecimal(Request.Form["serviceGoal_MTD"]);
            this.serviceGoalAchieve = Utilities.PreventDivideByZero(ServiceSales_MTD, serviceGoal_MTD); //todo: select from Goals table
            this.Displays = Request.Form["Displays"];
            this.Cleanliness_Organization = Request.Form["Cleanliness_Organization"];
            this.StaffingReview = Request.Form["StaffingReview"];
            this.OverallConditions = Request.Form["OverallConditions"];
            this.Improve = Request.Form["Improve"];
            this.WebsiteSales = Request.Form["WebsiteSales"];
            this.WebsiteBusOff = Request.Form["WebsiteBusOff"];
            this.WebsiteParts = Request.Form["WebsiteParts"];
            this.WebsiteService = Request.Form["WebsiteService"];
        }

    }
}
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditableContactReport.aspx.cs" Inherits="RovingGM.EditableContactReport" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>General Manager Contact Report </title>
    <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <!-- Main -->
    <form method="POST" id="theForm" action="ConfirmationPage.aspx" runat="server" onsubmit="return Input_Validator(this)" name="theForm">
        <div id="mainContainer" class="container">
            <div class="shadowBox">
                <div class="page-container">
                    <div class="container">
                        <uc1:ucLoginStatus runat="server" ID="ucLoginStatus1" />
                        <asp:DataList ID="DataList1" runat="server"></asp:DataList>
                        <asp:ListView ID="ListView1" runat="server"></asp:ListView>
                        <h3>Contact Report </h3>
                        <div class="row">
                            <div class="6u 12u(mobile)">
                                <h4>Acting General Manager</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 ">
                                <label>Store</label>
                            </div>
                            <div class="col-lg-3 ">
                                <asp:Label ID="Store" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="col-lg-3 ">
                                <label>Date</label>
                            </div>
                            <div class="col-lg-3 ">
                                <input name="Date" id="Date" type="text" runat="server" placeholder="Date" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 ">
                                <label>Arrival Time</label>
                            </div>
                            <div class="col-lg-3 ">
                                <asp:TextBox ID="txtArrivalTime" runat="server" placeholder="Arrival Time"></asp:TextBox>
                            </div>
                            <div class="col-lg-3 ">
                                <label>Departure</label>
                            </div>
                            <div class="col-lg-3 ">
                                <input name="Departure" id="txtDeparture" type="text" placeholder="Departure" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Sales Department</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Today</h4>
                            </div>
                            <div class="col-lg-3">
                                Units Sold
                            </div>
                            <div class="col-lg-3">
                                <input name="UnitsSold_Today" id="UnitsSold_Today" type="text" runat="server" placeholder="# Units Sold" />
                            </div>
                            <div class="col-lg-3">
                                Units Sold GP
                            </div>
                            <div class="col-lg-3">
                                <input name="UnitsSoldGP_Today" id="UnitsSoldGP_Today" type="text" runat="server" placeholder="Total GP" />
                            </div>
                            <div class="col-lg-3">
                                GPPU Today (Units Sold GP/Units Sold)
                            </div>
                            <div class="col-lg-3">
                                <input name="GPPU_Today" id="GPPU" type="text" runat="server" placeholder="GPPU" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Month to Date</h4>
                            </div>
                            <div class="col-lg-3">
                                Units Delivered
                            </div>
                            <div class="col-lg-3 ">
                                <input name="UnitsDelivered_MTD" id="UnitsDelivered_MTD" type="text" runat="server" placeholder="# Units Delivered" />
                            </div>
                            <div class="col-lg-3">
                                Unit Goal Achieved (Units Delivered/Closes)
                            </div>
                            <div class="col-lg-3 ">
                                <input name="UnitGoalAchieved" id="UnitGoalAchieved" type="text" runat="server" placeholder="Unit Goal Achieved" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                            </div>
                            <div class="col-lg-3">
                                Units Sold Total GP
                            </div>
                            <div class="col-lg-3">
                                <input name="UnitsSoldTotalGP_MTD" id="UnitsSoldTotalGP_MTD" type="text" runat="server" placeholder="Total GP" />
                            </div>
                            <div class="col-lg-3">
                                GP Goal Achieved (Units Sold Total GP/Goal)
                            </div>
                            <div class="col-lg-3">
                                <input name="GPGoalAchieved" id="GPGoalAchieved" type="text" runat="server" placeholder="GP Goal Achieved" />
                            </div>
                            <div class="col-lg-3">
                                GPPU (Units Delivered MTD/Units Sold Total GP MTD)
                            </div>
                            <div class="col-lg-3">
                                <input name="MTDGPPU" id="MTDGPPU" type="text" runat="server" placeholder="MTDGPPU" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="1col-lg-3">
                                <h4>Inventory Evaluation</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                            </div>
                            <div class="col-lg-3 ">
                                <label>Used/Ready for Sale Status</label>
                            </div>
                            <div class="7u 12u(mobile)">
                                <input name="UsedReady" id="UsedReady" type="text" runat="server" placeholder="Used/Ready For Sale Status" />
                            </div>
                            <div class="col-lg-3">
                            </div>
                            <div class="col-lg-3 ">
                                <label>Model Mix</label>
                            </div>
                            <div class="7u 12u(mobile)">
                                <input name="ModelMix" id="ModelMix" type="text" runat="server" placeholder="Model Mix" />
                            </div>
                            <div class="col-lg-3">
                            </div>
                            <div class="col-lg-3 ">
                                <label>Pricing/Age</label>
                            </div>
                            <div class="7u 12u(mobile)">
                                <input name="Pricing/Age" id="PricingAge" type="text" runat="server" placeholder="Pricing/Age" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="1col-lg-3">
                                <h3>Business Office</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Today</h4>
                            </div>
                            <div class="col-lg-3">
                                Gross Profit
                            </div>
                            <div class="col-lg-3">
                                <input name="boGrossProfit_Today" id="boGrossProfit_Today" type="text" runat="server" placeholder="Gross Profit" />
                            </div>
                            <div class="col-lg-3">
                                Closes
                            </div>
                            <div class="col-lg-3">
                                <input name="boCloses_Today" id="boCloses_Today" type="text" runat="server" placeholder="Closes" />
                            </div>
                            <div class="col-lg-3">
                                GPPU Today (Gross Profit/Closes)
                            </div>
                            <div class="col-lg-3">
                                <input name="boGPPU_Today" id="boGPPU_Today" type="text" runat="server" placeholder="GPPU" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Month to Date</h4>
                            </div>
                            <div class="col-lg-3">
                                Gross Profit
                            </div>
                            <div class="col-lg-3">
                                <input name="boGrossProfit_MTD" id="boGrossProfit_MTD" type="text" runat="server" placeholder="Gross Profit" />
                            </div>
                            <div class="col-lg-3">
                                # Closes
                            </div>
                            <div class="col-lg-3">
                                <input name="boCloses_MTD" id="boCloses_MTD" type="text" runat="server" placeholder="# Closes" />
                            </div>
                            <div class="col-lg-3">
                                GPPU (Gross Profit/Closes)
                            </div>
                            <div class="col-lg-3">
                                <input name="boGPPU" id="boGPPU" type="text" runat="server" placeholder="Gross Profit" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                            </div>
                            <div class="col-lg-3">
                                Goal
                            </div>
                            <div class="col-lg-3">
                                <input name="boGoal" id="Goal" type="text" runat="server" placeholder="Goal" />
                            </div>
                            <div class="col-lg-3">
                                Business Office Goal Achievement %
                            </div>
                            <div class="col-lg-3">
                                <input name="boGoalAchievement" id="boGoalAchievement" type="text" runat="server" placeholder="Business Office Goal Achievement" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="1col-lg-3">
                                <h3>Parts & Accessories Department</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Month To Date</h4>
                            </div>
                            <div class="col-lg-3">
                                Sales
                            </div>
                            <div class="col-lg-3">
                                <input name="partsSales_MTD" id="partsSales_MTD" type="text" runat="server" placeholder="P&A Sales" />
                            </div>
                            <div class="col-lg-3">
                                Goal
                            </div>
                            <div class="col-lg-3">
                                <input name="partsGoal_MTD" id="partsGoal_MTD" type="text" runat="server" placeholder="P&A Goal" />
                            </div>
                            <div class="col-lg-3">
                                Goal Achievement % (Sales/Goal)
                            </div>
                            <div class="col-lg-3 ">
                                <input name="partsGoalAchieve" id="partsGoalAchieve" type="text" runat="server" placeholder="Goal Achievement %" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="1col-lg-3">
                                <h3>Service Department</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Month To Date</h4>
                            </div>
                            <div class="col-lg-3">
                                Sales
                            </div>
                            <div class="col-lg-3">
                                <input name="ServiceSales_MTD" id="ServiceSales_MTD" type="text" runat="server" placeholder="Service Sales" />
                            </div>
                            <div class="col-lg-3">
                                Goal
                            </div>
                            <div class="col-lg-3">
                                <input name="ServiceGoal_MTD" id="ServiceGoal_MTD" type="text" runat="server" placeholder="Service Goal" />
                            </div>
                            <div class="col-lg-3">
                                Goal Achievement % (Sales/Goal)
                            </div>
                            <div class="col-lg-3 ">
                                <input name="ServiceGoalAchivement" id="ServGoalAchivement" type="text" runat="server" placeholder="Goal Achievement %" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Customer Issues</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="CustomerIssues" id="CustomerIssues" type="text" aria-multiline="true" runat="server" placeholder="Customer Issues"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Employees Trained</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="EmployeesTrained" id="EmployeesTrained" runat="server" placeholder="Employees Trained"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <input type="submit" value="Save" name="Submit" class="special" />
                                <img src="images/spacer.gif" width="15" />
                                <input type="reset" value="Reset" name="Reset" />
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </form>

</body>
</html>

<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ContactReportWithGoals.aspx.cs" Inherits="RovingGM.ContactReportWithGoals" %>

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
    <script type="text/javascript">
        function GetDateTime() {
            var param1 = new Date();
            document.getElementById('VisitDate').value = param1;
        }
    </script>
</head>
<body onload="GetDateTime();">
    <!-- Main -->
    <form method="POST" action="ConfirmationPage" runat="server" name="theForm">
        <div id="mainContainer" class="container">
            <div class="shadowBox">
                <div class="page-container">
                    <div class="container">
                        <uc1:ucLoginStatus runat="server" ID="ucLoginStatus1" />
                        <h3>Contact Report </h3> 
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Acting General Manager</h4>
                            </div>
                            <div class="col-lg-3 ">
                                <select id="SelectGM" runat="server">
                                    <option value="0">Select General Manager</option>
                                    <option value="1">Rob Cerundo</option>
                                    <option value="2">Rob Therriault</option>
                                    <option value="3">Marc Santarpio</option>
                                    <option value="4">Ed Cote</option>
                                    <option value="5">Gary</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 ">
                                <label>Store</label>
                            </div>
                            <div class="col-lg-3 ">
                                <select id="SelectStore" runat="server">
                                    <option value="0">Select Store</option>
                                    <option value="1">Cycles!128</option>
                                    <option value="2">Greater Boston</option>
                                    <option value="3">Parkway Cycle</option>
                                    <option value="4">Plaistow Powersports</option>
                                    <option value="5">Central Mass Powersports</option>
                                </select>
                            </div>
                            <div class="col-lg-3 ">
                                <label>Date</label>
                            </div>
                            <div class="col-lg-3 ">
                                <input readonly="true" style="border:none;" name="VisitDate" type="text" id="VisitDate"  />
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
                        </div>
                        <div class="row">
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

                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                GPPU Today(Units Sold GP/Units Sold)
                            </div>
                            <div class="col-lg-3">
                                <input name="GPPUToday" type="text" runat="server" placeholder="GPPU Today" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Month to Date</h4>
                            </div>
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                Goal
                            </div>
                            <div class="col-lg-3">
                                <input name="boGoal" id="boGoal" type="text" runat="server" placeholder="Goal" />
                            </div>
                            <div class="col-lg-3">
                                Business Office Goal Achievement %
                            </div>
                            <div class="col-lg-3">
                                <input name="boGoalAchievement" id="boGoalAchievement" type="text" runat="server" placeholder="Business Office Goal Achievement" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Parts & Accessories Department</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>Month To Date</h4>
                            </div>
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                Goal Achievement % (Sales/Goal)
                            </div>
                            <div class="col-lg-3 ">
                                <input name="ServiceGoalAchivement" id="ServGoalAchivement" type="text" runat="server" placeholder="Goal Achievement %" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
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
                                <input type="submit" onclick="Submit()" value="Save" name="Submit" class="special" />
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

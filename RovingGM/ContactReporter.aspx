<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactReport.aspx.cs" Inherits="RovingGM.ContactReport" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>General Manager Contact Report </title>
    <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.dropotron.min.js"></script>
    <script src="js/jquery.scrollgress.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-layers.min.js"></script>
    <script src="js/init.js"></script>

    <noscript>
    <link rel="stylesheet" href="css/skel.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/style-wide.css" />
    </noscript>

    <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->

</head>
<body>
    <!-- Main -->
    <form method="POST" action="ConfirmationPage.aspx" runat="server" onsubmit="return Input_Validator(this)" name="theForm">
        <div id="mainContainer" class="container">
            <div class="shadowBox">
                <div class="page-container">
                    <div class="container">
                        <uc1:ucLoginStatus runat="server" ID="ucLoginStatus1" />
                        <div class="jumbotron">
                            <p class="text-danger">Sales Goals </p>
                        </div>
                        <div class="row uniform 100%">
                            <div class="6u 12u(mobile)">
                                <h4>Acting General Manager</h4>
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="3u 12u(mobile)">
                                <label>Store</label>
                            </div>
                            <div class="3u 12u(mobile)">
                                <input name="Store" id="Store" type="text" runat="server" placeholder="Store" />
                            </div>
                            <div class="3u 12u(mobile)">
                                <label>Date</label>
                            </div>
                            <div class="3u 12u(mobile)">
                                <input name="Date" id="Date" type="text" runat="server" placeholder="Date" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="3u 12u(mobile)">
                                <label>Arrival Time</label>
                            </div>
                            <div class="3u 12u(mobile)">
                                <input name="ArrivalTime" type="text" id="txtArrivaltime" placeholder="Arrival Time" />
                            </div>
                            <div class="3u 12u(mobile)">
                                <label>Departure</label>
                            </div>
                            <div class="3u 12u(mobile)">
                                <input name="Departure" id="txtDeparture" type="text" placeholder="Departure" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="12u 12u(mobile)">
                                <h3>Sales Department</h3>
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="1u 12u(mobile)">
                                <h4>Today</h4>
                            </div>
                            <div class="1u 12u(mobile)">
                                Units Sold
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="UnitsSold" id="UnitsSold" type="text" runat="server" placeholder="# Units Sold" />
                            </div>
                            <div class="1u 12u(mobile)">
                                Units Sold GP
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="TotalGP" id="TotalGP" type="text" runat="server" placeholder="Total GP" />
                            </div>
                            <div class="1u 12u(mobile)">
                                GPPU Today (Units Sold GP/Units Sold)
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="GPPU" id="GPPU" type="text" runat="server" placeholder="GPPU" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="2u 12u(mobile)">
                                <h4>Month to Date</h4>
                            </div>
                            <div class="2u 12u(mobile)">
                                Units Delivered
                            </div>
                            <div class="3u 12u(mobile)">
                                <input name="UnitsDelivered" id="UnitsDelivered" type="text" runat="server" placeholder="# Units Delivered" />
                            </div>
                            <div class="2u 12u(mobile)">
                                Unit Goal Achieved (Units Delivered/Closes)
                            </div>
                            <div class="3u 12u(mobile)">
                                <input name="UnitGoalAchieved" id="UnitGoalAchieved" type="text" runat="server" placeholder="Unit Goal Achieved" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="2u 12u(mobile)">
                            </div>
                            <div class="1u 12u(mobile)">
                                Units Sold Total GP
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="TotalGP_MTD" id="TotalGP_MTD" type="text" runat="server" placeholder="Total GP" />
                            </div>
                            <div class="1u 12u(mobile)">
                                GP Goal Achieved (Units Sold Total GP/Goal)
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="GPGoalAchieved" id="GPGoalAchieved" type="text" runat="server" placeholder="GP Goal Achieved" />
                            </div>
                            <div class="1u 12u(mobile)">
                                GPPU (Units Delivered MTD/Units Sold Total GP MTD)
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="MTDGPPU" id="MTDGPPU" type="text" runat="server" placeholder="GPPU" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="12u 12u(mobile)">
                                <h4>Inventory Evaluation</h4>
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="2u 12u(mobile)">
                            </div>
                            <div class="3u 12u(mobile)">
                                <label>Used/Ready for Sale Status</label>
                            </div>
                            <div class="7u 12u(mobile)">
                                <input name="UsedReady" id="UsedReady" type="text" runat="server" placeholder="Used/Ready For Sale Status" />
                            </div>
                            <div class="2u 12u(mobile)">
                            </div>
                            <div class="3u 12u(mobile)">
                                <label>Model Mix</label>
                            </div>
                            <div class="7u 12u(mobile)">
                                <input name="ModelMix" id="ModelMix" type="text" runat="server" placeholder="Model Mix" />
                            </div>
                            <div class="2u 12u(mobile)">
                            </div>
                            <div class="3u 12u(mobile)">
                                <label>Pricing/Age</label>
                            </div>
                            <div class="7u 12u(mobile)">
                                <input name="Pricing/Age" id="PricingAge" type="text" runat="server" placeholder="Pricing/Age" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="12u 12u(mobile)">
                                <h3>Business Office</h3>
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="1u 12u(mobile)">
                                <h4>Today</h4>
                            </div>
                            <div class="2u 12u(mobile)">
                                Gross Profit
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="GrossProfit" id="GrossProfit" type="text" runat="server" placeholder="Gross Profit" />
                            </div>
                            <div class="1u 12u(mobile)">
                                Closes
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="Closes" id="Closes" type="text" runat="server" placeholder="Closes" />
                            </div>
                            <div class="2u 12u(mobile)">
                                GPPU Today (Gross Profit/Closes)
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="BizGPPU" id="BizGPPU" type="text" runat="server" placeholder="GPPU" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="2u 12u(mobile)">
                                <h4>Month to Date</h4>
                            </div>
                            <div class="1u 12u(mobile)">
                                Gross Profit
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="GrossProfitMTD" id="GrossProfitMTD" type="text" runat="server" placeholder="Gross Profit" />
                            </div>
                            <div class="1u 12u(mobile)">
                                # Closes
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="NumCloses" id="NumCloses" type="text" runat="server" placeholder="# Closes" />
                            </div>
                            <div class="2u 12u(mobile)">
                                GPPU (Gross Profit/Closes)
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="GrossProfitMTD" id="Text1" type="text" runat="server" placeholder="Gross Profit" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="2u 12u(mobile)">
                            </div>
                            <div class="1u 12u(mobile)">
                                Gross Profit
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="GrossProfitMTD" id="Text2" type="text" runat="server" placeholder="Gross Profit" />
                            </div>
                            <div class="1u 12u(mobile)">
                                Goal
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="Goal" id="Goal" type="text" runat="server" placeholder="Goal" />
                            </div>
                            <div class="2u 12u(mobile)">
                                Business Office Goal Achievement %
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="BOGoalAchievement" id="BOGoalAchievement" type="text" runat="server" placeholder="Business Office Goal Achievement" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="12u 12u(mobile)">
                                <h3>Parts & Accessories Department</h3>
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="1u 12u(mobile)">
                                <h4>Month To Date</h4>
                            </div>
                            <div class="1u 12u(mobile)">
                                Sales
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="PASales" id="PASales" type="text" runat="server" placeholder="P&A Sales" />
                            </div>
                            <div class="1u 12u(mobile)">
                                Goal
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="PAGoal" id="PAGoal" type="text" runat="server" placeholder="P&A Goal" />
                            </div>
                            <div class="1u 12u(mobile)">
                                Goal Achievement % (Sales/Goal)
                            </div>
                            <div class="3u 12u(mobile)">
                                <input name="PAGoalAchieve" id="PAGoalAchieve" type="text" runat="server" placeholder="Goal Achievement %" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="12u 12u(mobile)">
                                <h3>Service Department</h3>
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="1u 12u(mobile)">
                                <h4>Month To Date</h4>
                            </div>
                            <div class="1u 12u(mobile)">
                                Sales
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="ServSales" id="ServSales" type="text" runat="server" placeholder="Service Sales" />
                            </div>
                            <div class="1u 12u(mobile)">
                                Goal
                            </div>
                            <div class="2u 12u(mobile)">
                                <input name="ServGoal" id="ServGoal" type="text" runat="server" placeholder="Service Goal" />
                            </div>
                            <div class="1u 12u(mobile)">
                                Goal Achievement % (Sales/Goal)
                            </div>
                            <div class="3u 12u(mobile)">
                                <input name="ServGoalAchivement" id="ServGoalAchivement" type="text" runat="server" placeholder="Goal Achievement %" />
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="12u 12u(mobile)">
                                <h3>Customer Issues</h3>
                            </div>
                        </div>
                        <div class="row uniform 100%">
                            <div class="12u 12u(mobile)">
                                <h3>Employees Trained</h3>
                            </div>
                        </div>
                        <div class="row uniform 100% align-center">
                            <div class="6u align-right">
                                <input type="submit" value="Save" name="Submit" class="special" />
                            </div>
                            <div class="6u  align-left">
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

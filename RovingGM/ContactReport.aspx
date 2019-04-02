<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ContactReport.aspx.cs" Inherits="RovingGM.ContactReport" %>

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

        function GetProfit() {
            var numVal1 = Number(document.getElementById("UnitsSoldGP_Today").value);
            var numVal2 = Number(document.getElementById("UnitsSold_Today").value);

            var profit = numVal1 / numVal2
            document.getElementById("GPPUToday").value = '$' + profit.toFixed(0);
        }

        function GetMTDProfit() {
            var numVal1 = Number(document.getElementById("UnitsSoldTotalGP_MTD").value);
            var numVal2 = Number(document.getElementById("UnitsDelivered_MTD").value);
            var profit = numVal1 / numVal2
            document.getElementById("MTDGPPU").value = '$' + profit.toFixed(0);
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
                                <input readonly="true" name="Visit_Date" style="border: none;" id="Visit_Date" type="text" runat="server" placeholder="Visit Date" />
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
                                <input onblur="GetProfit();" name="UnitsSoldGP_Today" id="UnitsSoldGP_Today" type="number" runat="server" placeholder="Total GP" />
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
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                Units Sold Total GP
                            </div>
                            <div class="col-lg-3">
                                <input onblur="GetMTDProfit();" name="UnitsSoldTotalGP_MTD" id="UnitsSoldTotalGP_MTD" type="text" runat="server" placeholder="Total GP" />
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
                                <input name="ReadyForSaleStatus" id="ReadyForSaleStatus" type="text" runat="server" placeholder="Used/Ready For Sale Status" />
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

                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Cleanliness/Organization</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="Cleanliness_Organization" id="Cleanliness_Organization" aria-multiline="true" runat="server" placeholder="Cleanliness"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Displays</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="Displays" id="Displays" aria-multiline="true" runat="server" placeholder="Displays"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Staffing Review</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="StaffingReview" id="StaffingReview" aria-multiline="true" runat="server" placeholder="Staffing Review"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Overall Business Conditions</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="OverallConditions" id="OverallConditions" aria-multiline="true" runat="server" placeholder="Overall Business Conditions"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>What is being done to improve business</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="Improve" id="Improve" aria-multiline="true" runat="server" placeholder="What is being done to improve the business?"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Website Review - Sales</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="WebsiteSales" id="WebsiteSales" aria-multiline="true" runat="server" placeholder="Website Review - Sales"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Website Review - Business Office</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="WebsiteBusOff" id="WebsiteBusOff" aria-multiline="true" runat="server" placeholder="Website Review - Business Office"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Website Review - Service</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="WebsiteService" id="WebsiteService" aria-multiline="true" runat="server" placeholder="Website Review - Service"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Website Review - Parts</h3>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="5" name="WebsiteParts" id="WebsiteParts" aria-multiline="true" runat="server" placeholder="Website Review - Parts"></textarea>
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

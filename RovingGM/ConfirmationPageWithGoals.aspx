<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmationPageWithGoals.aspx.cs" Inherits="RovingGM.ConfirmationPageWithGoals" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:ucLoginStatus runat="server" ID="ucLoginStatus1" />
        <h3>Contact Report Confirmation</h3>
        <div>
            <div title="Contact Report Results">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="121px" Width="323px" AutoGenerateRows="False" DataKeyNames="VisitId" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="VisitDate" HeaderText="Visit Date" SortExpression="VisitDate" />
                        <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival Time" SortExpression="ArrivalTime" />
                        <asp:BoundField DataField="DepartureTime" HeaderText="Departure Time" SortExpression="DepartureTime" />
                        <asp:BoundField DataField="UnitsSold_Today" HeaderText="Units SoldToday" SortExpression="UnitsSold_Today" />
                        <asp:BoundField DataField="UnitsSoldGP_Today" HeaderText="Units Sold GP Today" DataFormatString="{0:C}" SortExpression="UnitsSoldGP_Today" />
                        <asp:BoundField DataField="UnitsDelivered_MTD" HeaderText="Units Delivered MTD" SortExpression="UnitsDelivered_MTD" />
                        <asp:BoundField DataField="UnitsSoldTotalGP_MTD" HeaderText="Units Sold Total GP MTD" DataFormatString="{0:C}" SortExpression="UnitsSoldTotalGP_MTD" />
                        <asp:BoundField DataField="ReadyForSaleStatus" HeaderText="Ready For Sale Status" SortExpression="ReadyForSaleStatus" />
                        <asp:BoundField DataField="ModelMix" HeaderText="Model Mix" SortExpression="ModelMix" />
                        <asp:BoundField DataField="PricingVsAge" HeaderText="Pricing Vs Age" SortExpression="PricingVsAge" />
                        <asp:BoundField DataField="boCloses_Today" HeaderText="Business Office Closes Today" SortExpression="boCloses _Today" />
                        <asp:BoundField DataField="boGrossProfit_Today" HeaderText="Business Office Gross Profit Today" DataFormatString="{0:C}" SortExpression="boGrossProfit_Today" />
                        <asp:BoundField DataField="boCloses_MTD" HeaderText="Business Office Closes MTD" SortExpression="boCloses_MTD" />
                        <asp:BoundField DataField="boGrossProfit_MTD" HeaderText="Business Office Gross Profit MTD" DataFormatString="{0:C}" SortExpression="boGrossProfit_MTD" />
                        <asp:BoundField DataField="MTDGPPU" HeaderText="MTD GPPU" />
                        <asp:BoundField DataField="boGoal" HeaderText="boGoal" DataFormatString="{0:C}" SortExpression="boGoal" />
                        <asp:BoundField DataField="boGoalAchievement" HeaderText="Goal Achievement" />
                        <asp:BoundField DataField="partsSales_MTD" HeaderText="Parts Sales MTD" DataFormatString="{0:C0}" SortExpression="partsSales_MTD" />
                        <asp:BoundField DataField="partsGoal_MTD" HeaderText="Parts Goal MTD" DataFormatString="{0:C0}" SortExpression="partsGoal_MTD" />
                        <asp:BoundField DataField="partsGoalAchieve" HeaderText="Parts Goal %" />
                        <asp:BoundField DataField="ServiceSales_MTD" HeaderText="Service Sales MTD" DataFormatString="{0:C}" SortExpression="ServiceSales_MTD" />
                        <asp:BoundField DataField="serviceGoal_MTD" HeaderText="Service Goal MTD" DataFormatString="{0:C}" SortExpression="serviceGoal_MTD" />
                        <asp:BoundField DataField="serviceGoalAchieve" HeaderText="Service Goal %" />
                        <asp:BoundField DataField="Displays" HeaderText="Displays" SortExpression="Displays" />
                        <asp:BoundField DataField="Cleanliness_Organization" HeaderText="Cleanliness/Organization" SortExpression="Cleanliness_Organization" />
                        <asp:BoundField DataField="StaffingReview" HeaderText="Staffing Review" SortExpression="StaffingReview" />
                        <asp:BoundField DataField="OverallConditions" HeaderText="Overall Conditions" SortExpression="StaffingReview" />
                        <asp:BoundField DataField="Improve" HeaderText="Business Improvement" SortExpression="StaffingReview" />
                        <asp:BoundField DataField="WebsiteSales" HeaderText="Website Review - Sales " SortExpression="WebsiteSales" />
                        <asp:BoundField DataField="WebsiteBusOff" HeaderText="Website Review - Business Office" SortExpression="WebsiteBusOff" />
                        <asp:BoundField DataField="WebsiteService" HeaderText="Website Review - Service" SortExpression="WebsiteService" />
                        <asp:BoundField DataField="WebsiteParts" HeaderText="Website Review - Parts" SortExpression="WebsiteParts" />
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                </asp:DetailsView>
                <div><a href="EmployeesTrained.aspx"> Employees Trained</a></div>
                <div><a href="CustomerIssues.aspx">Customer Issues</a></div>
            </div>
        </div>
    </form>
</body>
</html>

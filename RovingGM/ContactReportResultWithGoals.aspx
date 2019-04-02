<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactReportResultWithGoals.aspx.cs" Inherits="RovingGM.ContactReportResultWithGoals" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Report Result Summary</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:ucLoginStatus runat="server" ID="ucLoginStatus1" />
        <h3>Contact Report Result Summary</h3>
        <div>
            <asp:GridView AlternatingRowStyle-BackColor="#DCDCDC" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" BorderStyle="Solid" CssClass="gridview1" SelectedRowStyle-BackColor="Yellow">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ManagerName" HeaderText="Manager Name" ReadOnly="True" SortExpression="ManagerName" />
                    <asp:BoundField DataField="StoreName" HeaderText="Store Name" SortExpression="StoreName" />
                    <asp:BoundField DataField="VisitDate" HeaderText="Visit Date" SortExpression="VisitDate" />
                </Columns>
            </asp:GridView>
        </div>
        <div style="height: 20px"></div>
        <div title="Contact Report Results">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="121px" Width="323px" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="VisitDate" HeaderText="Visit Date" SortExpression="VisitDate" />
                    <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival Time" SortExpression="ArrivalTime" />
                    <asp:BoundField DataField="DepartureTime" HeaderText="Departure Time" SortExpression="DepartureTime" />
                    <asp:BoundField DataField="UnitsSold_Today" HeaderText="Units Sold Today" SortExpression="UnitsSold_Today" />
                    <asp:BoundField DataField="UnitsSoldGP_Today" HeaderText="Units Sold GP Today" DataFormatString="{0:C}" SortExpression="UnitsSoldGP_Today" />
                    <asp:BoundField DataField="UnitsDelivered_MTD" HeaderText="Units Delivered_ MTD" SortExpression="UnitsDelivered_MTD" />
                    <asp:BoundField DataField="UnitsSoldTotalGP_MTD" HeaderText="Units Sold Total GP MTD" DataFormatString="{0:C}" SortExpression="UnitsSoldTotalGP_MTD" />
                    <asp:BoundField DataField="ReadyForSaleStatus" HeaderText="Ready For Sale Status" SortExpression="ReadyForSaleStatus" />
                    <asp:BoundField DataField="ModelMix" HeaderText="Model Mix" SortExpression="ModelMix" />
                    <asp:BoundField DataField="PricingVsAge" HeaderText="Pricing Vs Age" SortExpression="PricingVsAge" />
                    <asp:BoundField DataField="boCloses_Today" HeaderText="Business Office Closes Today" SortExpression="boCloses _Today" />
                    <asp:BoundField DataField="boGrossProfit_Today" HeaderText="Business Office Gross Profit Today" DataFormatString="{0:C}" SortExpression="boGrossProfit_Today" />
                    <asp:BoundField DataField="boCloses_MTD" HeaderText="Business Office Closes MTD" SortExpression="boCloses_MTD" />
                    <asp:BoundField DataField="boGrossProfit_MTD" HeaderText="Business Office Gross Profit MTD" DataFormatString="{0:C}" SortExpression="boGrossProfit_MTD" />
                    <asp:TemplateField HeaderText="Business Office MTD GPPU">
                        <ItemTemplate>
                            <asp:Label ID="boGPPU" runat="server" Text='<%# ((Eval("boCloses_MTD")).ToString()=="0.0000" || (Eval("boCloses_MTD")).ToString()=="0")?"N/A" : (Convert.ToDecimal(Eval("boCloses_MTD"))/Convert.ToDecimal(Eval("boCloses_MTD_Goal"))).ToString("0%")%>' Width="40px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="boGrossProfit_MTD_Goal" HeaderText="boGrossProfit_MTD_Goal" DataFormatString="{0:C}" SortExpression="boGrossProfit_MTD_Goal" />
                    <asp:TemplateField HeaderText="% Goal Achieved">
                        <ItemTemplate>
                            <asp:Label ID="txtBoPercentage" runat="server" Text='<%# (Eval("boGrossProfit_MTD_Goal")).ToString()=="0.0000"?"N/A" : (Convert.ToDecimal(Eval("boGrossProfit_MTD"))/Convert.ToDecimal(Eval("boGrossProfit_MTD_Goal"))).ToString("0%")%>' Width="40px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="partsSales_MTD" HeaderText="Parts Sales MTD" DataFormatString="{0:C0}" SortExpression="partsSales_MTD" />
                    <asp:BoundField DataField="partsSales_MTD_Goal" HeaderText="partsSales_MTD_Goal" DataFormatString="{0:C0}" SortExpression="partsSales_MTD_Goal" />
                    <asp:TemplateField HeaderText="% Goal Achieved">
                        <ItemTemplate>
                            <asp:Label ID="txtPartsPercentage" runat="server" Text='<%# (Eval("partsSales_MTD_Goal")).ToString()=="0.0000"?"N/A" : (Eval("partsSales_MTD_Goal")).ToString()=="0.0000"?"N/A" : (Convert.ToDecimal(Eval("partsSales_MTD"))/Convert.ToDecimal(Eval("partsSales_MTD_Goal"))).ToString("0%")%>' Width="40px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ServiceSales_MTD" HeaderText="Service Sales MTD" DataFormatString="{0:C}" SortExpression="ServiceSales_MTD" />
                    <asp:BoundField DataField="serviceSales_MTD_Goal" HeaderText="service Goal MTD" DataFormatString="{0:C}" SortExpression="serviceSales_MTD_Goal" />
                    <asp:TemplateField HeaderText="% Goal Achieved">
                        <ItemTemplate>
                            <asp:Label ID="txtServicePercentage" runat="server" Text='<%# (Eval("serviceSales_MTD_Goal")).ToString()=="0.0000"?"N/A" : (Eval("serviceSales_MTD_Goal")).ToString()=="0.0000"?"N/A" : (Convert.ToDecimal(Eval("ServiceSales_MTD"))/Convert.ToDecimal(Eval("serviceSales_MTD_Goal"))).ToString("0%")%>' Width="40px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Displays" HeaderText="Displays" SortExpression="Displays" />
                    <asp:BoundField DataField="Cleanliness_Organization" HeaderText="Cleanliness/Organization" SortExpression="Cleanliness_Organization" />
                    <asp:BoundField DataField="StaffingReview" HeaderText="Staffing Review" SortExpression="StaffingReview" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            </asp:DetailsView>
        </div>
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rovingGMConnectionString %>" SelectCommand="spSelectSingleVisit" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="2" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:rovingGMConnectionString %>" SelectCommand="spSelectAllVisits" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </form>
    *GPPU (Units Delivered MTD/Units Sold Total GP MTD)
    **GPPU Today (Gross Profit/Closes)
    ***GPPU (Gross Profit/Closes)
</body>
</html>

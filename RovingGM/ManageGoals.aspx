<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageGoals.aspx.cs" Inherits="RovingGM.ManageGoals" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Manage Goals</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="mainContainer" class="container">
            <div class="shadowBox">
                <div class="page-container">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 ">
                                <div class="table-responsive">
                                    <uc1:ucLoginStatus runat="server" ID="ucLoginStatus" />
                                    <h3>
                                        <p class="text-danger">Goals </p>
                                    </h3>
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." DataKeyNames="id" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" RowStyle="HorizontalAlign">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Store">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="cmbStore" runat="server" SelectedValue='<%# Eval("StoreID") %>'>
                                                        <asp:ListItem Value="1" Text="Cycles!128"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Greater Boston Motorsports"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="Parkway"></asp:ListItem>
                                                        <asp:ListItem Value="4" Text="Plaistow"></asp:ListItem>
                                                        <asp:ListItem Value="5" Text="Central Mass"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbStore" runat="server" Text='<%# Eval("StoreID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:DropDownList ID="cmbNewStore" runat="server">
                                                        <asp:ListItem Text="Cycles!128" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Greater Boston Motorsports" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Parkway" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Plaistow" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Central Mass" Value="5"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Units Sold Today Goal" SortExpression="UnitsSold_Today_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="UnitsSold_Today_Goal" runat="server" Text='<%# Bind("UnitsSold_Today_Goal","{0}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewboUnitsSold_Today_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelUnitsSold_Today_Goal" runat="server" Text='<%# Bind("UnitsSold_Today_Goal","{0}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Units Delivered MTD Goal" SortExpression="UnitsDelivered_MTD_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtUnitsDelivered_MTD_Goal" runat="server" Text='<%# Bind("UnitsDelivered_MTD_Goal","{0}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewUnitsDelivered_MTD_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelUnitsDelivered_MTD_Goal" runat="server" Text='<%# Bind("UnitsDelivered_MTD_Goal","{0}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Units Sold GP Today Goal" SortExpression="UnitsSoldGP_Today_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtUnitsSoldGP_Today_Goal" runat="server" Text='<%# Bind("UnitsSoldGP_Today_Goal","{0}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewUnitsSoldGP_Today_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelNewUnitsSoldGP_Today_Goal" runat="server" Text='<%# Bind("UnitsSoldGP_Today_Goal","{0}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Units Sold Total GP MTD Goal" SortExpression="UnitsSoldTotalGP_MTD_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtUnitsSoldTotalGP_MTD_Goal" runat="server" Text='<%# Bind("UnitsSoldTotalGP_MTD_Goal","{0:C}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewUnitsSoldTotalGP_MTD_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelUnitsSoldTotalGP_MTD_Goal" runat="server" Text='<%# Bind("UnitsSoldTotalGP_MTD_Goal","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Bus Off Closes Today Goal" SortExpression="boCloses_Today_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtboCloses_Today_Goal" runat="server" Text='<%# Bind("boCloses_Today_Goal","{0}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewboCloses_Today_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("boCloses_Today_Goal","{0}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Bus Office Closes MTD Goal" SortExpression="boCloses_MTD_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtboboCloses_MTD_Goall" runat="server" Text='<%# Bind("boCloses_MTD_Goal","{0}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewboCloses_MTD_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelboCloses_MTD_Goal" runat="server" Text='<%# Bind("boCloses_MTD_Goal","{0}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                            <asp:TemplateField HeaderText="Bus Off Gross Profit Today Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtboGrossProfit_Today_Goal" runat="server" Text='<%# Bind("boGrossProfit_Today_Goal","{0:C}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewboGrossProfit_Today_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("boGrossProfit_Today_Goal","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Bus Off Gross Profit MTD Goal" SortExpression="boGrossProfit_MTD_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtboGrossProfit_MTD_Goal" runat="server" Text='<%# Bind("boGrossProfit_MTD_Goal","{0:C}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewboGrossProfit_MTD_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelboGrossProfit_MTD_Goal" runat="server" Text='<%# Bind("boGrossProfit_MTD_Goal","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Parts Sales MTD Goal" SortExpression="partsSales_MTD_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtpartsSales_MTD_Goal" runat="server" Text='<%# Bind("partsSales_MTD_Goal","{0:C}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewpartsSales_MTD_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelpartsSales_MTD_Goal" runat="server" Text='<%# Bind("partsSales_MTD_Goal","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Service Sales MTD Goal" SortExpression="serviceSales_MTD_Goal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtserviceSales_MTD_Goal" runat="server" Text='<%# Bind("serviceSales_MTD_Goal","{0:C}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewboserviceSales_MTD_Goal" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelserviceSales_MTD_Goal" runat="server" Text='<%# Bind("serviceSales_MTD_Goal","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Month" SortExpression="Month">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Month") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewMonth" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Month") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="AddNew" Text="Add New"></asp:LinkButton>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesVisits.aspx.cs" Inherits="RovingGM.SalesVisits" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sales Visits</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />

</head>
<body style="margin: 5px;">
    <form id="form1" runat="server">
        <br />
        <div id="mainContainer" style="width: 100%;">
            <div class="shadowBox">
                <div style="width: 100%;">
                    <div style="width: 100%;">
                        <uc1:ucLoginStatus runat="server" ID="ucLoginStatus" />
                        <h3>Sales Visits </h3>
                        <div class="row">
                            <div class="col-lg-12 ">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." DataKeyNames="id" ShowFooter="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Visit Date" SortExpression="VisitDate">
                                                <ItemTemplate>                                      
                                                    <asp:Label ID="VisitDate" runat="server" Text='<%# Eval("VisitDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Manager" SortExpression="Manager">
                                                <ItemTemplate>
                                                    <asp:Label ID="Manager" runat="server" Text='<%# Bind("Manager") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sold Today" SortExpression="UnitsSold_Today">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtUnitsSold_Today" runat="server" Text='<%# Bind("UnitsSold_Today") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewName" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelUST" runat="server" Text='<%# Bind("UnitsSold_Today") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sold GP Today">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtUnitsSoldGP_Today" runat="server" Text='<%# Bind("UnitsSoldGP_Today","{0:C}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewUnitsSoldGP_Today" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelUSGPT" runat="server" Text='<%# Bind("UnitsSoldGP_Today","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Delivered MTD" SortExpression="UnitsDelivered_MTD">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("UnitsDelivered_MTD") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewUnitsDelivered_MTD" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelUDMTD" runat="server" Text='<%# Bind("UnitsDelivered_MTD","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sold Total GP MTD" SortExpression="UnitsSoldTotalGP_MTD">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="UnitsSoldTotalGP_MTD" runat="server" Text='<%# Eval("UnitsSoldTotalGP_MTD","{0:C}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewUnitsSoldTotalGP_MTD" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelUSTGM" runat="server" Text='<%# Bind("UnitsSoldTotalGP_MTD","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ready ForSale Status" SortExpression="ReadyForSaleStatus">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtReadyForSaleStatus" runat="server" Text='<%# Eval("ReadyForSaleStatus") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewReadyForSaleStatus" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelRFS" runat="server" Text='<%# Bind("ReadyForSaleStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Model Mix" SortExpression="ModelMix">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ModelMix") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewModelMix" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelMM" runat="server" Text='<%# Bind("ModelMix") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pricing Vs Age">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="PricingVsAge" runat="server" Text='<%# Bind("PricingVsAge") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewPricingVsAge" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelPVA" runat="server" Text='<%# Bind("PricingVsAge","{0:C}") %>'></asp:Label>
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
            <asp:Label ID="MessageLabel" ForeColor="Red" runat="server" />
        </div>
    </form>
    <br />
    <br />
    <br />
</body>

</html>

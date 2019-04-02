<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartsVisits.aspx.cs" Inherits="RovingGM.PartsVisits" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Parts Visits</title>
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
                                                    <asp:Label ID="VisitDate" runat="server" Text='<%# Bind("VisitDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Manager" SortExpression="Manager">
                                                <ItemTemplate>
                                                    <asp:Label ID="Manager" runat="server" Text='<%# Bind("Manager") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Parts Sales MTD" SortExpression="partsSales_MTD">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="partsSales_MTD" runat="server" Text='<%# Eval("partsSales_MTD","{0:C}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtpartsSales_MTD" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("partsSales_MTD","{0:C}") %>'></asp:Label>
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

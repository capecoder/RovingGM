﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeesTrained.aspx.cs" Inherits="RovingGM.EmployeesTrained" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Employees Trained</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <br />
        <div id="mainContainer" class="container">
            <div class="shadowBox">
                <div class="page-container">
                    <div class="container">
                        <uc1:ucLoginStatus runat="server" ID="ucLoginStatus" />
                        <h3>Employees Trained</h3>
                        <div class="row">
                            <div class="col-lg-12 ">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." DataKeyNames="id" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEmployeeName" runat="server" Text='<%# Eval("EmployeeName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewEmployeeName" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Topics Covered" SortExpression="TopicsCovered">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtTopicsCovered" runat="server" Text='<%# Bind("TopicsCovered") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewTopicsCovered" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TopicsCovered") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Resolution" SortExpression="Resolution">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtResolution" runat="server" Text='<%# Bind("Resolution") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNewResolution" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Resolution") %>'></asp:Label>
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
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:HyperLink ID="CustomerIssues" NavigateUrl="~/CustomerIssues.aspx" runat="server">Customer Issues</asp:HyperLink>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:HyperLink ID="LeadsContacted" NavigateUrl="~/LeadsContacted.aspx" runat="server">Leads Contacted</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <br />
    <br />
    <br />
</body>
</html>

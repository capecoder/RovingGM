<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="RovingGM.Menu" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <div id="mainContainer" class="container">
        <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <uc1:ucLoginStatus runat="server" ID="ucLoginStatus1" />
                    <h3>Menu</h3>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:HyperLink ID="DataEntryLink" NavigateUrl="~/ContactReport.aspx" runat="server">Contact Report Data Entry/Edit</asp:HyperLink>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:HyperLink ID="GoalsLink" NavigateUrl="~/ManageGoals.aspx" runat="server">Manage Goals</asp:HyperLink>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <a href="ContactReportResult.aspx">Contact Report Results Summary</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:HyperLink ID="SalesLink" runat="server" NavigateUrl="~/SalesVisits.aspx">Sales Visits</asp:HyperLink>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:HyperLink ID="IssuesLink" runat="server" NavigateUrl="~/IssuesVisits.aspx">Issues Visits</asp:HyperLink>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:HyperLink ID="PartsLink" runat="server" NavigateUrl="~/PartsVisits.aspx">Parts Visits</asp:HyperLink>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:HyperLink ID="EmployeesTrainedLink" runat="server" NavigateUrl="~/EmployeesTrained.aspx">Employees Trained</asp:HyperLink>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:HyperLink ID="CustomerIssuesLink" runat="server" NavigateUrl="~/CustomerIssues.aspx">Customer Issues</asp:HyperLink>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:HyperLink ID="LeadsLink" runat="server" NavigateUrl="~/LeadsContacted.aspx">Leads Contacted</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

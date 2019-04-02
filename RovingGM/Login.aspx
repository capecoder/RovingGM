<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RovingGM.Login" %>

<%@ Register Src="~/ucLoginStatus.ascx" TagPrefix="uc1" TagName="ucLoginStatus" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <div id="mainContainer" class="container">
        <div class="table-responsive">
            <div class="row">
                <h2>New England Power Sports</h2>
                <span class="text-info">Arlington, Beverly, Everett, Lunenburg MA; Plaistow NH</span>
            </div>
        </div>

        <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <div class="jumbotron">
                        <p class="text-danger">LOGIN </p>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <asp:Label ID="lblCookie" Visible="true" runat="server"></asp:Label>
                        </div>
                    </div>
                    <form id="Form1" method="post" runat="server">
                        <p>
                            <asp:Label ID="lblUserError" runat="server" Font-Names="Verdana" ForeColor="Navy" Font-Bold="True" Visible="False"></asp:Label><asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="True" DisplayMode="List" HeaderText="" Font-Names="Verdana"></asp:ValidationSummary>
                        </p>
                        <div id="divLogin" runat="server">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <asp:Label ID="Label1" runat="server" Width="49px">Email: </asp:Label>
                                </div>
                                <div class="col-lg-12 ">
                                    <asp:TextBox ID="txtUserEmail" runat="server" Width="258px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <asp:Label ID="Label2" runat="server">Password: </asp:Label>
                                </div>
                                <div class="col-lg-12 ">
                                    <asp:TextBox TextMode="Password" ID="txtPassword" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <br />
                                    <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <asp:RequiredFieldValidator ID="valEmailRequired" runat="server" ErrorMessage="Email is required." ControlToValidate="txtUserEmail" EnableClientScript="true" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="valPasswordRequired" runat="server" ErrorMessage="Password is required." ControlToValidate="txtPassword" EnableClientScript="true" Display="None"></asp:RequiredFieldValidator>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

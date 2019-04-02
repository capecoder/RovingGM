<%@ Page Language="c#" Inherits="RovingGM.login" CodeBehind="login.aspx.cs" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>login</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="css.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0" bottommargin="0" rightmargin="0" leftmargin="0">
    <div align="center">
        <table width="100%" bgcolor="gainsboro">
            <tr>
                <td>
                    <asp:Label ID="lblCookie" Visible="true" runat="server"></asp:Label>
                </td>
            </tr>
            <tr bgcolor="#ffffff">
                <td colspan="3" align="center"></td>
            </tr>
        </table>
        <h1>LOGIN TO WARRANTY</h1>
        <div align="center" width="450"><a class="login" href="http://pcc.newenglandpowersports.com">Login to Preferred Customer</a></div>
        <form id="Form1" method="post" runat="server">
            <p>
                <asp:Label ID="lblUserError" runat="server" Font-Names="Verdana" ForeColor="Navy" Font-Bold="True" Visible="False"></asp:Label><asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="True" DisplayMode="List" HeaderText="" Font-Names="Verdana"></asp:ValidationSummary>
            </p>
            <div id="divLogin" runat="server">
                <table width="450">
                    <tr>
                        <td class="subSectionTitle" colspan="2">Please provide the email address which the system should use to send confirmation of your warranty claims request.<br>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 246px">
                            <asp:Label ID="Label1" runat="server" Width="49px">Email: </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserEmail" runat="server" Width="258px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 246px">
                            <asp:Label ID="Label2" runat="server">Password: </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox TextMode="Password" ID="txtPassword" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click"></asp:Button>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:RequiredFieldValidator ID="valEmailRequired" runat="server" ErrorMessage="Email is required." ControlToValidate="txtUserEmail" EnableClientScript="true" Display="None"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="valPasswordRequired" runat="server" ErrorMessage="Password is required." ControlToValidate="txtPassword" EnableClientScript="true" Display="None"></asp:RequiredFieldValidator>
        </form>
    </div>
</body>
</html>

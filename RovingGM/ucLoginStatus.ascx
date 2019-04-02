<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLoginStatus.ascx.cs" Inherits="RovingGM.ucLoginStatus" %>
<div class="table-responsive">
    <div class="row">
        <h2>New England Power Sports</h2>
        <span class="text-info">Arlington, Beverly, Everett, Lunenburg MA; Plaistow NH</span>
        <div class="row">
            <div class="col-lg-12 ">
                Logged in as
			<asp:Label ID="lblLoginName" runat="server" Width="128px"></asp:Label>
            </div>
            <div class="col-lg-12 "><a href="menu.aspx">MENU</a></div>
            <div class="col-lg-12 "><a href="login.aspx?logout=Y">Log out</a></div>
        </div>
    </div>
</div>


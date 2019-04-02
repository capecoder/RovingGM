<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SummaryReport.aspx.cs" Inherits="RovingGM.SummaryReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roving GM Summary Report</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>

<body>

    <div>
        <div id="mainContainer" class="container">
            <div class="shadowBox">
                <div class="page-container">
                    <div class="container">
                        <uc1:ucloginstatus runat="server" id="ucLoginStatus" />
                        <div class="jumbotron">
                            <p class="text-danger">Summary Report </p>
                        </div>
                        <form id="form1" runat="server">
                            <div class="form-group">
                                <label for="email">Email address:</label>
                                <input type="email" class="form-control" id="email" />
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="pwd" />
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" />
                                    Remember me</label>
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
</body>
</html>

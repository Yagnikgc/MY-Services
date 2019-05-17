<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProviderDashBoard.aspx.cs" Inherits="MY_Service.Pages.ProviderDashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div style="height:auto">
        <form runat="server">
            <asp:LinkButton ID="btn_logout" runat="server" OnClick="btn_logout_Click" Style="padding-left:95%;color:#1e5e66;font-weight:bold;cursor:pointer;text-decoration:none" Text="Logout" />
        </form>
        <iframe id="frame1" runat="server" style="width:100%;min-height:700px"></iframe>
    </div>
</body>
</html>

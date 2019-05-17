<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewProvider.aspx.cs" Inherits="MY_Service.Admin.viewProvider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Providers</title>
    <style>
        h1 {
            color:#1e5e66;
        }
        div {
            border:1.5px solid #1e5e66;
            border-radius:8px;
            overflow-x:auto;
        }
        table {
            border-collapse:collapse;
        }
        th {
            text-align:center;
            padding:15px;
            background-color:#1e5e66;
            font-size:20px;
            color:white;
        }
        td {
            padding:15px;
        }
        tr:nth-child(even) {
            background-color:#afdade;
        }
        tr:nth-child(odd) {
            background-color:#609096;
        }
        tr:hover {
            background-color:#f5f5f5;
        }
    </style>
</head>
<body><form runat="server">
    <center>
    <div>
        <h1>PROVIDER DATA</h1>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table><tr><th>Provider Name</th><th>Service Type</th><th>Provider E-Mail</th><th>Mobile Number</th><th>Status</th><th>Approve</th></tr>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="lblProId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <tr>
                    <td><asp:Label ID="lblName" CssClass="lbl_category" runat="server" Text='<%# Eval("UName") %>' /></td>
                    <td><asp:Label ID="lblCat" CssClass="lbl_category" runat="server" Text='<%# Eval("Name") %>' /></td>
                    <td><asp:Label ID="lblMail" CssClass="lbl_category" runat="server" Text='<%# Eval("Mail") %>' /></td>
                    <td><asp:Label ID="lblSubject" CssClass="lbl_category" runat="server" Text='<%# Eval("Mob") %>' /></td>
                    <td><asp:Label ID="lblStatus" CssClass="lbl_category" runat="server" Text='<%# Eval("stts") %>' /></td>
                    <td><asp:LinkButton ID="approve" runat="server" style="text-decoration:none" OnClick="approve_Click">Approve</asp:LinkButton></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <br />
    </div>
        </center></form>
</body>
</html>

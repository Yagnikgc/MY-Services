<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userData.aspx.cs" Inherits="MY_Service.Admin.userData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Data</title>
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
<body>
    <center>
    <div>
        <h1>USER DATA</h1>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table><tr><th>Provider Name</th><th>Provider E-Mail</th><th>Mobile Number</th><th>User Type</th></tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:Label ID="lblName" CssClass="lbl_category" runat="server" Text='<%# Eval("name") %>' /></td>
                    <td><asp:Label ID="Label1" CssClass="lbl_category" runat="server" Text='<%# Eval("email") %>' /></td>
                    <td><asp:Label ID="lblSubject" CssClass="lbl_category" runat="server" Text='<%# Eval("mobileno") %>' /></td>
                    <td><asp:Label ID="Label2" CssClass="lbl_category" runat="server" Text='<%# Eval("userType").ToString()=="c"?"Customer":"Provider" %>' /></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <br />
    </div>
        </center>
</body>
</html>

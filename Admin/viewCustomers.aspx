<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCustomers.aspx.cs" Inherits="MY_Service.Admin.viewCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers</title>
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
        <h1>CUSTOMER DATA</h1>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table><tr><th>Customer Name</th><th>Customer E-Mail</th><th>Mobile Number</th></tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:Label ID="lblName" CssClass="lbl_category" runat="server" Text='<%# Eval("name") %>' /></td>
                    <td><asp:Label ID="Label1" CssClass="lbl_category" runat="server" Text='<%# Eval("email") %>' /></td>
                    <td><asp:Label ID="lblSubject" CssClass="lbl_category" runat="server" Text='<%# Eval("mobileno") %>' /></td>
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

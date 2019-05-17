<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="MY_Service.Admin.Reviews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reviews</title>
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
        <h1>REVIEWS OF CUSTOMER</h1>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table><tr><th>Reviewer Name</th><th>Reviewer E-Mail</th><th>Review Subject</th><th>Review Message</th></tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:Label ID="lblName" CssClass="lbl_category" runat="server" Text='<%# Eval("name") %>' /></td>
                    <td><asp:Label ID="Label1" CssClass="lbl_category" runat="server" Text='<%# Eval("email") %>' /></td>
                    <td><asp:Label ID="lblSubject" CssClass="lbl_category" runat="server" Text='<%# Eval("Subject") %>' /></td>
                    <td><asp:Label ID="lblMessage" CssClass="lbl_category" runat="server" Text='<%# Eval("Message") %>' /></td>
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

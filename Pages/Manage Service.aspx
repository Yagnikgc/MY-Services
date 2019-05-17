<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage Service.aspx.cs" Inherits="MY_Service.Pages.Manage_Service" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MY Service</title>
    <link rel="shortcut icon" href="../Images/My%20Service%20Logo.png" />
    <style>
        body {
            font-family: Arial;
        }

        /* Style the tab */
        div.tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

            /* Style the buttons inside the tab */
            div.tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

                /* Change background color of buttons on hover */
                div.tab button:hover {
                    background-color: #1e5e66;
                }

                /* Create an active/current tablink class */
                div.tab button.active {
                    background-color: #ccc;
                }

        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        h3 {
            color: #1e5e66;
        }

        div {
            border: 1.5px solid #1e5e66;
            border-radius: 8px;
            overflow-x: auto;
        }

        table {
            border-collapse: collapse;
        }

        th {
            text-align: center;
            padding: 15px;
            background-color: #1e5e66;
            font-size: 20px;
            color: white;
        }

        td {
            padding: 15px;
        }

        tr:nth-child(even) {
            background-color: #afdade;
        }

        tr:nth-child(odd) {
            background-color: #609096;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div style="list-style:none"><li>
        <a href="Customer.aspx">
            <img id="logo" src="../Images/My Service Logo.png" height="80" style="padding:15px" alt="MY Service" /></a></li>
        <li style="text-align:right;margin-top:-20px;margin-right:20px;color:#1e5e66">
        <a href="Customer.aspx" style="font-size:20px;text-decoration:none;color:#1e5e66;margin-right:10px;">Home</a>
            <asp:Label ID="Uname" runat="server" style="font-weight:bold;margin-right:20px;font-size:20px"></asp:Label>
        </li>
        <br />
        </div>
    <div style="background-color: #1e5e66; height: 3%; width: 100%; padding-top: 0px">
        <center>
            <br />
        <p style="color:lightgray;font-size:50px">Manage your service here!!!!</p>
            </center>
    </div>
    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'ChoosePro')">Choose Provider</button>
        <button class="tablinks" onclick="openCity(event, 'Cancel')">Cancel Service</button>
        <button class="tablinks" onclick="openCity(event, 'Service')">Your Services</button>
    </div>
    <form runat="server">
        <div id="ChoosePro" class="tabcontent">
            <h3>Choose Your Service Provider</h3>
            <asp:Repeater ID="repeater1" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Provider Name</th>
                            <th>Service Name</th>
                            <th>Requested Date</th>
                            <th>Complition Date</th>
                            <th>Amount</th>
                            <th></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSRId" runat="server" Text='<%# Eval("srId") %>' Visible="false" />
                    <asp:Label ID="lblProId" runat="server" Text='<%# Eval("ProviderId") %>' Visible="false" />
                    <tr>
                        <td><%# Eval("name") %></td>
                        <td><%# Eval("catName") %></td>
                        <td><%# Eval("placedDate") %></td>
                        <td><%# Eval("complitionDate") %></td>
                        <td><%# Eval("amount") %></td>
                        <td>
                            <asp:LinkButton ID="apply" runat="server" Style="text-decoration: none" OnClick="apply_Click">Approve</asp:LinkButton></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <div id="Cancel" class="tabcontent">
            <h3>Cancel Your requested Service</h3>
            <asp:Repeater ID="repeater2" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Provider Name</th>
                            <th>Service Name</th>
                            <th>Requested Date</th>
                            <th>Complition Date</th>
                            <th>Amount</th>
                            <th></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSRId" runat="server" Text='<%# Eval("srId") %>' Visible="false" />
                    <tr>
                        <td><%# Eval("name") %></td>
                        <td><%# Eval("catName") %></td>
                        <td><%# Eval("placedDate") %></td>
                        <td><%# Eval("complitionDate") %></td>
                        <td><%# Eval("amount") %></td>
                        <td>
                            <asp:LinkButton ID="cancel" runat="server" Style="text-decoration: none" OnClick="cancel_Click">Cancel</asp:LinkButton></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <div id="Service" class="tabcontent">
            <h3>Your Services</h3>
            <asp:Repeater ID="repeater3" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Provider Name</th>
                            <th>Service Name</th>
                            <th>Requested Date</th>
                            <th>Complition Date</th>
                            <th>Amount</th>
                            <th>Service Status</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSRId" runat="server" Text='<%# Eval("srId") %>' Visible="false" />
                    <tr>
                        <td><%# Eval("name") %></td>
                        <td><%# Eval("catName") %></td>
                        <td><%# Eval("placedDate") %></td>
                        <td><%# Eval("complitionDate") %></td>
                        <td><%# Eval("amount") %></td>
                        <td><%# Eval("status") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
    <script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
    </script>
</body>
</html>

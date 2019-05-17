<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="MY_Service.Admin.Category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Categories</title>
    <link href="css_category.css" rel="stylesheet" />
</head>
<body>
    <form id="form2" runat="server">
        <center>
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <div class="panel panel-default" style="padding: 10px; margin: 10px;">
            <div id="Tabs" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li><a href="#addCategory" aria-controls="addCategory" role="tab" data-toggle="tab">Add Category </a></li>
                    <li><a href="#addSubCategory" aria-controls="addSubCategory" role="tab" data-toggle="tab">Add Sub-category</a></li>
                    <li><a href="#removeCategory" aria-controls="removeCategory" role="tab" data-toggle="tab">Remove Category</a></li>
                    <li><a href="#removeSubCategory" aria-controls="removeSubCategory" role="tab" data-toggle="tab">Remove Sub-category</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content" style="padding-top: 20px">
                    <div role="tabpanel" class="tab-pane active" id="addCategory">
                        <span style="display:inline-block;list-style:none">
                            <ui>
                                <li><asp:Label runat="server" CssClass="lable" Text="Category Name :  " /><asp:TextBox ID="catName" CssClass="textBox" runat="server" /></li>
                                <li><asp:Label ID="errName" runat="server" /></li>
                                <br />
                            </ui>
                            <ui>
                                <li><asp:Label runat="server" CssClass="lable" Text="Upload Image :" /><asp:FileUpload ID="FileUpload1" runat="server"/></li>
                                <br />
                            </ui>
                            <ui>
                                <li><asp:Label ID="lbl_status" runat="server" /></li>
                                <li><asp:Button ID="upload" runat="server" CssClass="deleteButton"  Text="Add Category" OnClick="upload_Click" />
                                        <input type="reset" id="reset" class="deleteButton"  value="Reset" /></li>
                            </ui>
                        </span>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="addSubCategory">
                        <span style="display:inline-block;list-style:none">
                            <ui>
                                <li><asp:Label runat="server" Text="Sub-Category Name :" CssClass="lable" /><asp:TextBox ID="subcatName" CssClass="textBox" runat="server" /></li>
                                <li><asp:Label ID="errSubCatName" runat="server" /></li><br />
                            </ui>
                            <ui>
                                <li><asp:Label runat="server" Text="Upload Image :" CssClass="lable"/><asp:FileUpload ID="FileUpload2" runat="server" /></li>
                                <br />
                            </ui>
                            <ui>
                                <li><asp:Label runat="server" Text="Choose Main Category :  " CssClass="lable" /><div style="width:182px;overflow:hidden"><asp:DropDownList ID="ddl_SubCat" style="font-size:18px;height:40px;width:200px;border:1px solid #1e5e66;border-radius:2px;" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true"><asp:ListItem Value="0">Main Category</asp:ListItem></asp:DropDownList></div></li>
                                <li><asp:Label ID="lbl_ddl" runat="server" /></li>
                                <br /><br />
                            </ui>
                            <ui>
                                <li><asp:Label ID="lbl_status1" runat="server" /></li>
                                <li><asp:Button ID="addSubCat" runat="server" CssClass="deleteButton" Text="Add Sub-Category" OnClick="addSubCat_Click" />
                                        <input type="reset" id="reset1" class="deleteButton" value="Reset" /></li>
                            </ui>
                        </span>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="removeCategory">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <span style="display: inline-block; list-style: none;text-align:center"></li>
                                        <li><asp:Label ID="lblCatId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                                        <li><asp:Image AlternateText="categoryImage" style="height:160px;width:160px" ID="categoryImage" runat="server" ImageUrl='<%# "~/Images/Category/"+System.Convert.ToString(Eval("Image")) %>' /></li>
                                        <li><asp:Label ID="lblContactName" CssClass="lbl_category" runat="server" Text='<%# Eval("Name") %>' /><br /><br /></li>
                                        <li><asp:LinkButton ID="lnkDelete" Text="Delete" CssClass="deleteButton" runat="server" OnClick="OnDelete" /></li>
                                    </span>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="removeSubCategory">
                        <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                            <ItemTemplate>
                                <span style="list-style: none;">
                                    <br />
                                        <asp:Label ID="lblMainCatId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                                        <li><asp:Label ID="lblCatName" CssClass="lbl_categorySub" runat="server" Text='<%# Eval("Name") %>' /><hr /></li>
                                        <asp:Repeater ID="Repeater3" runat="server">
                                            <ItemTemplate>
                                                <span style="display: inline-block; list-style: none;text-align:center;padding:0 0 30px 30px;"></li>
                                                <li><asp:Label ID="lblSubCatId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                                                <li><asp:Image AlternateText="subCategoryImage" style="height:50px;width:50px" ID="categoryImage" runat="server" ImageUrl='<%# "~/Images/subCategory/"+System.Convert.ToString(Eval("Image")) %>' /></li>
                                                <li><h3><asp:Label ID="lbl_Sub_Name" CssClass="lbl_category" runat="server" Text='<%# Eval("Name") %>' /></h3><br /><br /></li>
                                                <li><asp:LinkButton ID="lb_Delete_Sub" Text="Delete" CssClass="deleteButton" runat="server" OnClick="lb_Delete_Sub_Click" /></li>
                                                </span>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </span>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
            </center>
    </form>
</body>
</html>

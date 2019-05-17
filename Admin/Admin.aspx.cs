using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MY_Service.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString()!="Admin")
                Response.Redirect("~/Pages/LogIn.aspx");
            else
            Uname.Text = Session["UNAME"].ToString();
        }
    }
}
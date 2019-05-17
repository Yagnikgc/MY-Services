using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MY_Service.Admin
{
    public partial class viewCustomers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString() != "Admin")
                Response.Redirect("~/Pages/LogIn.aspx");
            Repeater1.DataSource = BindRepeater();
            Repeater1.DataBind();
        }
        private DataTable BindRepeater()
        {
            SqlCommand cmd = new SqlCommand("select * from UserData where userType='c'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }
    }
}
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
    public partial class Reviews : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString() != "Admin")
                Response.Redirect("LogIn.aspx");
            Repeater1.DataSource = BindRepeater();
            Repeater1.DataBind();
        }
        private DataTable BindRepeater()
        {
            SqlCommand cmd = new SqlCommand("REVIEW", con);
            cmd.Parameters.AddWithValue("@Action","SELECT");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }
    }
}
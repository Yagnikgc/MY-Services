using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MY_Service.Pages
{
    public partial class ProviderDashBoard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERID"] == null || Session["Utype"].ToString() != "p")
                Response.Redirect("LogIn.aspx");
            else
            {
                String q = "select count(*) from tbl_providerCategory where providerId='" + Session["USERID"] + "'";
                SqlCommand com = new SqlCommand(q, con);
                con.Open();
                int usercount = (Int32)com.ExecuteScalar();// for taking single value
                con.Close();
                if (usercount == 0)
                    frame1.Src = "~/Pages/Provider.aspx";
                else
                {
                    String q1 = "select status from tbl_providerCategory where providerId='" + Session["USERID"] + "'";
                    SqlCommand cmd = new SqlCommand(q1, con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Read();
                    string sts = dr[0].ToString();
                    con.Close();
                    if (sts == "pending")
                        frame1.Src = "~/Pages/WaitForApproval.aspx";
                    else
                        frame1.Src = "~/Pages/ProvideService.aspx";
                }
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session["UNAME"] = "";
            Response.Redirect("../Pages/Home.aspx");
        }
    }
}
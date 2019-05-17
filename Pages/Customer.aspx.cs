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
    public partial class Customer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString()!="c")
                Response.Redirect("LogIn.aspx");
            else
                Uname.Text = Session["UNAME"].ToString();
            if (!IsPostBack)
            {
                BindCategory();
                Repeater1.DataSource = BindRepeater();
                Repeater1.DataBind();
            }
        }
        private void BindCategory()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_category",con);
            cmd.ExecuteNonQuery();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            sda.Dispose();
            category.DataSource = dt;
            category.DataBind();
        }

        protected void categoryName_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int catId = int.Parse((item.FindControl("lblsubCatId") as Label).Text);

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_sub_category where main_category='" + catId + "' order by Name", con);
            cmd.ExecuteNonQuery();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            sda.Dispose();
            subcategory.DataSource = dt;
            subcategory.DataBind();
            string script = "window.onload = function(){pop('subCatDiv')};";
            ClientScript.RegisterStartupScript(this.GetType(),"pop('subCatDiv')",script,true);
        }
        private DataTable BindRepeater()
        {
            SqlCommand cmd = new SqlCommand("REVIEW", con);
            cmd.Parameters.AddWithValue("@Action", "SELECTTOP");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }
    }
}
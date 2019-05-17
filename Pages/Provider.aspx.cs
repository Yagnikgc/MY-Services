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
    public partial class Provider : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString()!="p")
                Response.Redirect("LogIn.aspx");
            else if (((string)Session["Utype"]) == "p")
                Uname.Text=Session["UNAME"].ToString();
            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand("select Id,name from tbl_category", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                sda.Dispose();
                category.DataTextField = "name";
                category.DataValueField = "Id";
                category.DataSource = dt;
                category.DataBind();
            //    Repeater1.DataSource=BindRepeater();
            //    Repeater1.DataBind();
            }
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {

        }
        private DataTable BindRepeater()
        {
            SqlCommand cmd = new SqlCommand("select srId,placedDate from tbl_ServiceRecord join UserData on tbl_ServiceRecord.customerId=UserData.Id where status='placed'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }

        protected void category_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select Id,name from tbl_sub_category where main_category='"+category.SelectedItem.Value+"'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            subCategory.DataTextField = "name";
            subCategory.DataValueField = "Id";
            subCategory.DataSource = dt;
            subCategory.DataBind();
        }

        protected void btn_apply_Click(object sender, EventArgs e)
        {
            int flag=0;
            int id = int.Parse(Session["USERID"].ToString());
            SqlCommand com = new SqlCommand("select count(Id) from tbl_providerCategory where providerId=@pid and subCategoryId=@subId", con);
            com.Parameters.AddWithValue("@pid", id);
            com.Parameters.AddWithValue("@subId", subCategory.SelectedItem.Value);
            con.Open();
            int count = (Int32)com.ExecuteScalar();// for taking single value
            con.Close();
            if (count == 0)  
                stats.Text = "<br><br>";
            else
            { stats.Text = "Service Already Requsted !"; flag++; }
            if (flag == 0)
            {
                
                SqlCommand cmd = new SqlCommand("insert into tbl_providerCategory values(@proId,@subId,@status,@pdate)", con);
                cmd.Parameters.AddWithValue("@proId", id);
                cmd.Parameters.AddWithValue("@subId", subCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@pdate", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@status", "pending");
                con.Open();
                int st = cmd.ExecuteNonQuery();
                con.Close();
                if (st != 0)
                {
                    Response.Write(@"<script language='javascript'>alert('SERVICE SUCCESSFULLY REQUSTED')</script>");
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
        }
    }
}
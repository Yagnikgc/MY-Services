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
    public partial class Manage_Service : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString()!="c")
                Response.Redirect("~/Pages/LogIn.aspx");
            else
            {
                Uname.Text = Session["UNAME"].ToString();
                repeater1.DataSource = BindRepeater1();
                repeater1.DataBind();
                repeater2.DataSource = BindRepeater2();
                repeater2.DataBind();
                repeater3.DataSource = BindRepeater3();
                repeater3.DataBind();
            }
        }
        private DataTable BindRepeater1()
        {
            int cusId = int.Parse(Session["USERID"].ToString());
            //String q = "select tbl_ServiceRecord.srId,tbl_sub_category.Name as catName,UserData.name,tbl_ServiceRecord.placedDate,tbl_ServiceRecord.complitionDate,tbl_ServiceRecord.amount from tbl_ServiceRecord join UserData on tbl_ServiceRecord.customerId=UserData.Id join tbl_sub_category on tbl_ServiceRecord.subCategoryId=tbl_sub_category.Id where status='placed' and tbl_ServiceRecord.customerId='" + Session["USERID"] + "'";
            String q = "select tbl_ServiceRecord.srId,UserData.name,tbl_sub_category.Name as catName,tbl_ServiceRecord.placedDate,tbl_ServiceRecord.complitionDate,tbl_ProviderRequest.ProviderId,tbl_ServiceRecord.amount from tbl_ProviderRequest join tbl_ServiceRecord on tbl_ProviderRequest.ServiceRecordId=tbl_ServiceRecord.srId join UserData on tbl_ProviderRequest.ProviderId=UserData.Id join tbl_sub_category on tbl_sub_category.Id=tbl_ServiceRecord.subCategoryId where tbl_ServiceRecord.status='placed' and tbl_ServiceRecord.customerId='" + cusId + "'";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }

        protected void apply_Click(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int SRId = int.Parse((item.FindControl("lblSRId") as Label).Text);
            int ProId = int.Parse((item.FindControl("lblProId") as Label).Text);

            String q = "update tbl_ServiceRecord set status='pending',providerId='"+ProId+"' where srId='"+SRId+"'";
            SqlCommand cmd = new SqlCommand(q, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            repeater1.DataSource = BindRepeater1();
            repeater1.DataBind();
            repeater2.DataSource = BindRepeater2();
            repeater2.DataBind();
            repeater3.DataSource = BindRepeater3();
            repeater3.DataBind();
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int SRId = int.Parse((item.FindControl("lblSRId") as Label).Text);

            String q = "update tbl_ServiceRecord set status='canceled' where srId='" + SRId + "'";
            SqlCommand cmd = new SqlCommand(q, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            repeater1.DataSource = BindRepeater1();
            repeater1.DataBind();
            repeater2.DataSource = BindRepeater2();
            repeater2.DataBind();
            repeater3.DataSource = BindRepeater3();
            repeater3.DataBind();
        }
        private DataTable BindRepeater2()
        {
            int cusId = int.Parse(Session["USERID"].ToString());
            String q = "select tbl_ServiceRecord.srId,UserData.name,tbl_sub_category.Name as catName,tbl_ServiceRecord.placedDate,tbl_ServiceRecord.complitionDate,tbl_ServiceRecord.amount from tbl_ProviderRequest join tbl_ServiceRecord on tbl_ProviderRequest.ServiceRecordId=tbl_ServiceRecord.srId join UserData on tbl_ProviderRequest.ProviderId=UserData.Id join tbl_sub_category on tbl_sub_category.Id=tbl_ServiceRecord.subCategoryId where status='placed' or status='pending' and customerId='" + cusId + "'";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }
        private DataTable BindRepeater3()
        {
            int cusId = int.Parse(Session["USERID"].ToString());
            String q = "select tbl_ServiceRecord.srId,UserData.name,tbl_sub_category.Name as catName,tbl_ServiceRecord.placedDate,tbl_ServiceRecord.complitionDate,tbl_ServiceRecord.amount,tbl_ServiceRecord.status from tbl_ProviderRequest join tbl_ServiceRecord on tbl_ProviderRequest.ServiceRecordId=tbl_ServiceRecord.srId join UserData on tbl_ProviderRequest.ProviderId=UserData.Id join tbl_sub_category on tbl_sub_category.Id=tbl_ServiceRecord.subCategoryId where tbl_ServiceRecord.customerId='" + cusId + "'";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }
    }
}
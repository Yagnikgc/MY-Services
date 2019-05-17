using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace MY_Service.Pages
{
    public partial class ProvideService : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString() != "p")
                Response.Redirect("~/Pages/LogIn.aspx");
            else
            {
                Uname.Text = Session["UNAME"].ToString();
                repeater1.DataSource = BindRepeater();
                repeater1.DataBind();
                repeater2.DataSource = BindRepeater1();
                repeater2.DataBind();
                repeater3.DataSource = BindRepeater2();
                repeater3.DataBind();
            }
        }
        private DataTable BindRepeater()
        {
            String query = "select subCategoryId from tbl_providerCategory where providerId='"+Session["USERID"]+"'";
            con.Open();
            SqlCommand com = new SqlCommand(query,con);
            int id = (int)com.ExecuteScalar();
            con.Close();
            String q = "select tbl_ServiceRecord.srId,UserData.name,tbl_ServiceRecord.address,tbl_ServiceRecord.complitionDate,tbl_ServiceRecord.amount from tbl_ServiceRecord join UserData on tbl_ServiceRecord.customerId=UserData.Id where status='placed' and (select count(*) from tbl_ProviderRequest where ServicerecordId=srId)=0 and tbl_ServiceRecord.subCategoryId='" + id + "' order by tbl_ServiceRecord.complitionDate";
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
            int ProId = int.Parse(Session["USERID"].ToString());

            con.Open();
            String q = "insert into tbl_ProviderRequest values('"+SRId+"','"+ProId+"','"+Session["UNAME"].ToString()+"')";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();

            SqlCommand com = new SqlCommand("select name,email from UserData where Id=(select customerId from tbl_ServiceRecord where srId='" + SRId + "')", con);
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            string uname = dr[0].ToString();
            string uEmail = dr[1].ToString();
            dr.Close();

            SqlCommand com1 = new SqlCommand("select name from UserData where Id='" + ProId + "'", con);
            SqlDataReader dr1 = com1.ExecuteReader();
            dr1.Read();
            string Proname = dr1[0].ToString();
            dr1.Close();

            SqlCommand com2 = new SqlCommand("select Name from tbl_sub_category where Id = (select subCategoryId from tbl_providerCategory where providerId='" + ProId + "')", con);
            SqlDataReader dr2 = com2.ExecuteReader();
            dr2.Read();
            string Sercvice = dr2[0].ToString();
            dr2.Close();

            SqlCommand com3 = new SqlCommand("select placedDate from tbl_ServiceRecord where srId = '" + SRId + "'", con);
            SqlDataReader dr3 = com3.ExecuteReader();
            dr3.Read();
            string SercviceDate = dr3[0].ToString();
            con.Close();
            dr3.Close();
            repeater1.DataSource = BindRepeater();
            repeater1.DataBind();

            String ToEmail = uEmail;
            MailMessage passrectmail = new MailMessage("myservices121@gmail.com", ToEmail);
            String UserName = uname;
            String EmailBody = "<html><body><h2>Hi <b>" + UserName + "</b>,</h2><br/><b>" + Proname + "</b> wants to provide you service for your request of <b>'" + Sercvice + "'</b> placed on : <b>" + SercviceDate + ".</b><br/></body></html>";
            passrectmail.Body = EmailBody;
            passrectmail.IsBodyHtml = true;
            passrectmail.Subject = "MY Services";
            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
            SMTP.Credentials = new NetworkCredential("myservices121@gmail.com", "tingtotong");
            SMTP.EnableSsl = true;
            SMTP.Send(passrectmail);
        }

        private DataTable BindRepeater1()
        {
            String query = "select subCategoryId from tbl_providerCategory where providerId='" + Session["USERID"] + "'";
            con.Open();
            SqlCommand com = new SqlCommand(query, con);
            int id = (int)com.ExecuteScalar();
            con.Close();
            String q = "select tbl_ServiceRecord.srId,UserData.name,tbl_ServiceRecord.address,tbl_ServiceRecord.complitionDate,tbl_ServiceRecord.amount from tbl_ServiceRecord join UserData on tbl_ServiceRecord.customerId=UserData.Id where status='pending' and tbl_ServiceRecord.providerId='" + Session["USERID"].ToString() + "' order by tbl_ServiceRecord.complitionDate";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }

        protected void complete_Click(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int SRId = int.Parse((item.FindControl("lblSrId") as Label).Text);
            int ProId = int.Parse(Session["USERID"].ToString());

            con.Open();
            String q = "update tbl_ServiceRecord set status='completed' where srId='"+SRId+"'";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();

            SqlCommand com = new SqlCommand("select name,email from UserData where Id=(select customerId from tbl_ServiceRecord where srId='" + SRId + "')", con);
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            string uname = dr[0].ToString();
            string uEmail = dr[1].ToString();
            dr.Close();

            SqlCommand com1 = new SqlCommand("select name from UserData where Id='" + ProId + "'", con);
            SqlDataReader dr1 = com1.ExecuteReader();
            dr1.Read();
            string Proname = dr1[0].ToString();
            dr1.Close();

            SqlCommand com2 = new SqlCommand("select Name from tbl_sub_category where Id = (select subCategoryId from tbl_providerCategory where providerId='" + ProId + "')", con);
            SqlDataReader dr2 = com2.ExecuteReader();
            dr2.Read();
            string Sercvice = dr2[0].ToString();
            dr2.Close();

            SqlCommand com3 = new SqlCommand("select placedDate from tbl_ServiceRecord where srId = '" + SRId + "'", con);
            SqlDataReader dr3 = com3.ExecuteReader();
            dr3.Read();
            string SercviceDate = dr3[0].ToString();
            con.Close();
            dr3.Close();
            repeater2.DataSource = BindRepeater1();
            repeater2.DataBind();

            String ToEmail = uEmail;
            MailMessage passrectmail = new MailMessage("myservices121@gmail.com", ToEmail);
            String UserName = uname;
            String EmailBody = "<html><body><h2>Hi <b>" + UserName + "</b>,</h2><br/><b>" + Proname + "</b> has completed your request of <b>'" + Sercvice + "'.</b><br/> Placed Date : <b>" + SercviceDate + "</b><br/> Complition Date : <b>" + DateTime.Now.ToString() + "</b><br/></body></html>";
            passrectmail.Body = EmailBody;
            passrectmail.IsBodyHtml = true;
            passrectmail.Subject = "MY Services";
            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
            SMTP.Credentials = new NetworkCredential("myservices121@gmail.com", "tingtotong");
            SMTP.EnableSsl = true;
            SMTP.Send(passrectmail);
        }

        private DataTable BindRepeater2()
        {
            String query = "select subCategoryId from tbl_providerCategory where providerId='" + Session["USERID"] + "'";
            con.Open();
            SqlCommand com = new SqlCommand(query, con);
            int id = (int)com.ExecuteScalar();
            con.Close();
            String q = "select tbl_ServiceRecord.srId,UserData.name,tbl_ServiceRecord.address,tbl_ServiceRecord.complitionDate,tbl_ServiceRecord.amount from tbl_ServiceRecord join UserData on tbl_ServiceRecord.customerId=UserData.Id where tbl_ServiceRecord.providerId='" + Session["USERID"].ToString() + "' order by tbl_ServiceRecord.complitionDate";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            return dt;
        }
        
    }
}
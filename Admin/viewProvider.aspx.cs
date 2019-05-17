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

namespace MY_Service.Admin
{
    public partial class viewProvider : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString()!="Admin")
                Response.Redirect("~/Pages/LogIn.aspx");
            BindRepeater();
            
        }
        private void BindRepeater()
        {
            SqlCommand cmd = new SqlCommand("select tbl_providercategory.Id as Id,UserData.name as UName,tbl_sub_category.Name as Name,UserData.email as Mail,UserData.mobileno as Mob,tbl_providerCategory.status as stts from tbl_providerCategory join UserData on tbl_providerCategory.providerId=UserData.Id join tbl_sub_category on tbl_providerCategory.subCategoryId=tbl_sub_category.Id where UserData.userType='p'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void approve_Click(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int proId = int.Parse((item.FindControl("lblProId") as Label).Text);
            String mailId = (item.FindControl("lblMail") as Label).Text.ToString();
            String UserName = (item.FindControl("lblName") as Label).Text.ToString();
            String catName = (item.FindControl("lblCat") as Label).Text.ToString();
            String status = (item.FindControl("lblStatus") as Label).Text.ToString();
            if (status == "pending")
            {
                String q = "update tbl_providercategory set status='Approved' where Id='" + proId + "'";
                SqlCommand cmd = new SqlCommand(q, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindRepeater();
                sendApproval(mailId, UserName, catName);
            }
        }
        void sendApproval(String mailId,String UserName,String catName)
        {
            String ToEmail = mailId;
            MailMessage passrectmail = new MailMessage("myservices121@gmail.com", ToEmail);
            String EmailBody = "<html><body><h1>Hey <b>" + UserName + "</b>,</h1><br/>Your request for <b>'" + catName + "'</b> has been approved.<br/>We hope you will enjoy working with us.</center></body></html>";
            passrectmail.Body = EmailBody;
            passrectmail.IsBodyHtml = true;
            passrectmail.Subject = "MY Services";
            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
            SMTP.Credentials = new NetworkCredential("myservices121@gmail.com", "tingtotong");
            SMTP.EnableSsl = true;
            SMTP.Send(passrectmail);
        }
    }
}
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
    public partial class FeedBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
                       
            int id=0,flag = 0;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
            if (name.Text == "")
            { name.BorderColor = System.Drawing.Color.Red; flag++; }
            else
                name.BorderColor = System.Drawing.Color.Green;
            if (mail.Text == "")
            { mail.BorderColor = System.Drawing.Color.Red; flag++; }
            else
            {
                SqlCommand cmd = new SqlCommand("select count(Id) from UserData where email='" + mail.Text + "'", con);
                con.Open();
                id = (int)cmd.ExecuteScalar();
                con.Close();
                if (id == 0)
                {
                    mail.BorderColor = System.Drawing.Color.Red;
                    err_mail.Text = "E-mail not Registered";
                    flag++;
                }
                else
                {
                    SqlCommand cmnd = new SqlCommand("select Id from UserData where email='" + mail.Text + "'", con);
                    con.Open();
                    id = (int)cmnd.ExecuteScalar();
                    con.Close();
                    mail.BorderColor = System.Drawing.Color.Green;
                    err_mail.Text = "";
                }
            }
            if (subject.Text == "")
            { subject.BorderColor = System.Drawing.Color.Red; flag++; }
            else
                subject.BorderColor = System.Drawing.Color.Green;
            if (message.Text == "")
            { message.BorderColor = System.Drawing.Color.Red; flag++; }
            else
                message.BorderColor = System.Drawing.Color.Green;
            if (flag == 0)
            {

                SqlCommand cmd = new SqlCommand("insert into tbl_Reviews values('"+id+"','"+subject.Text+"','"+message.Text+"')", con);
                con.Open();
                int status = cmd.ExecuteNonQuery();
                con.Close();
                string msg = "";
                if (status != 0)
                    msg = "REVIEW ADDED SUCCEESSFULLY";
                else
                    msg = "FAILED TO ADD REVIEW";
                Response.Write(@"<script language='javascript'>alert('"+msg+"')</script>");
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

    }
}
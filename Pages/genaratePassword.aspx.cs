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
    public partial class genaratePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        string otp = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                divOtp.Visible = false;
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            int flag = 0;
            if (txt_email.Text == "")
            {
                lbl_invlidemail.Text = "Enter Email"; flag++;
            }
            else
            {
                SqlCommand com = new SqlCommand("checkMail", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@email", txt_email.Text);   //for Email checking 
                con.Open();
                int usercount = (Int32)com.ExecuteScalar();// for taking single value
                con.Close();
                if (usercount == 0)  // comparing users from table 
                { lbl_invlidemail.Text = "E-mail Not registered!"; flag++; }
                else
                { lbl_invlidemail.Text = "<br><br>"; }
            }
            if (flag == 0)
            {
                divMail.Visible = false;
                divOtp.Visible = true;
                txt_otpmail.Text = txt_email.Text;
                generateOtp();
            }
        }

        protected void btn_passwd_Click(object sender, EventArgs e)
        {
            int flag = 0;
            if (txt_password.Text == "")
            { lbl_invaldpass.Text = "Required"; flag++; }
            else if (txt_password.Text.Length < 8)
            { lbl_invaldpass.Text = "Minimum Length is 8"; flag++; }
            else
                lbl_invaldpass.Text = "<br><br>";

            if (!txt_password.Text.Equals(txt_confirmpass.Text))
            { lbl_invalidconfi.Text = "Password doesn't Match"; flag++; }
            else
                lbl_invalidconfi.Text = "<br><br>";

            if (otp.Equals(txt_cus_OTP.Text))
                lbl_invalidotp.Text = "Invalid OTP";
            else
            {
                String pwd = txt_password.Text;
                System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();
                byte[] bs = System.Text.Encoding.UTF8.GetBytes(pwd);
                bs = x.ComputeHash(bs);
                System.Text.StringBuilder s = new System.Text.StringBuilder();
                foreach (byte b in bs)
                {
                    s.Append(b.ToString("x2").ToLower());
                }
                lbl_invalidotp.Text = "";
                try
                {
                    SqlCommand cmd = new SqlCommand("update UserData set password=@pwd where email=@email", con); ;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txt_email.Text;
                    cmd.Parameters.Add("@pwd", SqlDbType.VarChar).Value = s.ToString();
                    con.Open();
                    int status = cmd.ExecuteNonQuery();
                    con.Close();
                    if (status != 0)
                    {
                        SqlCommand com = new SqlCommand("select name from UserData where email='" + txt_email.Text + "'", con);
                        con.Open();
                        SqlDataReader dr = com.ExecuteReader(); // for taking single value
                        dr.Read();
                        string uname = dr[0].ToString();
                        String ToEmail = txt_email.Text;
                        MailMessage passrectmail = new MailMessage("myservices121@gmail.com", ToEmail);
                        String UserName = uname;
                        String EmailBody = "<html><body><h2>Hi <b>" + UserName + "</b>,</h2><br/>" + "You have successfully changed your Password on : <b>" + DateTime.Now.ToString() + "</b></body></html>";
                        passrectmail.Body = EmailBody;
                        passrectmail.IsBodyHtml = true;
                        passrectmail.Subject = "MY Services";
                        SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                        SMTP.Credentials = new NetworkCredential("myservices121@gmail.com", "tingtotong");
                        SMTP.EnableSsl = true;
                        SMTP.Send(passrectmail);
                        Response.Redirect("LogIn.aspx");
                        Response.Write(@"<script language='text/javascript'>alert(' PASSWORD SUCCESSFULLY CHANGED. ')</script>");
                    }
                    else
                        Response.Write(@"<script language='javascript'>alert(' FAILED TO CHANGE PASSWORD ')</script>");
                }
                catch (Exception)
                {
                    Response.Write(@"<script language='javascript'>alert(' FAILED TO CHANGE PASSWORD ')</script>");
                }
            }
        }
        void generateOtp()
        {
            string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
            string numbers = "1234567890";
            string characters = numbers;
            characters += alphabets + small_alphabets + numbers;
            int length = 6;

            for (int i = 0; i < length; i++)
            {
                string character = string.Empty;
                do
                {
                    int index = new Random().Next(0, characters.Length);
                    character = characters.ToCharArray()[index].ToString();
                } while (otp.IndexOf(character) != -1);
                otp += character;
            }
            SqlCommand com = new SqlCommand("select name from UserData where email='" + txt_email.Text + "'", con);
            con.Open();
            SqlDataReader dr = com.ExecuteReader(); // for taking single value
            dr.Read();
            string uname = dr[0].ToString();
            String ToEmail = txt_email.Text;
            MailMessage passrectmail = new MailMessage("myservices121@gmail.com", ToEmail);
            String UserName = uname;
            String EmailBody = "<html><body><h2>Hi <b>" + UserName + "</b>,</h2><br/>" + "Enter the below Security code to Generate new Password :" + "<br/><center><h1 style='color:white;background-color:#1e5e66;height:150px;width:320px'><br/><br/>" + otp + "</h1></center></body></html>";
            passrectmail.Body = EmailBody;
            passrectmail.IsBodyHtml = true;
            passrectmail.Subject = "MY Services";
            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
            SMTP.Credentials = new NetworkCredential("myservices121@gmail.com", "tingtotong");
            SMTP.EnableSsl = true;
            SMTP.Send(passrectmail);

        }

        protected void resend_otp_Click(object sender, EventArgs e)
        {
            generateOtp();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace MY_Service.Pages
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        string otp = string.Empty;
        string bs = string.Empty;
        string pass=string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (IsPostBack)
            {
                txt_password.Attributes["value"] = txt_password.Text;
                txt_confirmpass.Attributes["value"] = txt_confirmpass.Text;
            }
        }
        protected void btn_register_Click(object sender, EventArgs e)
        {
            
            if (otp.Equals(txt_cus_OTP.Text))
                lbl_invalidotp.Text = "";
            else
            {
                System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();
                byte[] bs = System.Text.Encoding.UTF8.GetBytes(pass_check.Text);
                bs = x.ComputeHash(bs);
                System.Text.StringBuilder s = new System.Text.StringBuilder();
                foreach (byte b in bs)
                {
                    s.Append(b.ToString("x2").ToLower());
                }
                lbl_invalidotp.Text = "Invalid OTP";
                try
                {
                    
                    String usrtype = "";
                    if (customer.Checked==true)
                        usrtype = "c";
                    if (provider.Checked == true)
                        usrtype = "p";
                    
                    SqlCommand cmd = new SqlCommand("register", con); ;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txt_name.Text;
                    cmd.Parameters.Add("@mobile", SqlDbType.VarChar).Value = txt_mobno.Text;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txt_email.Text;
                    cmd.Parameters.Add("@pwd", SqlDbType.VarChar).Value = s.ToString();
                    cmd.Parameters.Add("@utype", SqlDbType.Char).Value = usrtype;
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write(@"<script language='javascript'>alert(' REGISTRATION SUCCESSFULL ')</script>");
                    Response.Redirect("LogIn.aspx");
                }
                catch (Exception)
                {
                    Response.Write(@"<script language='javascript'>alert(' REGISTRATION FAILED ')</script>");
                }
            }
        }

        protected void btn_getOTP_Click(object sender, EventArgs e)
        {
            
            int flag = 0;
            if (txt_name.Text == "")
            { lbl_invaliusername.Text = "Required"; flag++; }
            else if(!Regex.IsMatch(txt_name.Text,@"^[a-zA-Z][a-zA-Z\s]+$"))
            { lbl_invaliusername.Text="Digits and Special Characters are not allowed"; flag++;}
            else
                lbl_invaliusername.Text = "";

            if (txt_mobno.Text == "")
            {    lbl_invalidmobile.Text = "Required"; flag++; }
            else if(!Regex.IsMatch(txt_mobno.Text,@"^[0-9]{10}$"))
            {   lbl_invalidmobile.Text="Invalid Mobile Number"; flag++; }
            else
                lbl_invalidmobile.Text = "<br><br>";

            if (txt_email.Text == "")
            {    lbl_invlidemail.Text = "Required"; flag++; }
            else if (!Regex.IsMatch(txt_email.Text, @"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"))
            { lbl_invlidemail.Text = "Invalid E-mail address"; flag++; }
            else
            {
                SqlCommand com = new SqlCommand("checkMail", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@email", txt_email.Text);   //for Email checking 
                con.Open();
                int usercount = (Int32)com.ExecuteScalar();// for taking single value
                con.Close();
                if (usercount == 0)  // comparing users from table 
                    lbl_invlidemail.Text = "<br><br>";
                else
                { lbl_invlidemail.Text = "E-mail already registered!"; flag++; }
                
            }

            if (txt_password.Text == "")
            {    lbl_invaldpass.Text = "Required"; flag++; }
            else if (txt_password.Text.Length < 8)
            { lbl_invaldpass.Text = "Minimum Length is 8"; flag++; }
            else
                lbl_invaldpass.Text = "<br><br>";

            if (!txt_password.Text.Equals(txt_confirmpass.Text))
            { lbl_invalidconfi.Text = "Password doesn't Match"; flag++; }
            else
            {
                pass = txt_confirmpass.Text;
                lbl_invalidconfi.Text = "<br><br>";
                if (txt_password.Text == txt_confirmpass.Text)
                {
                    pass_check.Text = txt_confirmpass.Text;
                }
            }
            if (flag == 0)
            {
                login_form.Visible = false;
                popDivlogin.Visible = true;
                lbl_otpmail.Text = txt_email.Text;
                generateOtp();
            }
        }
        void generateOtp()
        {
            otp = "";
            try
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
                try
                {
                    string smsresult = sendsms(txt_mobno.Text, "Hey '"+txt_name.Text+"',\nWell-come to MYServices.com\nOTP to complete Registration is " + otp);
                }
                catch (Exception)
                {

                }
                String ToEmail = txt_email.Text;
                MailMessage passrectmail = new MailMessage("myservices121@gmail.com", ToEmail);
                String UserName = txt_name.Text;
                String EmailBody = "<html><body><h2>Hi <b>" + UserName + "</b>,</h2><br/>" + "Enter the below Security code to complete your Registration :" + "<br/><center><h1 style='color:white;background-color:#1e5e66;width:320px'><br/>" + otp + "<br/><br/></h1></center></body></html>";
                passrectmail.Body = EmailBody;
                passrectmail.IsBodyHtml = true;
                passrectmail.Subject = "MY Services";
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.Credentials = new NetworkCredential("myservices121@gmail.com", "tingtotong");
                SMTP.EnableSsl = true;
                SMTP.Send(passrectmail);
            }
            catch (Exception)
            {
                Response.Write("<script language=\"javascript\">alert(\" Failed to send OTP\n\nPLEASE CHECK YOUR NETWORK \")</script>");
                generateOtp();
            }
        }

        protected void resend_otp_Click(object sender, EventArgs e)
        {
           generateOtp();
        }

        public string sendsms(String mb, String msg)
        {
            string dataString = " ";

            string strUrl = "http://api.mvaayoo.com/mvaayooapi/MessageCompose?user=ytrivedi1@hotmail.com:sms123&senderID=TEST SMS&receipientno=+91" + mb + "&msgtxt=" + msg + "&state=4";
            // Create a request object   

            WebRequest request = HttpWebRequest.Create(strUrl);
            // Get the response back   

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream s = (Stream)response.GetResponseStream();
            StreamReader readStream = new StreamReader(s);
            dataString = readStream.ReadToEnd();

            response.Close();
            s.Close();
            readStream.Close();

            return dataString;
        }
    }
}
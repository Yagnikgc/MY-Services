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
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            String email = Request.Form["email"].ToString();
            String pwd = Request.Form["pwd"].ToString();
            System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] bs = System.Text.Encoding.UTF8.GetBytes(pwd);
            bs = x.ComputeHash(bs);
            System.Text.StringBuilder s = new System.Text.StringBuilder();
            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
            SqlCommand com = new SqlCommand("logIn", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@email", email);   //for username 
            com.Parameters.AddWithValue("@pwd", s.ToString());  //for word
            con.Open();
            int usercount = (Int32)com.ExecuteScalar();// for taking single value
            con.Close();
            if (usercount == 1)  // comparing users from table 
            {
                SqlCommand cmd = new SqlCommand("select Id,name,userType from UserData where email='"+email+"' and password='"+s.ToString()+"'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader(); // for taking single value
                dr.Read();
                string Id = dr[0].ToString();
                string uname = dr[1].ToString();
                string utype = dr[2].ToString();
                con.Close();
                Session["USERID"] = Id;
                Session["UNAME"] = uname;
                Session["Utype"] = utype;
                if (utype == "c")  // comparing users from table 
                    Response.Redirect("Customer.aspx");  //for sucsseful login of Customer
                else if(utype == "p")
                    Response.Redirect("ProviderDashBoard.aspx");  //for sucsseful login of Provider
            }
            else if(email=="Admin" && pwd.Equals("ADMIN"))
            {
                Session["UNAME"] = "Admin";
                Session["Utype"] = "Admin";
                Response.Redirect("../Admin/Admin.aspx");
            }
            else
            {
                string script = "window.onload = function(){wrong_input()};";
                ClientScript.RegisterStartupScript(this.GetType(),"wrong_input",script,true);
             
                //for invalid login
            }
        }


        public object userType { get; set; }
    }
}
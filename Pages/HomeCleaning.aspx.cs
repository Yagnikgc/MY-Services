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
    public partial class HomeCleaning : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e){
            if (Session["UNAME"] == null || Session["Utype"].ToString() != "c")
                Response.Redirect("LogIn.aspx");
            else
                Uname.Text=Session["UNAME"].ToString();
        }

        protected void package_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (package.SelectedItem.Value == "0")
            {
                packageDes.Text = "Please Select any Package";
            }
            else if (package.SelectedItem.Value == "1") {  packageDes.Text = "Number of Rooms : 2<br />Include Washroom : Yes<br />Include Hall & Kitchen : Yes"; }
            else if (package.SelectedItem.Value == "2") {  packageDes.Text = "Number of Rooms : 4<br />Include Washroom : Yes<br />Include Hall & Kitchen : Yes<br />Include Parking : Yes"; }
            else if (package.SelectedItem.Value == "3") {  packageDes.Text = "Number of Rooms : 6<br />Include Washroom : Yes<br />Include Hall & Kitchen : Yes<br />Include Parking : Yes<br />Include Garden + Backyard : Yes"; }
            else if (package.SelectedItem.Value == "4") {  packageDes.Text = "Charges depends on your required Service<br />According to Service Provider"; }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            int flag = 0,amount=0;
            if (srdt.SelectedDate < DateTime.Now.AddDays(2))
            {
                err_date.Text = "Invalid Date<br/>Please Select the date after 2 Days From '"+DateTime.Now.ToShortDateString()+"'.";
                flag++;
            }
            else
                err_date.Text = "";
            if (package.SelectedItem.Value == "0")
            {
                packageDes.Text = "Please Select any Package";
                flag++;
            }
            else if (package.SelectedItem.Value == "1") amount = 10000;
            else if (package.SelectedItem.Value == "2") amount = 20000;
            else if (package.SelectedItem.Value == "3") amount = 30000;
            if (address.Text == "")
            {
                err_address.Text = "Enter Service Address";
                flag++;
            }
            else
                err_address.Text = "";
            if (flag == 0)
            {
                int id = int.Parse(Session["USERID"].ToString());
                string pldt = DateTime.Now.ToString("dd-MM-yyyy");
                string comDt = srdt.SelectedDate.ToString("dd-MM-yyyy");
                SqlCommand cmd = new SqlCommand("insert into tbl_ServiceRecord values(@cusId,@proId,@subId,@pdate,@cdate,@add,@status,@amount)",con);
                cmd.Parameters.AddWithValue("@cusId", id);
                cmd.Parameters.AddWithValue("@proId", "");
                cmd.Parameters.AddWithValue("@subId","15");
                cmd.Parameters.AddWithValue("@pdate",DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@cdate",srdt.SelectedDate);
                cmd.Parameters.AddWithValue("@add",address.Text);
                cmd.Parameters.AddWithValue("@status","placed");
                cmd.Parameters.AddWithValue("@amount",amount);
                con.Open();
                int st = cmd.ExecuteNonQuery();
                con.Close();

                    Response.Write(@"<script language='javascript'>alert('SERVICE SUCCESSFULLY PLACED')</script>");
                    Response.Redirect("Customer.aspx");

                
            }
        }
    }
}
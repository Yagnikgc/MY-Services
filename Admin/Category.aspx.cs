using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MY_Service.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Study\MY Service\MY Service\App_Data\MYService.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UNAME"] == null || Session["Utype"].ToString()!="Admin")
                Response.Redirect("~/Pages/LogIn.aspx");
            if (!IsPostBack)
            {
                categoryToDropDown();
                Repeater1.DataSource = BindRepeater("SELECT",0);
                Repeater1.DataBind();
                Repeater2.DataSource = BindRepeater("SELECT",0);
                Repeater2.DataBind();
            }
        }

        protected void upload_Click(object sender, EventArgs e)
        {
            if (catName.Text == "")
            {
                errName.ForeColor = System.Drawing.Color.Red;
                errName.Text = "Please enter Category name";
            }
            else
                errName.Text = "";
            if (FileUpload1.HasFile)
            {
                lbl_status.Text = "";
                string[] validFileTypes={"png","jpg","jpeg"};
                string ext=System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++ )
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (isValidFile && catName.Text != "")
                {
                    lbl_status.Text = "";
                    string strname = FileUpload1.FileName.ToString();
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/Category/" + strname));
                    con.Open();
                    SqlCommand cmd = new SqlCommand("addCategory", con);
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = catName.Text;
                    cmd.Parameters.Add("@path", SqlDbType.VarChar).Value = strname;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lbl_status.ForeColor = System.Drawing.Color.Green;
                    lbl_status.Text = "Category Added Successfully";
                    Repeater1.DataSource = BindRepeater("SELECT", 0);
                    Repeater1.DataBind();
                }
                else
                {
                    lbl_status.ForeColor = System.Drawing.Color.Red;
                    lbl_status.Text = "Invalid Image type.<br> Please upload an Image with extension " + string.Join(", ",validFileTypes);
                }
            }
            else
            {
                lbl_status.ForeColor = System.Drawing.Color.Red;
                lbl_status.Text = "Please Upload an Image !!!";
            }
        }

        protected void addSubCat_Click(object sender, EventArgs e)
        {
            if (subcatName.Text == "")
            {
                errSubCatName.ForeColor = System.Drawing.Color.Red;
                errSubCatName.Text = "Please enter Category name";
            }
            else
                errSubCatName.Text = "";
            if (FileUpload2.HasFile)
            {
                lbl_status1.Text = "";
                string[] validFileTypes = { "png", "jpg", "jpeg" };
                string ext = System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName);
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (isValidFile && subcatName.Text != "")
                {
                    lbl_status1.Text = "";
                    string strname = FileUpload2.FileName.ToString();
                    FileUpload2.PostedFile.SaveAs(Server.MapPath("~/Images/subCategory/" + strname));
                    con.Open();
                    SqlCommand cmd = new SqlCommand("addSubCategory", con); ;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = subcatName.Text;
                    cmd.Parameters.Add("@path", SqlDbType.VarChar).Value = strname;
                    cmd.Parameters.Add("@catId", SqlDbType.Int).Value = ddl_SubCat.SelectedValue;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lbl_status1.ForeColor = System.Drawing.Color.Green;
                    lbl_status1.Text = "Sub-Category Added Successfully";
                    Repeater2.DataSource = BindRepeater("SELECT", 0);
                    Repeater2.DataBind();
                }
                else
                {
                    lbl_status1.ForeColor = System.Drawing.Color.Red;
                    lbl_status1.Text = "Invalid Image type.<br> Please upload an Image with extension " + string.Join(", ", validFileTypes);
                }
            }
            else
            {
                lbl_status1.ForeColor = System.Drawing.Color.Red;
                lbl_status1.Text = "Please Upload an Image !!!";
            }
        }
        private void categoryToDropDown()
        {
            SqlCommand cmd = new SqlCommand("select Id,Name from tbl_category", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sda.Dispose();
            ddl_SubCat.DataSource = dt;
            ddl_SubCat.DataBind();
        }
        private DataTable BindRepeater(string cmdAction,int catId)
        {
                SqlCommand cmd = new SqlCommand("Category_CRUD",con);
                cmd.Parameters.AddWithValue("@Action",cmdAction);
                cmd.Parameters.AddWithValue("@catId", catId);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                sda.Fill(dt);
                sda.Dispose();
                return dt;
        }
        protected void OnDelete(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int catId = int.Parse((item.FindControl("lblCatId") as Label).Text);
            
            SqlCommand cmd = new SqlCommand("Category_CRUD",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "DELETE");
            cmd.Parameters.AddWithValue("@catId", catId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            categoryToDropDown();
            Repeater1.DataSource = BindRepeater("SELECT", 0);
            Repeater1.DataBind();
        }

        protected void lb_Delete_Sub_Click(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int catId = int.Parse((item.FindControl("lblSubCatId") as Label).Text);

            SqlCommand cmd = new SqlCommand("Category_CRUD", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "SUBDELETE");
            cmd.Parameters.AddWithValue("@catId", catId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Repeater2.DataSource = BindRepeater("SELECT", 0);
            Repeater2.DataBind();
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
                int mainId = int.Parse((e.Item.FindControl("lblMainCatId") as Label).Text);
                Repeater Repeater3 = e.Item.FindControl("Repeater3") as Repeater;
                Repeater3.DataSource = BindRepeater("SELECTSUB",mainId);
                Repeater3.DataBind();
            }
        }
    }
}
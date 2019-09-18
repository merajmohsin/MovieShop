using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace GroupProject
{
    public partial class admin : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["grpDatabase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"]==null)
            {
                Response.Redirect("~/mainadmin.aspx");
            }
        }

        protected void txtpass_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtuser.Text.Trim();
            // encrypt the password
            //string password = Encryptor.EncryptText(txtpass.Text.Trim());
           string password = txtpass.Text.Trim();
            string query2 = "select Username from tbladmins where Username= @username AND Password =@password ;";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                cmd2.Parameters.AddWithValue("@username", username);
                cmd2.Parameters.AddWithValue("@password", password);

                conn.Open();
                string user = (string)cmd2.ExecuteScalar();
                if (user != null)
                {
                    Session["admin"] = user;
                        Response.Redirect("~/mainadmin.aspx");
                  
                }
                else
                {
                    lblmsg.Text = "Invalid username or password";

                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/test.aspx");
        }
    }
}
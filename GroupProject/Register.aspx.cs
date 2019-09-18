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
    public partial class Register : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["grpDatabase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtuser.Text.Trim();
            string password = txtpass.Text;
            string name = txtname.Text.Trim();
            string email = txtemail.Text.Trim();
            Int64 number = Int64.Parse(txtphone.Text.Trim());
            string add = txtadd.Text.Trim();
            string chold = txtcholder.Text.Trim();
            Int64 cno = Int64.Parse(txtcnumber.Text.Trim());
            int vc = int.Parse(txtccode.Text.Trim());
            DateTime date = DateTime.Parse(txtdate.Text);
            
            if (IsExists(username))
            {
                lblmsg.Text = "User already Exists";
            }
            else
            {
                bool a = insertuser(username, name, email, number, add, password);
                bool b = insertcredit(username, chold, cno, vc, date);
                if (a || b)
                {
                    Response.Write("Failed");
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        private Boolean IsExists(string user)
        {
            string username = txtuser.Text.Trim();
            string query2 = "select Username from tblUsers where Username= @username ;";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                cmd2.Parameters.AddWithValue("@username", username);
                conn.Open();
                string users = (string)cmd2.ExecuteScalar();
                if (users != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        private Boolean insertuser(string user, string name,string email, Int64 phone, string add, string pass)
        {
            string query = "Insert into tblUsers values(@user,@name,@email,@phone,@add,@pass);";
                using (SqlConnection conn = new SqlConnection(cs))
                {

                    SqlCommand cmd2 = new SqlCommand(query, conn);
                    cmd2.Parameters.AddWithValue("@user", user);
                    cmd2.Parameters.AddWithValue("@name", name);
                    cmd2.Parameters.AddWithValue("@email", email);
                    cmd2.Parameters.AddWithValue("@phone", phone);
                    cmd2.Parameters.AddWithValue("@add", add);
                    cmd2.Parameters.AddWithValue("@pass", pass);
                    conn.Open();
                    int rst = (int)cmd2.ExecuteNonQuery();
                    if (rst <= 0)
                   {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
        }
        private Boolean insertcredit(string user, string name, Int64 num, int code, DateTime date)
        {
            string query = "Insert into tblCreditInfo values(@user,@name,@num,@code,@date);";
            using (SqlConnection conn = new SqlConnection(cs))
            {

                SqlCommand cmd2 = new SqlCommand(query, conn);
                cmd2.Parameters.AddWithValue("@user", user);
                cmd2.Parameters.AddWithValue("@name", name);
                cmd2.Parameters.AddWithValue("@num", num);
                cmd2.Parameters.AddWithValue("@code", code);
                cmd2.Parameters.AddWithValue("@date", date.Date);
                conn.Open();
                int rst = (int)cmd2.ExecuteNonQuery();
                if (rst <= 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/home.aspx");

        }
    }
}
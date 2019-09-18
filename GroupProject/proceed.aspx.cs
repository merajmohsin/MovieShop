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
    public partial class proceed : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["grpDatabase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] != null) 
            {
                if (Session["user"] != null) 
                {
                    string query2 = "select Name, Address from tblUsers where Username= @username ;";
                    using (SqlConnection conn = new SqlConnection(cs))
                    {
                        SqlCommand cmd2 = new SqlCommand(query2, conn);
                        cmd2.Parameters.AddWithValue("@username", Session["user"].ToString());
                        SqlDataAdapter da = new SqlDataAdapter();
                        conn.Open();
                        DataSet items = new DataSet();
                        da.SelectCommand = cmd2;
                        da.Fill(items, "tblUsers");
                        DataTable dt = items.Tables["tblUsers"];
                        foreach (DataRow dataRow in dt.Rows)
                        {
                            TextBox1.Text = dataRow["Name"].ToString().Trim();
                            TextBox2.Text = dataRow["Address"].ToString().Trim();
                        }
                    }
                }
                else 
                {
                    Session["location"] = "~/proceed.aspx";
                    Response.Redirect("~/Login.aspx");
                }
            }
            else 
            {
                Response.Redirect("~/cart.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string addrs = TextBox2.Text;
            List<int> list = (List<int>)Session["Cart"];
            List<double> cost = (List<double>)Session["cost"];
            string query = "Insert into tblOrders(ItemNo,Username,ShippingAddress,Cost,Shipped) values(@item,@user,@address,@cost,@shipped);";
            Boolean x= false;
            for (int i = 0; i < list.Count; i++)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {

                    SqlCommand cmd2 = new SqlCommand(query, conn);
                    cmd2.Parameters.AddWithValue("@item", list[i]);
                    cmd2.Parameters.AddWithValue("@user", Session["user"]);
                    cmd2.Parameters.AddWithValue("@address", addrs);
                    cmd2.Parameters.AddWithValue("@cost", (cost[i]+(cost[i]*0.13)));
                    cmd2.Parameters.AddWithValue("@shipped", "no");
                    conn.Open();
                     x = ((int)cmd2.ExecuteNonQuery())<=0;
                }
            }
            if (x)
            {
                Response.Write("Error");
            }
            Session["Cart"] = null;
            Session["cost"] = null;
           Response.Redirect("~/Orders.aspx?new=completed");
        }
    }
}
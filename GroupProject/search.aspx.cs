using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Specialized;

namespace GroupProject
{
    public partial class search : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["grpDatabase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
            LiteralControl lc = new LiteralControl();
            content.Controls.Add(lc);
             NameValueCollection ppQueryString = Request.QueryString;
             if (ppQueryString["srch"] != null)
            {
                 string query2 = "select ItemNo, Name, Description, Price, Image from tblItems where UPPER(Name) LIKE '%'+@search+'%' ;";

                 using (SqlConnection conn = new SqlConnection(cs))
                 {
                     SqlCommand cmd2 = new SqlCommand(query2, conn);
                     cmd2.Parameters.AddWithValue("@search", ppQueryString["srch"]);
                     SqlDataAdapter da = new SqlDataAdapter();
                     conn.Open();
                     DataSet items = new DataSet();
                     da.SelectCommand = cmd2;

                     try
                     {
                         int it = (int)da.SelectCommand.ExecuteScalar();

                         da.Fill(items, "tblItems");
                         DataTable dt = items.Tables["tblItems"];
                         string form = "";
                         foreach (DataRow dataRow in dt.Rows)
                         {

                             form = "";


                             form += "<form class='from' action=\"test.aspx\" method=\"get\">";
                             form += "<img src='Images/" + dataRow["Image"].ToString().Trim() + "'><br>";
                             form += "<label>Item No.: " + dataRow["ItemNo"].ToString().Trim() + "</label><br>";
                             form += "<input type='hidden' name='hidden' value='" + dataRow["ItemNo"].ToString().Trim() + "'>";
                             form += "<input type='hidden' name='name' value='" + dataRow["name"].ToString().Trim() + "'>";
                             form += "<label> Name: " + dataRow["Name"].ToString().Trim() + "</label><br>";

                             form += "<label> Description: " + dataRow["Description"].ToString().Trim() + "</label><br>";
                             form += "<label> $" + dataRow["Price"].ToString().Trim() + "</label><br><br><br><br>";
                             form += "<input class='a' type='submit' value='Add to cart'></form>";
                             lc.Text += form;

                         }
                     }
                     catch
                     {
                         lc.Text = "<h2 style='color:white;'>No items found</h2>";
                     }
                 }
             }
             else 
             {
                 lc.Text = "<h2 style='color:white;'>Please type in a keyword to search items</h2>";
             }
        }
    }
}
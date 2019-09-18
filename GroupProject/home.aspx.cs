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
    public partial class test : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["grpDatabase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection ppQueryString = Request.QueryString;
            if (Session["typ"] == null)
            {
                string query2 = "select ItemNo, Name, Description, Price, Image from tblItems ;";
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd2 = new SqlCommand(query2, conn);
                    SqlDataAdapter da = new SqlDataAdapter();
                    conn.Open();
                    DataSet items = new DataSet();
                    da.SelectCommand = cmd2;
                    da.Fill(items, "tblItems");
                    DataTable dt = items.Tables["tblItems"];
                    string form ="";
                    foreach (DataRow dataRow in dt.Rows)
                    {
                        form = "";
                        ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
                        LiteralControl lc = new LiteralControl();
                        content.Controls.Add(lc);

                        form += "<form class='from'action=\"home.aspx\" method=\"get\">";
                        form += "<img src='Images/" + dataRow["Image"].ToString().Trim() + "'><br>";
                        form+="<label>Item No.: "+dataRow["ItemNo"].ToString().Trim()+"</label><br>";
                        form += "<input type='hidden' name='hidden' value='" + dataRow["ItemNo"].ToString().Trim() + "'>";
                        form += "<input type='hidden' name='name' value='" + dataRow["name"].ToString().Trim() + "'>";
                        form += "<label> Name: " + dataRow["Name"].ToString().Trim() + "</label><br>";
                        
                        form += "<label> Description: " + dataRow["Description"].ToString().Trim() + "</label><br>";
                        form += "<label> $" + dataRow["Price"].ToString().Trim() + "</label><br><br><br><br>";
                        form+="<input class='a' type='submit' value='Add to cart'></form>";
                        lc.Text += form;
                      
                    }
                }
            }
            else
            {
                string query2 = "select ItemNo, Name, Description, Price, Image from tblItems where Category =@category ;";
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd2 = new SqlCommand(query2, conn);
                    cmd2.Parameters.AddWithValue("@category", Session["typ"].ToString());
                    SqlDataAdapter da = new SqlDataAdapter();
                    conn.Open();
                    DataSet items = new DataSet();
                    da.SelectCommand = cmd2;
                    da.Fill(items, "tblItems");
                    DataTable dt = items.Tables["tblItems"];
                    string form = "";
                    foreach (DataRow dataRow in dt.Rows)
                    {
                        form = "";
                        ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
                        LiteralControl lc = new LiteralControl();
                        content.Controls.Add(lc);

                        form += "<form class='from' action=\"home.aspx\" method=\"get\">";
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
            }
            if (ppQueryString["name"] != null)
            {
                List<int> list;
                if (Session["Cart"]!=null) 
                {
                    list = (List<int>)Session["Cart"];
                }
                else
                {
                list = new List<int>();
                }
                
                if (list.Contains(int.Parse(ppQueryString["hidden"])))
                {
                    System.Web.HttpContext.Current.Response.Write("<SCRIPT>alert('Item " + ppQueryString["name"] + " is already  added to your cart');</SCRIPT>");
                }
                else
                {
                    list.Add(int.Parse(ppQueryString["hidden"]));
                    Session["Cart"] = list;
                    System.Web.HttpContext.Current.Response.Write("<SCRIPT>alert('Item " + ppQueryString["name"] + " is successfully added to your cart');</SCRIPT>");
                }
            }

        }
    }
}
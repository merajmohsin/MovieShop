using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace GroupProject
{
    public partial class cart : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["grpDatabase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
            LiteralControl lc = new LiteralControl();
            content.Controls.Add(lc);
            if (Session["Cart"] != null)
            {
                List<int> list = (List<int>)Session["Cart"];
                NameValueCollection ppQueryString = Request.QueryString;
                if (ppQueryString["name"] != null)
                {
                    if (list.Contains(int.Parse(ppQueryString["hidden"])))
                    {
                        list.Remove(int.Parse(ppQueryString["hidden"]));
                        Session["Cart"] = list;
                        System.Web.HttpContext.Current.Response.Write("<SCRIPT>alert('Item " + ppQueryString["name"] + " is successfully removed from your cart');</SCRIPT>");
                    }
                }
                if (list.Count > 0)
                {
                    double count = 0;
                    List<double> cost = new List<double>();
                    for (int i = 0; i < list.Count; i++)
                    {
                        string query2 = "select ItemNo, Name, Description, Price, Image from tblItems where ItemNo = @item;";
                        using (SqlConnection conn = new SqlConnection(cs))
                        {
                            
                            SqlCommand cmd2 = new SqlCommand(query2, conn);
                            cmd2.Parameters.AddWithValue("@item", list[i]);
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

                                form += "<form class='from' action=\"cart.aspx\" method=\"get\">";
                                form += "<img src='Images/" + dataRow["Image"].ToString().Trim() + "'><br>";
                                form += "<label>Item No.: " + dataRow["ItemNo"].ToString().Trim() + "</label><br>";
                                form += "<input type='hidden' name='hidden' value='" + dataRow["ItemNo"].ToString().Trim() + "'>";
                                form += "<input type='hidden' name='name' value='" + dataRow["name"].ToString().Trim() + "'>";
                                form += "<label> Name: " + dataRow["Name"].ToString().Trim() + "</label><br>";

                                form += "<label> Description: " + dataRow["Description"].ToString().Trim() + "</label><br>";
                                form += "<label> $" + dataRow["Price"].ToString().Trim() + "</label><br><br><br><br>";
                                double c = double.Parse(dataRow["Price"].ToString().Trim());
                                count += c;
                                cost.Add(c);
                                form += "<input class='a' type='submit' value='Delete Item'></form>";
                                lc.Text += form;

                            }
                        }
                    }
                    Session["cost"] = cost;
                    lc.Text += "<br><h2 style='color:white;'>Total(before taxes)----------$" + count + "</h2>";
                    lc.Text += "<h2 style='color:white;'>Total(inc taxes)--------------$" + (count + (count * 0.13)) + "</h2>";
                    lc.Text += "<form action=\"proceed.aspx\" method=\"get\"><input class='a' style='height:50px;  width:150px; background-color:#171010;' type='submit' value='Proceed to Order'></form>";
                }

                else
                {
                    lc.Text = "<h2 style='color:white;'>Your cart is empty</h2>";
                }
            }
            else
            {

                lc.Text = "<h2 style='color:white;'>Your cart is empty</h2>";
            }
        }
    }
}
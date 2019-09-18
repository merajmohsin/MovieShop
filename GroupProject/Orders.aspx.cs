using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;

namespace GroupProject
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection ppQueryString = Request.QueryString;
            if(ppQueryString["new"]!=null){
                System.Web.HttpContext.Current.Response.Write("<SCRIPT>alert('You order has been placed');</SCRIPT>");
            }
            if (Session["user"] == null)
            {
                Session["location"] = "~/Orders.aspx";
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/home.aspx");
        }
    }
}
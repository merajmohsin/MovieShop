using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProject.MasterPage
{
    public partial class Page_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                btnaccount.Visible = true;
                btnlogin.Visible = false;
                btnregister.Visible = false;
                btnlogout.Visible = true;
            }
            else
            {
                btnaccount.Visible = false;
                btnlogin.Visible = true;
                btnregister.Visible = true;
                btnlogout.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string str = (txtSearch.Text.Trim()).ToUpper();
            Response.Redirect("~/search.aspx?srch="+str);
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void btnorder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Orders.aspx");
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/Login.aspx");
        }

        protected void btnaccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/account.aspx");
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/home.aspx");
        }

        protected void btncart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart.aspx");
        }
    }
}
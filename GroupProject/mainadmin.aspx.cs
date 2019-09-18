using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProject
{
    public partial class mainadmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) 
            {
                Response.Redirect("~/admin.aspx");
            }
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/home.aspx");
        }

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                GridView1.DataSourceID = "";
                GridView1.DataBind();
            }
        }

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                GridView3.DataSourceID = "";
                GridView3.DataBind();
            }
        }

        protected void DetailsView3_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView3.DataSourceID = "SqlDataSource3";
            GridView3.DataBind();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                GridView2.DataSourceID = "";
                GridView2.DataBind();
            }
        }

        protected void DetailsView4_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView2.DataSourceID = "SqlDataSource2";
            GridView2.DataBind();
        }

        protected void btnorder_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView3.Visible = false;
   
        }

        protected void btninventory_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
  
        }

        protected void btnadmins_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = true;
        }

        protected void DetailsView2_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {

        }

        protected void DetailsView2_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.CancelingEdit)
            {
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
            }
        }

        protected void DetailsView4_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.CancelingEdit)
            {
                GridView2.DataSourceID = "SqlDataSource2";
                GridView2.DataBind();
            }

        }

        protected void DetailsView3_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.CancelingEdit)
            {
                GridView3.DataSourceID = "SqlDataSource3";
                GridView3.DataBind();
            }
        }

    }
}
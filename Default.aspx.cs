using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_1_Click(object sender, EventArgs e)
    {
        if (Session["usertype"] != null)
        {
        if (Session["usertype"].ToString() == "user") Response.Redirect("ProductsSell.aspx");
        else Response.Redirect("ProductsView.aspx");
        }else Response.Redirect("ProductsView.aspx");

    }
}
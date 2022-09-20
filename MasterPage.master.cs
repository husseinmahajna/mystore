using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usertype"] != null) str = Session["usertype"].ToString();
        if (str == "user")
        {
            RemoveMenuItem("Admin");
            RenameMenuItem("LogInOut","Log Out");
        }
        else if (str == "admin")
        {
            RemoveMenuItem("User");
            RenameMenuItem("LogInOut", "Log Out");
        }
        else
        {
            RemoveMenuItem("Admin");
            RemoveMenuItem("User");
            RenameMenuItem("LogInOut", "Log In");
        }
    }

    public void RemoveMenuItem(string value)
    {
        MenuItem mi = Menu1.FindItem(value);
        if (mi != null) Menu1.Items.Remove(mi);
    }
    public void RenameMenuItem(string value,string name)
    {
        MenuItem mi = Menu1.FindItem(value);
        if (mi != null) mi.Text = name; 
    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Value.Equals("LogInOut"))
        {
            if (e.Item.Text.Equals("Log Out"))
            {
                Session["usertype"] = "";
                Session["userid"] = "";
                Response.Redirect("Default.aspx");
            }

            else Response.Redirect("LogIn.aspx");
        }
            if (e.Item.Value.Equals("Products"))
            {
                if (str == "user")
                    Response.Redirect("ProductsSell.aspx");
                else
                    Response.Redirect("ProductsView.aspx");
            }

            
        
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;


using System.Data;
using System.Configuration;

using System.Web.Security;
using System.Data.OleDb;



public partial class LogIn : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_err_lgn.Visible = false;
    }

    protected void btn_lgn_Click(object sender, EventArgs e)
    {

        DataTable dt = ClassUser.GetAll();
        int j = ClassUser.FindUserByUserName(txt_usr_lgn.Text);
        if (j == -1) { lbl_err_lgn.Text="The User You Entered Doesn't Exist!"; lbl_err_lgn.Visible = true; }
        else if (dt.Rows[j]["password"].ToString() != txt_pas_lgn.Text) { lbl_err_lgn.Text= "The E-mail And The Password Doesn't Match !"; lbl_err_lgn.Visible = true; } 
        else
        {
            if (dt.Rows[j]["isadmin"].ToString().ToLower().Equals("true")) Session["usertype"] = "admin";
            else Session["usertype"] = "user";
            Session["userid"] = dt.Rows[j]["id"].ToString();
            cleardata_login();
            lbl_err_lgn.Visible = false; Response.Redirect("Default.aspx");
        } 

    }

   public void cleardata_register()
    {
        txt_email_rgstr.Text = "";
        txt_usr_rgstr.Text = "";
        txt_pas_rgstr.Text = "";
    }
    public void cleardata_login()
    {
        txt_usr_lgn.Text = "";
        txt_pas_lgn.Text = "";

    }
    protected void btn_rgstr_Click(object sender, EventArgs e)
    {
            DataTable dt = ClassUser.GetAll();
            ClassUser u = new ClassUser();
            u.Username = txt_usr_rgstr.Text;
            u.Password = txt_pas_rgstr.Text;
            u.Email = txt_email_rgstr.Text;
            u.Isadmin = false.ToString();
            u.Dateofbirth = DateTime.Now.ToString();
            u.Insert();
        cleardata_register();
    }

    [WebMethod]
    public static bool Exist(string str)
    {
        DataTable dt = ClassUser.GetAll();
        bool b = false;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string x = dt.Rows[i]["username"].ToString();
            if (x.ToString().Equals( str))
            {
                b= true;
            }
        }
        return b;
    }


}
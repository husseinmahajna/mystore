using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_send_Click(object sender, EventArgs e)
    {
        string uType = "", uId = "";
        if (Session["userId"] != null) uId = (string)Session["userId"];

        if (Session["userType"] != null) uType = (string)Session["userType"];

        ClassMessages cm = new ClassMessages(txt_subject.Text, txt_content.Text, uType, uId);
        cm.Insert();
        Clear();
    }
    public void Clear()
    {
        txt_content.Text = "";
        txt_subject.Text = "";
    }
    protected void btn_clear_Click(object sender, EventArgs e)
    {
        Clear();
    }
}
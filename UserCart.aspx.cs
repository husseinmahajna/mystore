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

public partial class UserCart : System.Web.UI.Page
{
    DataTable dt5;
    protected void Page_Load(object sender, EventArgs e)
    {
        dt5 = ClassCart.GetAll();
        if (dt5.Rows.Count == 0) btn_chk.Visible = false;
        else btn_chk.Visible = true;
        
    }


    [WebMethod]
    public static string lastnum(string str)
    {
        int i = str.Length - 1;
        string a = "";

        while (str[i] != '_')
        {
            a += str[i];
            i--;
        }

        string b = "";

        for (int j = a.Length - 1; j >= 0; j--)
            b += a[j];

        return b;
    }

    [WebMethod]
    public static void Remove(string id)
    {
        ClassCart c=new ClassCart();
        c.PNum = id;
        c.DeleteItem();
    }

    [WebMethod]
    public static void change(string amount , string code)
    {
        int amount1 = int.Parse(amount);
        int i = ClassCart.FindCartByPnum(code);
        DataTable dt = ClassCart.GetAll();
        ClassCart c = new ClassCart();

        int price = int.Parse( dt.Rows[i]["pPrice"].ToString());
        c.PNum = code;
        c.Quantity = amount1;
        c.TotalPrice = amount1 * price;

        c.Update();
    }





    protected void btn_chk_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckOut.aspx");
    }
}
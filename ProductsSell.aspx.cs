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

public partial class ProductsSell : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 
    [WebMethod]
    public static void addtocart(int amount ,string code)
    {
        int i =ClassProduct.FindProductByPnum(code);
        DataTable dt = ClassProduct.GetAll();
        ClassCart c = new ClassCart();
        c.PNum = code.ToString();
        c.PName = dt.Rows[i]["product_name"].ToString();
        c.PImage = dt.Rows[i]["pimage"].ToString();
        c.PCompany = dt.Rows[i]["company"].ToString();
        c.Quantity = amount;
        c.PPrice = int.Parse( dt.Rows[i]["price"].ToString());
        c.TotalPrice = c.PPrice * amount;
        if (ClassCart.FindCartByPnum(c.PNum) == -1)
            c.Insert();
        else c.Update();
        
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

        for(int j = a.Length-1; j>=0; j--)
            b += a[j];

        return b;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;

using System.Web.Security;
using System.Data.OleDb;
using System.IO;

public partial class CheckOut : System.Web.UI.Page
{
    static int j;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            FillData();
    }

    protected void btn_order_Click(object sender, EventArgs e)
    {
        //store user payment information in the table
        ClassUser u = new ClassUser();
        DataTable dt1 = ClassUser.GetAll();
        u.Id = Session["userid"].ToString();
        j = ClassUser.FindUserById(u.Id);
        string date = txt_day.Text + "/" + txt_month.Text + "/" + txt_year.Text;

        u.Firstname = txt_firstname.Text;
        u.Lastname = txt_firstname.Text;
        u.Dateofbirth = date;
        if (rdb_female.Checked) u.Gender = "Female";
        else u.Gender = "Male";

        u.Phone = txt_phone.Text;
        u.Email = dt1.Rows[j]["email"].ToString();
        u.Address = txt_address.Text;
        u.Mailbox = txt_mailbox.Text;
        u.Micode = txt_micode.Text;
        u.Password = dt1.Rows[j]["password"].ToString();
        u.Username = dt1.Rows[j]["username"].ToString();
        u.Isadmin = dt1.Rows[j]["isadmin"].ToString();
        u.Imguser = dt1.Rows[j]["userimage"].ToString();
        u.Update();
        //
        ClassOrders ord = new ClassOrders(DateTime.Now.ToString(), "New", ClassCart.GetOrderTotalPrice(), Session["userid"].ToString());
        ord.Insert();
        // add products to order in orderproductstb
        DataTable dt = ClassCart.GetAll();
        ClassOrdersProducts op;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            op = new ClassOrdersProducts(ClassOrders.GetNumOfLastOrder(), int.Parse(dt.Rows[i]["pNum"].ToString()), int.Parse(dt.Rows[i]["Quantity"].ToString()), int.Parse(dt.Rows[i]["totalprice"].ToString()));
            op.Insert();
        }
        // update quantity in products table

        for (int i = 0; i < dt.Rows.Count; i++)
            ClassProduct.UpdateProductQuantity(dt.Rows[i]["pNum"].ToString(), int.Parse(dt.Rows[i]["Quantity"].ToString()));

        // clear cart & go to products
        //remove all items in cart
        ClassCart.DeleteAll();
        Response.Redirect("ProductsSell.aspx");

    }
    public void FillData()
    {
        DataTable dt = ClassUser.GetAll();
        j = ClassUser.FindUserById(Session["userid"].ToString());
        txt_firstname.Text = dt.Rows[j]["firstname"].ToString();
        txt_lastname.Text = dt.Rows[j]["lastname"].ToString();
        txt_phone.Text = dt.Rows[j]["phone"].ToString();
        txt_address.Text = dt.Rows[j]["address"].ToString();
        txt_micode.Text = dt.Rows[j]["micode"].ToString();
        txt_mailbox.Text = dt.Rows[j]["mailbox"].ToString();

        if (dt.Rows[j]["gender"].ToString() == "Female")
        {
            rdb_female.Checked = true;
            rdb_male.Checked = false;
        }
        else
        {
            rdb_female.Checked = false;
            rdb_male.Checked = true;
        }
        FillDate();
    }
    public void FillDate()
    {
        DataTable dt = ClassUser.GetAll();
        int c = 0;
        string str = "";
        for (int j = 0; j < dt.Rows[CheckOut.j]["dateofbirth"].ToString().Length; j++)
        {
            if (((dt.Rows[CheckOut.j]["dateofbirth"].ToString())[j].Equals('/') && c == 0))
            {
                txt_day.Text = str;
                c++;
                str = "";
            }
            else if (((dt.Rows[CheckOut.j]["dateofbirth"].ToString())[j].Equals('/') && c == 1))
            {
                txt_month.Text = str;
                c++;
                str = "";
            }
            else str += (dt.Rows[CheckOut.j]["dateofbirth"].ToString())[j];
        }
        txt_year.Text = str.Substring(0, 4);
    }


}
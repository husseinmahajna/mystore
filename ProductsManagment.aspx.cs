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

public partial class ProductsManagment : System.Web.UI.Page
{
    static int i;
    static DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dt = ClassProduct.GetAll();
            i = 0;
            FillData();
            // مفتاح الغريب - القيم من جدول اخر
            fillddlpSupplier();
        }
        gdvproducts1.DataBind();
    }
    public void FillData()
    {
        dt = ClassProduct.GetAll();
        if (dt.Rows.Count > 0)
        {
            lbl_code.Text = dt.Rows[i]["code"].ToString();//dt.Rows[i][0]
            txt_name.Text = dt.Rows[i]["product_name"].ToString();
            txt_company.Text = dt.Rows[i]["company"].ToString();
            txt_amount.Text = dt.Rows[i]["amount"].ToString();
            txt_price.Text = dt.Rows[i]["price"].ToString();
            txt_guarantee.Text = dt.Rows[i]["guarantee"].ToString();
            txt_minamount.Text= dt.Rows[i]["min_amount"].ToString();
            ddl_suppliers.Text = dt.Rows[i]["supplier_num"].ToString();
            txt_desc.Text = dt.Rows[i]["description"].ToString();
            txt_type.Text = dt.Rows[i]["type"].ToString();

            // fill image
            if (dt.Rows[i]["pimage"].ToString() != "")
                img_product.ImageUrl = dt.Rows[i]["pimage"].ToString();
            else
                img_product.ImageUrl = null;


            // fill th dropDownList ddlFindUserById;

        }
        else
        {
            ClearData();
            btn_add.Enabled = true;
            btn_update.Enabled = false;
            btn_remove.Enabled = false;
        }
        // fill GridView

        //gdvProducts.DataSource = dt;
        //gdvProducts.DataBind();

    }//FillData
    public void fillddlpSupplier()
    {
        ddl_suppliers.Items.Clear();
        DataTable dtSuppliers = ClassSupplier.GetAll();

        for (int i = 0; i < dtSuppliers.Rows.Count; i++)
            ddl_suppliers.Items.Add(dtSuppliers.Rows[i]["sNum"].ToString());

    }
    public void ClearData()
    {
        lbl_code.Text = "";
        txt_name.Text = "";
        txt_company.Text = "";
        txt_desc.Text = "";
        txt_price.Text = "";
        txt_minamount.Text = "";
        txt_guarantee.Text = "";
        txt_type.Text = "";
        txt_amount.Text = "";
        //ddlpSupplier.Text = "1";
        img_product.ImageUrl = null;
    }


    protected void btn_first_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = false;
        btn_update.Enabled = true;
        btn_remove.Enabled = true;

        i = 0;
        FillData();
    }



    protected void btn_prev_Click(object sender, EventArgs e)
    {
        if (i > 0)
        {
            i--;
            FillData();
        }

        btn_add.Enabled = false;
        btn_update.Enabled = true;
        btn_remove.Enabled = true;
    }

    protected void btn_next_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = false;
        btn_update.Enabled = true;
        btn_remove.Enabled = true;

        if (i < dt.Rows.Count - 1)
        {
            i++;

        }
        FillData();
    }


    protected void btn_last_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = false;
        btn_update.Enabled = true;
        btn_remove.Enabled = true;

        i = dt.Rows.Count - 1;
        FillData();
    }

    protected void btn_clean_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = true;
        btn_update.Enabled = false;
        btn_remove.Enabled = false;
        ClearData();
        gdvproducts1.DataBind();
    }


    protected void btn_add_Click(object sender, EventArgs e)
    {
        //get name of image & save it in folder OR empty string
        // after check uploadFile in check data = valid image
        string ImageName = "";
        if (FileUpload1.HasFile)
        {   //save the image name
            ImageName = "Images\\" + FileUpload1.FileName;
            //save the file in folder images
            string path = Server.MapPath("Images/");
            FileUpload1.SaveAs(path + FileUpload1.FileName);
            // show the image in image tool
            img_product.ImageUrl = ImageName;
        }

        ClassProduct p = new ClassProduct(txt_name.Text,txt_company.Text,txt_type.Text,txt_desc.Text,txt_guarantee.Text,txt_price.Text,txt_amount.Text,txt_minamount.Text,ddl_suppliers.Text,DateTime.Now.ToString(), ImageName);
        p.Insert();

        dt = ClassProduct.GetAll();
        ClearData();
        gdvproducts1.DataBind();

    }


    protected void btn_remove_Click(object sender, EventArgs e)
    {
        ClassProduct p = new ClassProduct();
        p.Pcode = lbl_code.Text;
        p.Delete();
        // update i
        // work with old dt
        if (i == dt.Rows.Count - 1 && i > 0) i--;


        // new dt after delete
        dt = ClassUser.GetAll();
        FillData(); // under construction
        gdvproducts1.DataBind();

    }



    protected void btn_update_Click(object sender, EventArgs e)
    {
       
        //get name of image & save it in folder OR empty string
        // after check uploadFile in check data = valid image
        string ImageName = "";
        if (FileUpload1.HasFile)
        {   //save the image name
            ImageName = "Images\\" + FileUpload1.FileName;
            //save the file in folder images
            string path = Server.MapPath("Images/");
            FileUpload1.SaveAs(path + FileUpload1.FileName);
            // show the image in image tool
            img_product.ImageUrl = ImageName;
        }
        ClassProduct p = new ClassProduct(txt_name.Text, txt_company.Text, txt_type.Text, txt_desc.Text, txt_guarantee.Text, txt_price.Text, txt_amount.Text, txt_minamount.Text, ddl_suppliers.Text, dt.Rows[i]["pDate"].ToString(), ImageName);
        p.Pcode = lbl_code.Text;
        p.Update();
        dt = ClassUser.GetAll();
        FillData();
        gdvproducts1.DataBind();

    }
}
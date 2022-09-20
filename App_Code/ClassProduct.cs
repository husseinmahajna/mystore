using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for ClassProduct
/// </summary>
public class ClassProduct
{

    private string pcode, pname, pcompany, ptype, pdesc, pguarantee, pprice, pamount, pmin_amount, psuppliernum;

    private string pdate, pimage;
    public ClassProduct()
    {
        //empty constructor
    }
    public ClassProduct(string pname, string pcompany, string ptype, string pdesc, string pguarantee, string pprice, string pamount, string pmin_amount, string psuppliernum, string pdate, string pimage)
    {
        this.Pname = pname;
        this.Pcompany = pcompany;
        this.Ptype = ptype;
        this.Pdesc = pdesc;
        this.Pguarantee = pguarantee;
        this.Pprice = pprice;
        this.Pamount = pamount;
        this.Pmin_amount = pmin_amount;
        this.Psuppliernum = psuppliernum;
        this.Pdate = pdate;
        this.Pimage = pimage;
    }

    public string Pcode
    {
        get
        {
            return pcode;
        }

        set
        {
            pcode = value;
        }
    }

    public string Pname
    {
        get
        {
            return pname;
        }

        set
        {
            pname = value;
        }
    }

    public string Pcompany
    {
        get
        {
            return pcompany;
        }

        set
        {
            pcompany = value;
        }
    }

    public string Ptype
    {
        get
        {
            return ptype;
        }

        set
        {
            ptype = value;
        }
    }

    public string Pdesc
    {
        get
        {
            return pdesc;
        }

        set
        {
            pdesc = value;
        }
    }

    public string Pguarantee
    {
        get
        {
            return pguarantee;
        }

        set
        {
            pguarantee = value;
        }
    }

    public string Pprice
    {
        get
        {
            return pprice;
        }

        set
        {
            pprice = value;
        }
    }

    public string Pamount
    {
        get
        {
            return pamount;
        }

        set
        {
            pamount = value;
        }
    }

    public string Pmin_amount
    {
        get
        {
            return pmin_amount;
        }

        set
        {
            pmin_amount = value;
        }
    }

    public string Psuppliernum
    {
        get
        {
            return psuppliernum;
        }

        set
        {
            psuppliernum = value;
        }
    }

    public string Pdate
    {
        get
        {
            return pdate;
        }

        set
        {
            pdate = value;
        }
    }

    public string Pimage
    {
        get
        {
            return pimage;
        }

        set
        {
            pimage = value;
        }
    }

    public static DataTable GetAll()
    {
        string strSql = "SELECT * FROM [products]";
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        return dt;
    }
    public void Insert()
    {
        string strSql = "INSERT INTO [products]";
        strSql += "([product_name],[company],[type],[pDate],[description],[guarantee],[price],[amount],[min_amount],[supplier_num],[pimage])";
        strSql += "VALUES ('{0}','{1}','{2}',#{3}#,'{4}','{5}',{6},{7},{8},{9},'{10}')";
        strSql = string.Format(strSql, this.pname, this.pcompany, this.ptype, this.pdate, this.pdesc, this.Pguarantee, this.Pprice, this.pamount, this.pmin_amount, this.psuppliernum, this.pimage); 

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    public void Delete()
    {
        string strSql = "DELETE * FROM [products] WHERE [code]={0}";

        strSql = string.Format(strSql, this.pcode);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    public void Update()
    {
        string strSql = "UPDATE [products] SET [product_name]='{0}',[company]='{1}',[type]='{2}',[pDate]=#{3}#,[description]='{4}',[guarantee]='{5}',[price]={6},[amount]={7},[min_amount]={8},[supplier_num]={9},[pimage]='{10}'  WHERE [code]={11} ";
        strSql = string.Format(strSql, this.pname, this.pcompany, this.ptype, this.pdate, this.pdesc, this.Pguarantee, int.Parse(this.Pprice), int.Parse(this.pamount), int.Parse(this.pmin_amount), int.Parse(this.psuppliernum), this.pimage,int.Parse(this.pcode));

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    // return index in dataTable or -1
    public static int GetQuantityOfProduct(string pnum)
    {
        DataTable dt = GetAll();
        int i = FindProductByPnum(pnum);
        return int.Parse(dt.Rows[i]["amount"].ToString());
    }
    public static void UpdateProductQuantity(string pnum, int Quantity)
    {
        int qu = GetQuantityOfProduct(pnum) - Quantity;
        string strSql = "UPDATE [products] SET [amount]={0} WHERE [code]={1}";
        strSql = string.Format(strSql, qu, pnum);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    public static int FindProductByPnum(string pNum)
    {
        DataTable dt = GetAll();
        for (int i = 0; i < dt.Rows.Count; i++)
            if (dt.Rows[i]["code"].ToString() == pNum)
                return i;
        return -1;
    }
}// ClassProduct
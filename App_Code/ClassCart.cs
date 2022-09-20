using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ClassCart
/// </summary>
public class ClassCart
{
    private string pNum, pName, pCompany, pImage;
    private int pPrice, quantity, totalPrice;

    public ClassCart()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public ClassCart(string pNum, string pName, string pCompany, string pImage, int pPrice, int quantity, int totalPrice)
    {
        this.PNum = pNum;
        this.PName = pName;
        this.PCompany = pCompany;
        this.PImage = pImage;
        this.PPrice = pPrice;
        this.Quantity = quantity;
        this.TotalPrice = totalPrice;
    }

    public string PNum
    {
        get
        {
            return pNum;
        }

        set
        {
            pNum = value;
        }
    }

    public string PName
    {
        get
        {
            return pName;
        }

        set
        {
            pName = value;
        }
    }

    public string PCompany
    {
        get
        {
            return pCompany;
        }

        set
        {
            pCompany = value;
        }
    }

    public string PImage
    {
        get
        {
            return pImage;
        }

        set
        {
            pImage = value;
        }
    }

    public int PPrice
    {
        get
        {
            return pPrice;
        }

        set
        {
            pPrice = value;
        }
    }

    public int Quantity
    {
        get
        {
            return quantity;
        }

        set
        {
            quantity = value;
        }
    }

    public int TotalPrice
    {
        get
        {
            return totalPrice;
        }

        set
        {
            totalPrice = value;
        }
    }
    public static DataTable GetAll()
    {
        string strSql = "SELECT * FROM [carttb]";
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        return dt;
    }
    public void Insert()
    {
        string strSql = "INSERT INTO [carttb]";
        strSql += "([pNum],[pName],[pCompany],[pImage],[pPrice],[quantity],[totalPrice])";
        strSql += "VALUES ('{0}','{1}','{2}','{3}',{4},{5},{6})";
        strSql = string.Format(strSql, this.pNum, this.pName, this.pCompany, this.pImage, this.PPrice, this.quantity, this.totalPrice);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    public void Update()
    {
        string strSql = "UPDATE [carttb] SET [Quantity]={0} , [totalPrice]={1} WHERE [pNum]='{2}'";
        strSql = string.Format(strSql, this.quantity, this.totalPrice, this.pNum);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    public static void DeleteAll()
    {
        string strSql = "DELETE * FROM [carttb] ";

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    // return index in dataTable or -1
    public void DeleteItem()
    {
        string str = "DELETE * FROM [carttb] WHERE [pNum]='{0}'";
        str = string.Format(str, this.pNum);

        Dbase.ChangeTable(str, "DBU.accdb");
    }

    public static int GetOrderTotalPrice()
    {
        string strSql = "SELECT * FROM [carttb]";
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        int sum = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
            sum += int.Parse(dt.Rows[i]["totalPrice"].ToString());
        return sum;
    }
    public static int FindCartByPnum(string pNum)
    {
        DataTable dt = GetAll();
        for (int i = 0; i < dt.Rows.Count; i++)
            if (dt.Rows[i]["pNum"].ToString() == pNum)
                return i;
        return -1;
    }
}
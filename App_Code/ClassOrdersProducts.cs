using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ClassOrdersProducts
/// </summary>
public class ClassOrdersProducts
{

    private int oNum, pNum, quantity, totalPrice;

    public ClassOrdersProducts()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public ClassOrdersProducts(int oNum, int pNum, int quantity, int totalPrice)
    {
        this.ONum = oNum;
        this.PNum = pNum;
        this.Quantity = quantity;
        this.TotalPrice = totalPrice;
    }

    public int ONum
    {
        get
        {
            return oNum;
        }

        set
        {
            oNum = value;
        }
    }

    public int PNum
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
        string strSql = "SELECT * FROM [orders_products]";
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        return dt;
    }
    public static DataTable GetAllByOrderNum(string pnum)
    {
        string strSql = "SELECT * FROM [orders_products] WHERE [products_code]={0}";
        strSql = string.Format(strSql, pnum);
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        return dt;
    }
    public void Insert()
    {
        string strSql = "INSERT INTO [orders_products]";
        strSql += "([order_number],[product_code],[amount],[total_price])";
        strSql += "VALUES ({0},{1},{2},{3})";
        strSql = string.Format(strSql, this.oNum, this.pNum, this.quantity, this.totalPrice);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
}
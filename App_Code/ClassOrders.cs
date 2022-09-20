using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ClassOrders
/// </summary>
public class ClassOrders
{
    private string oNum, oDate, status;
    private int orderTotalPrice;
    private string userId;

    public ClassOrders()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public ClassOrders(string oDate, string status, int orderTotalPrice, string userId)
    {
        this.ODate = oDate;
        this.Status = status;
        this.OrderTotalPrice = orderTotalPrice;
        this.UserId = userId;
    }

    public string ONum
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

    public string ODate
    {
        get
        {
            return oDate;
        }

        set
        {
            oDate = value;
        }
    }

    public string Status
    {
        get
        {
            return status;
        }

        set
        {
            status = value;
        }
    }

    public int OrderTotalPrice
    {
        get
        {
            return orderTotalPrice;
        }

        set
        {
            orderTotalPrice = value;
        }
    }

    public string UserId
    {
        get
        {
            return userId;
        }

        set
        {
            userId = value;
        }
    }
    public void Insert()
    {
        string strSql = "INSERT INTO [orders]";
        strSql += "([orderdate],[status],[orderTotalPrice],[userid])";
        strSql += "VALUES (#{0}#,'{1}',{2},{3})";
        strSql = string.Format(strSql, this.oDate, this.status, this.orderTotalPrice, this.userId);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }

    public void Delete()
    {
        string strSql = "DELETE * FROM [orders] WHERE [oNum]={0}";

        strSql = string.Format(strSql, this.oNum);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }

    public static int GetNumOfLastOrder()
    {
        string strSql = "SELECT * FROM [orders]";
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        return int.Parse(dt.Rows[dt.Rows.Count - 1]["oNum"].ToString());
    }
}
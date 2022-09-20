using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ClassSupplier
/// </summary>
public class ClassSupplier
{
    private string sNum, sId, sName, sAddress, sPhone,sEmail;

    public ClassSupplier()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public ClassSupplier( string sId, string sName, string sAddress, string sPhone, string sEmail)
    {
        this.SId = sId;
        this.SName = sName;
        this.SAddress = sAddress;
        this.SPhone = sPhone;
        this.SEmail = sEmail;
    }

    public string SNum
    {
        get
        {
            return sNum;
        }

        set
        {
            sNum = value;
        }
    }

    public string SId
    {
        get
        {
            return sId;
        }

        set
        {
            sId = value;
        }
    }

    public string SName
    {
        get
        {
            return sName;
        }

        set
        {
            sName = value;
        }
    }

    public string SAddress
    {
        get
        {
            return sAddress;
        }

        set
        {
            sAddress = value;
        }
    }

    public string SPhone
    {
        get
        {
            return sPhone;
        }

        set
        {
            sPhone = value;
        }
    }

    public string SEmail
    {
        get
        {
            return sEmail;
        }

        set
        {
            sEmail = value;
        }
    }
    public static DataTable GetAll()
    {
        string strSql = "SELECT * FROM [suppliers]";
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        return dt;
    }//getAll
}
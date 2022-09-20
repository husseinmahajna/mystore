using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Configuration;

using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;
/// <summary>
/// Summary description for ClassMessages
/// </summary>
public class ClassMessages
{
    private string num, subject, content, usertype, userid;

    public ClassMessages()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public ClassMessages( string subject, string content, string usertype, string id)
    {
        this.Subject = subject;
        this.Content = content;
        this.Usertype = usertype;
        this.Id = id;
    }

    public string Num
    {
        get
        {
            return num;
        }

        set
        {
            num = value;
        }
    }

    public string Subject
    {
        get
        {
            return subject;
        }

        set
        {
            subject = value;
        }
    }

    public string Content
    {
        get
        {
            return content;
        }

        set
        {
            content = value;
        }
    }

    public string Usertype
    {
        get
        {
            return usertype;
        }

        set
        {
            usertype = value;
        }
    }

    public string Id
    {
        get
        {
            return userid;
        }

        set
        {
            userid = value;
        }
    }
    public static DataTable GetAll()
    {
        string strSql = "SELECT * FROM [messages]";
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        return dt;
    }
    public void Insert()//we get back here
    {
        string strSql = "INSERT INTO [messages]";
        strSql += "([subject],[content],[usertype],[userid])";
        strSql += "VALUES ('{0}','{1}','{2}','{3}')";
        strSql = string.Format(strSql,this.subject,this.content,this.usertype,this.userid);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    public void Delete()
    {
        string strSql = "DELETE * FROM [messsages] WHERE [num]={0}";

        strSql = string.Format(strSql, this.num);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
}
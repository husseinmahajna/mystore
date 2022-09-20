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
/// Summary description for ClassUser
/// </summary>
public class ClassUser
{

    private string id, firstname, lastname, dateofbirth, gender,
        phone, email, address, mailbox,
        micode, username, password, isadmin,imguser;
    public ClassUser()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public ClassUser(string firstname, string lastname, string dateofbirth, string gender, string phone,
        string email, string address, string mailbox, string micode, string username, string password, string isadmin,string imguser)
    {
        this.firstname = firstname;
        this.lastname = lastname;
        this.dateofbirth = dateofbirth;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.mailbox = mailbox;
        this.micode = micode;
        this.username = username;
        this.password = password;
        this.isadmin = isadmin;
        this.Imguser = imguser;
    }

    public string Id
    {
        get
        {
            return id;
        }

        set
        {
            id = value;
        }
    }

    public string Firstname
    {
        get
        {
            return firstname;
        }

        set
        {
            firstname = value;
        }
    }

    public string Lastname
    {
        get
        {
            return lastname;
        }

        set
        {
            lastname = value;
        }
    }

    public string Dateofbirth
    {
        get
        {
            return dateofbirth;
        }

        set
        {
            dateofbirth = value;
        }
    }

    public string Gender
    {
        get
        {
            return gender;
        }

        set
        {
            gender = value;
        }
    }

    public string Phone
    {
        get
        {
            return phone;
        }

        set
        {
            phone = value;
        }
    }

    public string Email
    {
        get
        {
            return email;
        }

        set
        {
            email = value;
        }
    }

    public string Address
    {
        get
        {
            return address;
        }

        set
        {
            address = value;
        }
    }

    public string Mailbox
    {
        get
        {
            return mailbox;
        }

        set
        {
            mailbox = value;
        }
    }

    public string Micode
    {
        get
        {
            return micode;
        }

        set
        {
            micode = value;
        }
    }

    public string Username
    {
        get
        {
            return username;
        }

        set
        {
            username = value;
        }
    }

    public string Password
    {
        get
        {
            return password;
        }

        set
        {
            password = value;
        }
    }

    public string Isadmin
    {
        get
        {
            return isadmin;
        }

        set
        {
            isadmin = value;
        }
    }

    public string Imguser
    {
        get
        {
            return imguser;
        }

        set
        {
            imguser = value;
        }
    }

    public static DataTable GetAll()
    {
        string strSql = "SELECT * FROM [users]";
        DataTable dt = Dbase.SelectFromTable(strSql, "DBU.accdb");
        return dt;
    }
    public static DataTable GetOrders(string id)
    {
        string str = "SELECT orders.oNum, orders.orderdate, orders.status, orders.orderTotalPrice, products.code, products.product_name, orders_products.amount FROM orders " +
            "INNER JOIN(products INNER JOIN orders_products ON products.code = orders_products.product_code) ON orders.oNum = orders_products.order_number" +
            " WHERE(((orders.userid) = {0}));";

        str = string.Format(str, id);
        DataTable dt = Dbase.SelectFromTable(str, "DBU.accdb");
        return dt;
    }
    public void Insert()//we get back here
    {
        string strSql = "INSERT INTO [users]";
        strSql += "([firstname],[lastname],[dateofbirth],[gender],[phone],[email],[address],[mailbox],[micode],[username],[password],[isadmin],[userimage])";
        strSql += "VALUES ('{0}','{1}',#{2}#,'{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}',{11},'{12}')";
        strSql = string.Format(strSql, this.firstname, this.lastname, this.dateofbirth, this.gender, this.phone,this.email,this.address,this.mailbox,this.micode,this.username,this.password,this.isadmin,this.imguser);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    public void Delete()
    {
        string strSql = "DELETE * FROM [users] WHERE [id]={0}";

        strSql = string.Format(strSql, this.id);

        Dbase.ChangeTable(strSql, "DBU.accdb");
    }
    public void Update()
    {
        string str = "UPDATE [users] SET [firstname]='{0}' , [lastname]='{1}' , [dateofbirth]=#{2}# , [gender]='{3}' , [phone]='{4}' , [email]='{5}' , [address]='{6}' , [mailbox]='{7}' , [micode]='{8}' , [username]='{9}' , [password]='{10}' , [isadmin]={11},[userimage]='{12}' WHERE [id]={13} ";
        str = string.Format(str,this.firstname,this.lastname,this.dateofbirth,this.gender,this.phone,this.email,this.address,this.mailbox,this.micode,this.username,this.password,this.isadmin,this.imguser,this.id);
        Dbase.ChangeTable(str, "DBU.accdb");
    }
    public static int FindUserById(string userId)
    {
        DataTable dt = GetAll();
        for (int i = 0; i < dt.Rows.Count; i++)
            if (dt.Rows[i]["id"].ToString() == userId)
                return i;
        return -1;
    }
    // return index in dataTable or -1
    public static int FindUserByUserName(string userName)
    {
        DataTable dt = GetAll();
        for (int i = 0; i < dt.Rows.Count; i++)
            if (dt.Rows[i]["username"].ToString() == userName)
                return i;
        return -1;
    }
}
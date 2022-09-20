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

public partial class Messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = ClassMessages.GetAll();
        gdv_msgs.DataSource = dt;
        gdv_msgs.DataBind();
    }
}
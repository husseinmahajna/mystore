﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = ClassUser.GetOrders(Session["userid"].ToString());
        gdv_orders.DataSource = dt;
        gdv_orders.DataBind();
    }
}
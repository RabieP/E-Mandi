﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        welc_lbl.Text = "Welcome to E-Mandi <br/><br/> You've logged as an Customer. <br/> <br/> " + Session["fname"].ToString() + " " + Session["lname"].ToString();
    }
}
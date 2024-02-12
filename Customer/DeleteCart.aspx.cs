using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Customer_DeleteCart : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, delsql, cartid;
  

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);

        if (Request.QueryString["cartid"] == "")
        {
            Response.Redirect("Cart.aspx");
        }
       
         
        delsql = "DELETE FROM Cart where cartid ='" + Request.QueryString["cartid"] + "'";
        cmd.Connection = con;
        cmd.CommandText = delsql;

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("Cart.aspx");
        }

        finally
        {
            con.Close();
        }

    }
}
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Customer_AddToCart : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, isql, cartid;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
        cartid = DateTime.Now.ToString("Cr-yy-HHmmss");

        if (Session["cusid"] == null)
        {
            Response.Redirect("CustomerLogin.aspx");
        }
       
              
        isql = "insert into Cart values('" + cartid + "','" + Request.QueryString["pid"] + "',1,'" + Session["cusid"].ToString() + "')";
        //Response.Write(str)
        cmd.Connection = con;
        cmd.CommandText = isql;

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
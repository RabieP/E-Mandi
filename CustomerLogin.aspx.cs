using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CustomerLogin : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, isql;
    SqlDataAdapter da;

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
    }
    protected void login_btn_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            da = new SqlDataAdapter("select customerid, firstname, lastname, email from Customer where username = '" + uid_txt.Text + "' and password = '" + pwd_txt.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
           
            if (dt.Rows[0]["customerid"] == "")
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            else
            {
                Session["cusid"] = dt.Rows[0]["customerid"];
                Session["fname"] = dt.Rows[0]["firstname"];
                Session["lname"] = dt.Rows[0]["lastname"];
                Session["email"] = dt.Rows[0]["email"];

                Response.Redirect("~/Customer/Home.aspx");
            }
        }
        catch (Exception ex)
        {
           msg_lbl.Text = "You've Entered Invalid Login Details. Try Again";
        }

        finally
        {
            con.Close();
        }
    }
}
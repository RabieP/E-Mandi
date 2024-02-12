using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminLogin : System.Web.UI.Page
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


        if ((uid_txt.Text.Equals("Admin")) && (pwd_txt.Text.Equals("Admin")))
        {
            Response.Redirect("~/Admin/Home.aspx");
        }
        else if ((uid_txt.Text.Equals("admin")) && (pwd_txt.Text.Equals("admin")))
        {
            Response.Redirect("~/Admin/Home.aspx");
        }
        else if ((uid_txt.Text.Equals("ADMIN")) && (pwd_txt.Text.Equals("ADMIN")))
        {
            Response.Redirect("~/Admin/Home.aspx");
        }
        else if ((uid_txt.Text.Equals("dhruv")) && (pwd_txt.Text.Equals("123456")))
        {
            Response.Redirect("~/Admin/Home.aspx");
        }
        else
        {
            msg_lbl.Text = "You've Entered Invalid Login Details. Try Again";
        }

        /*try
        {
            con.Open();
            da = new SqlDataAdapter("select adminid, aname, email from Administrator where username = '" + uid_txt.Text + "' and password = '" + pwd_txt.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows[0]["adminid"] == "")
            {
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {
                Session["adminid"] = dt.Rows[0]["adminid"];
                Session["fname"] = dt.Rows[0]["aname"];
                Session["email"] = dt.Rows[0]["email"];

                Response.Redirect("~/Admin/Home.aspx");
            }
        }
        catch (Exception ex)
        {
            msg_lbl.Text = "You've Entered Invalid Login Details. Try Again";
        }

        finally
        {
            con.Close();
        }*/
    }
}
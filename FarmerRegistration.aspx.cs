using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class FarmerRegistration : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, isql;

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
        farmid_txt.Text = DateTime.Now.ToString("k-yy-HHmmss");
    }
    protected void add_btn_Click(object sender, EventArgs e)
    {

        isql = "INSERT INTO Farmer VALUES ('"
             + farmid_txt.Text + "' , '"
             + fname_txt.Text + "' , '"
             + lname_txt.Text + "' , '"
             + address_txt.Text + "' , '"
             + city_txt.Text + "' , '"
             + state_txt.Text + "' , '"
             + pin_txt.Text + "' , '"
             + email_txt.Text + "' , '"
             + phone_txt.Text + "' , '"
             + uname_txt.Text + "' , '"
             + cpass_txt.Text + "' , '"
             + aadharcardno_txt.Text + "')";

        cmd.Connection = con;
        cmd.CommandText = isql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            msg_lbl.Text = "Farmer Registered Successfully.";
        }
        catch (Exception excep)
        {
            msg_lbl.Text = "Not Succesfull." + excep.Message;
        }
        finally
        {
            con.Close();
        }
    }
}
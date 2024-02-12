using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_EditCategory : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, sql, updsql;
    SqlDataReader rdr;

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
    }
    protected void catid_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        sql = "select categoryname from Category where categoryid = " + catid_ddl.SelectedItem.Text;
        cmd.Connection = con;
        cmd.CommandText = sql;
        try
        {
            con.Open();
            rdr = cmd.ExecuteReader();
            rdr.Read();

            cat_txt.Text = rdr.GetString(0);
            rdr.Close();
        }

        finally
        {
            con.Close();
        }
    }
    protected void edit_btn_Click(object sender, EventArgs e)
    {
        updsql = "UPDATE Category SET categoryname = '" 
            + cat_txt.Text + "' WHERE categoryid = "
            + catid_ddl.SelectedValue ;

        cmd.Connection = con;
        cmd.CommandText = updsql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            msg_lbl.Text = "Category Updated Successfully.";
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
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Customer_CancelOrder : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, sql, delsql;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
    }
    protected void ordid_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        sql = "select orderdate, ordertotal from OrderMaster where orderid = " + ordid_ddl.SelectedValue;
        cmd.Connection = con;
        cmd.CommandText = sql;
        try
        {
            con.Open();
            rdr = cmd.ExecuteReader();
            rdr.Read();
            
            orddate_txt.Text = rdr.GetString(0);
            ordamt_txt.Text = rdr.GetDecimal(1).ToString();
            
            rdr.Close();
        }

        finally
        {
            con.Close();
        }
    }
    protected void cancel_btn_Click(object sender, EventArgs e)
    {
        delsql = "DELETE FROM OrderMaster WHERE orderid = " + ordid_ddl.SelectedValue + "; DELETE FROM OrderDetails Where orderid = " + ordid_ddl.SelectedValue + "; DELETE FROM Bill Where orderid = " + ordid_ddl.SelectedValue + "; DELETE FROM Payment Where orderid = " + ordid_ddl.SelectedValue;

        cmd.Connection = con;
        cmd.CommandText = delsql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            msg_lbl.Text = "Order Cancelled Successfully.";
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
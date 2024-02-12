using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_DispatchOrder : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, updsql, oid, cname, amt;

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
       
        //date_lbl.Text = DateTime.Now.ToString("dd-MMM-yyyy");
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        oid = row.Cells[0].Text;
        cname = row.Cells[1].Text + " " + row.Cells[2].Text;
        amt = row.Cells[3].Text;

        updsql = "UPDATE OrderMaster SET status = 'Dispatch' WHERE orderid = " + oid;
           
        cmd.Connection = con;
        cmd.CommandText = updsql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            //msg_lbl.Text = "Order Dispatched Successfully.";
            Response.Redirect("~/Admin/DispatchOrder.aspx");
        }
        catch (Exception excep)
        {
            msg_lbl.Text = "Not Dispatched." + excep.Message;
        }
        finally
        {
            con.Close();
        }
    }
}
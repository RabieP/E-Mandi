using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Customer_Cart : System.Web.UI.Page
{
    SqlConnection con;
    String  updsql;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
    double total;

    protected void Page_Load(object sender, EventArgs e)
    {
           con = new SqlConnection(sqlConStr);


           if (Session["cusid"] == null)
            {
                Response.Redirect("~/CustomerLogin.aspx");
            }
           
           
                total = 0;
                int i = 0;
               
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    total = total + Convert.ToInt32(((TextBox)GridView1.Rows[i].FindControl("txtqty")).Text) * Convert.ToDouble(GridView1.Rows[i].Cells[4].Text);
                }

                double dblNumber = total;
                string strFormated = "Rs/-" + string.Format("{0:###0.#0}", dblNumber);
                lblTotal.Text = strFormated;

            
       
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
            
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
       
        
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
               
                string strQuantity = ((TextBox)GridView1.Rows[i].FindControl("txtqty")).Text;

                string strCartid = ((HiddenField)GridView1.Rows[i].FindControl("txtcartid")).Value;

                updsql = "UPDATE Cart set quantity = " + strQuantity + " where cartid = '" + strCartid + "';";
                

                try
                {
                    cmd.Connection = con;
                    cmd.CommandText = updsql;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    //Response.Redirect("~/Customer/Cart.aspx");
                }
                catch (SqlException ex)
                {
                    string errorMsg = "Error in Updation";
                    errorMsg += ex.Message;
                    throw new Exception(errorMsg);
                }
                finally
                {
                    con.Close();
                }
            }
        
    }
    protected void btncheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Confirm.aspx");
    }
}
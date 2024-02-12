using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Customer_MakePayment : System.Web.UI.Page
{
    SqlConnection con;
    String isql, sql;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(sqlConStr);
        txtPDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");

        if (!Page.IsPostBack == true)
        {
            sql = "select orderid, ordertotal from OrderMaster where Status = 'Ordered' and customerid = '" + Session["cusid"] + "'";
            //Response.Write(sql);
            cmd.Connection = con;
            cmd.CommandText = sql;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                reader.Read();

                lblOrderNo.Text = reader.GetInt32(0).ToString();
                txtAmount.Text = reader.GetDecimal(1).ToString();

                reader.Close();
            }

            finally
            {
                con.Close();
            }
        }

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        isql = "INSERT INTO Payment (customerid, orderid, paymenttypeid, amount, creditcardno, CVV, expirrydate, nameoncard, pdate) VALUES ('"
                       + Session["cusid"] + "' , "
                       + lblOrderNo.Text + " , "
                       + ddlPaymentType.SelectedValue + " , "
                       + txtAmount.Text + " , '"
                       + txtCardNumber.Text + "' , '"
                       + txtCVV.Text + "' , '"
                       + txtExpiryMonth.Text + "' , '"
                       + txtNameOnCard.Text + "' , '"
                       + txtPDate.Text + "'); Update OrderMaster Set Status = 'Paid' Where orderid = " + lblOrderNo.Text;

        cmd.Connection = con;
        cmd.CommandText = isql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            lblmessage.Text = "Order Amount Paid  Successfully.";
            Response.Redirect("Thanks.aspx");

        }
        catch (Exception excep)
        {
            lblmessage.Text = "Order Amount Not Placed." + excep.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void ddlPaymentType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPaymentType.SelectedItem.Text == "COD")
        {
            btnSave.CausesValidation = false;
            txtCardNumber.Enabled = false;
            txtNameOnCard.Enabled = false;
            txtCVV.Enabled = false;
            txtExpiryMonth.Enabled = false;
        
        }
    }
}
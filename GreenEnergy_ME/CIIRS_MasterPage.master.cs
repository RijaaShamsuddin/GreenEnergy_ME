using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using CIIRSUtility;
using System.Web.UI.WebControls;
using System.Data;

public partial class CIIRS_MasterPage : System.Web.UI.MasterPage
{
    //public string client_no = 0,flag;
    dbAccess db = new dbAccess();
    DataTable dt = new DataTable();
    int u_id;
    int vRes;
    public string st, client_no;
    query q;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            client_no = Request.QueryString["client_no"];
        }
        catch (Exception ex)
        {
            u_id = Convert.ToInt32(Session["u_id"].ToString());
            //flag = Convert.ToInt16(Session["flag"].ToString());   
            dt = new DataTable();
            q = new query();
            dt = q.getUser_Det(Convert.ToString(u_id));
            lbl_username.Text = "You are Signed in as " + dt.Rows[0]["First_Name"].ToString() + ' ' + dt.Rows[0]["Last_Name"].ToString();
        }
    }
    protected void lbtn_SignOut_Click(object sender, EventArgs e)
    {
        dt = new DataTable();
        q = new query();
        dt = q.getUser_Det(Convert.ToString(u_id));
        try { 
            db.OpenConn();
            this.db.Cmd.CommandType = CommandType.Text;
            this.db.Cmd.CommandTimeout = 0;
            st = " Update Administrator Set User_Login = 0"
                 + "where u_id = " + u_id + " and status = 1 ";
            this.db.Cmd.CommandText = st;
            //this.db.Da.SelectCommand = this.db.Cmd;
            //dt = new DataTable();
            vRes = db.cmd.ExecuteNonQuery();
            db.CloseConn();
            st = "";

            if (vRes == 1)
            {
                Session.Abandon();
                Response.Redirect("LoginScreen.aspx");
            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message.ToString() + "')", true);
        }
    }
}

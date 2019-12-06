using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace Time_Bound_Condition
{
    public partial class Edit_Time_Bound : System.Web.UI.Page
    {
        Models.TBCModelView obj_cond;
        DataTable dt_show;
        int u_id, cpno, client_no;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cdate = "";
            if (!IsPostBack)
            {
                //u_id = Convert.ToInt32(Request["u_id"]);
                //cpno = Convert.ToInt32(Request["cpno"]);
                //client_no = Convert.ToInt32(Request["client_no"]);
                u_id = 3010;
                cpno = 10600;
                client_no = 5421;

                cdate = DateTime.Now.ToString("MM/dd/yyyy");
                //tbcdate.Text = String.Format("{0:MM/dd/yyyy}", cdate);

                //lblcpno.Text = Convert.ToString(cpno);
                //lblclientno.Text = Convert.ToString(client_no);

                obj_cond = new Models.TBCModelView();
                dt_show = new DataTable();
                dt_show = obj_cond.get_tbcinfo(client_no, cpno);
                if (dt_show.Rows.Count > 0 && dt_show != null)
                {
                    //txtguarantorname.Text = dt_show.Rows[0]["guarantor_name"].ToString();
                    //txttowhom.Text = dt_show.Rows[0]["guarantee_given"].ToString();
                    //flamtguarantee.Text = dt_show.Rows[0]["amt_guarantee"].ToString();
                    //vddate.Text = dt_show.Rows[0]["validity_period"].ToString();
                    //flnetworthguaran.Text = dt_show.Rows[0]["networth_guarantor"].ToString();
                    Repeater.DataSource = dt_show;
                    Repeater.DataBind();


                }
            }
        }

        protected void btnupdatecond_Click(object sender, EventArgs e)
        {
            int vstatus = 0;
            string error_status = "";
            try
            {
                obj_cond = new Models.TBCModelView();
                cpno = 10600;
                client_no = 5421;
                vstatus = obj_cond.Edit_tbc(tbcdate.Text, txtcondition.Text, cpno, client_no, ref error_status);
                if (vstatus == 1)
                {
                    //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Update Record Successfully')", true);
                    lblmsg.Visible = true;
                    lblmsg.Text = "Record Inserted Succesfully";
                    lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                    txtcondition.Text = "";
                    tbcdate.Text = "";

                }
                else
                {
                    throw new Exception(error_status);
                }

            }
            catch (Exception ex)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + error_status + "')", true);
            }

        }

        protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}
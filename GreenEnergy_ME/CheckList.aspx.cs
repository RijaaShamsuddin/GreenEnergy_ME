using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using CIIRSUtility;

namespace GreenEnergy_ME
{
    public partial class CheckList : System.Web.UI.Page
    {
        Models.ModelView get, brwr, obj_cond;
        //DataTable Cond_Table;
        public int report = 0, dep_id, dep_id_rep;
        public string client_no, cpno, nat_bus;
        DataTable dt,dtc;

        protected void Page_Load(object sender, EventArgs e)
        {
            //client_no = Request["client_no"];
            //cpno = Request["cpno"];
            //dep_id = Convert.ToInt32(Request["dep_id"]);
            if (!IsPostBack)
            {
                client_no = "21116";
                cpno = "109447";

            if (dep_id == 900 || dep_id == 910 || dep_id == 1000 || dep_id == 5000 || dep_id == 1140)
            {
                dep_id_rep = 1;
            }
            else
            {
                dep_id_rep = 0;
            }

            brwr = new Models.ModelView();
            dt = new DataTable();
            dt = brwr.get_brwrtype(client_no);
            hdfbrwr_type.Value = dt.Rows[0]["brwr_type"].ToString();

           
                get = new Models.ModelView();
                dtc = new DataTable();
                dtc = get.get_checklist();
                Check_list.DataSource = dtc;
                Check_list.DataBind();
            }
        }

        protected void btnsavedata_Click(object sender, EventArgs e)
        {
            int vstatus = 0;
            string error_status = "";
            try
            {
                obj_cond = new Models.ModelView();
                foreach (GridViewRow row in Check_list.Rows)
                {
                    RadioButton rbyes = (RadioButton)row.FindControl("Yes");
                    RadioButton rbno = (RadioButton)row.FindControl("No");
                    RadioButton rbnot = (RadioButton)row.FindControl("NA");

                    if (rbyes != null || rbno != null || rbnot != null)
                    {
                        if (rbyes.Checked == true || rbno.Checked == true || rbnot.Checked == true)
                        {
                            //string client_no = Request["client_no"];
                            //string cpno = Request["cpno"];
                            client_no = "21116";
                            cpno = "109447";
                            Label lbl = (Label)row.FindControl("lblmasterid");
                            int master = Convert.ToInt32(lbl.Text);
                            int rby = Convert.ToInt32(rbyes.Checked);
                            int rbn = Convert.ToInt32(rbno.Checked);
                            int rbna = Convert.ToInt32(rbnot.Checked);
                            vstatus = obj_cond.Insert_checklist(client_no, cpno, Convert.ToInt32(hdfbrwr_type.Value.ToString()), master, rby, rbn, rbna, ref error_status);

                        }
                    }
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
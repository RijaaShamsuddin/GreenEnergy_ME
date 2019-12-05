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
        DataTable dt,dtc, dtci;

        protected void Page_Load(object sender, EventArgs e)
        {
            //client_no = Request["client_no"];
            //cpno = Request["cpno"];
            //dep_id = Convert.ToInt32(Request["dep_id"]);
            if (!IsPostBack)
            {
                client_no = "9742";
                cpno = "123456";

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
                int brwr_value = Convert.ToInt32(hdfbrwr_type.Value);

            if (brwr_value == 4)

                {
                    get = new Models.ModelView();
                    dtci = new DataTable();
                    dtci = get.get_checklist_Ind();
                    Check_list.DataSource = dtci;
                    Check_list.DataBind();
                }
            else
                {
                    get = new Models.ModelView();
                    dtc = new DataTable();
                    dtc = get.get_checklist_SME();
                    Check_list.DataSource = dtc;
                    Check_list.DataBind();
                }
            }
        }

        protected void Check_list_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "insurance";
                e.Row.Cells[0].ColumnSpan = 2;
                e.Row.Cells[0].Visible = true;
                TableCell tc = new TableCell();
                tc.Text = "* insurance will be advance for one year and then it will be part of the monthly / quartely instalment";
                tc.ColumnSpan = 5;

                GridViewRow gr = new GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal);

                gr.Cells.Add(tc);


                Table gvTable = (Table)e.Row.Parent;
                gvTable.Controls.Add(gr);
            }
        }
        protected void btnsavedata_Click(object sender, EventArgs e)
        {
            int vstatus = 0;
            string error_status = "";
            int vindex = 0;
            try
            {
                obj_cond = new Models.ModelView();
                foreach (GridViewRow row in Check_list.Rows)
                {
                    //RadioButton rbyes = (RadioButton)row.FindControl("Yes");
                    //RadioButton rbno = (RadioButton)row.FindControl("No");
                    //RadioButton rbnot = (RadioButton)row.FindControl("NA");

                    RadioButton rbyes = (RadioButton)Check_list.Rows[vindex].FindControl("Yes");
                    RadioButton rbNo = (RadioButton)Check_list.Rows[vindex].FindControl("No");
                    RadioButton rbNA = (RadioButton)Check_list.Rows[vindex].FindControl("NA");

                    if (rbyes.Checked == true || rbNo.Checked == true || rbNA.Checked == true)
                    {
                        //client_no = Request["client_no"];
                        //cpno = Request["cpno"];
                        client_no = "9742";
                        cpno = "123456";
                        Label lbl = (Label)row.FindControl("lblmasterid");
                        int master = Convert.ToInt32(lbl.Text);
                        int rby = Convert.ToInt32(rbyes.Checked);
                        int rbn = Convert.ToInt32(rbNo.Checked);
                        int rbna = Convert.ToInt32(rbNA.Checked);
                        vstatus = obj_cond.Insert_checklist(client_no, cpno, Convert.ToInt32(hdfbrwr_type.Value.ToString()), master, rby, rbn, rbna, ref error_status);

                        RadioButton rbnextyes = (RadioButton)Check_list.Rows[vindex + 1].FindControl("Yes");
                        RadioButton rbnextNo = (RadioButton)Check_list.Rows[vindex + 1].FindControl("No");
                        RadioButton rbnextNA = (RadioButton)Check_list.Rows[vindex + 1].FindControl("NA");

                        if (rbnextyes.Checked == false && rbnextNo.Checked == false && rbnextNA.Checked == false)
                        {
                            //lblerror.Visible = true;
                            //lblerror.Text = "Select All checkboxes";
                            //lblerror.ForeColor = System.Drawing.Color.Red;
                            throw new Exception("Please Select All Checkboxes");

                        }
                        else
                        {
                            vindex += 1;
                        }
                    }

                }

                throw new Exception("Record inserted suceesfully");
            }

            catch (Exception ex)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + ex.Message.ToString() + "')", true);
            }
        }
            
        protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}
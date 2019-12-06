using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using CIIRSUtility;

namespace GreenEnergy_ME
{
    public partial class CheckList_Update : System.Web.UI.Page
    {
        Models.ModelView get, brwr, obj_cond;
        //DataTable Cond_Table;
        public int report = 0, dep_id, dep_id_rep;
        public string client_no, cpno, nat_bus;
        DataTable dt, dt_checklist;

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

                    get = new Models.ModelView();
                    dt_checklist = new DataTable();
                    dt_checklist = get.show_checklist(client_no,cpno);
                    Check_list.DataSource = dt_checklist;
                    Check_list.DataBind();
                }
            }
        

        
        protected void btnupdatedata_Click(object sender, EventArgs e)
        {
            int vstatus = 0;
            string error_status = "";

            try
            { 
                obj_cond = new Models.ModelView();
                foreach (GridViewRow row in Check_list.Rows)
                {
                    RadioButton rbyes = (RadioButton)row.FindControl("rbyes");
                    RadioButton rbNo = (RadioButton)row.FindControl("rbno");
                    RadioButton rbNA = (RadioButton)row.FindControl("rbna");

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
                        vstatus = obj_cond.Update_checklist(rby, rbn, rbna, client_no, cpno, Convert.ToInt32(hdfbrwr_type.Value.ToString()), master, ref error_status);

                         if (rbyes.Checked == false && rbNo.Checked == false && rbNA.Checked == false)
                        {
                            throw new Exception("Please Select All Checkboxes");
                        }
                        else
                        {
                            //lblmsg.Visible = true;
                            //lblmsg.Text = "Record Inserted Succesfully";
                            //lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                        }
                    }
                }
                throw new Exception("Record inserted suceesfully");
            }

            catch (Exception ex)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + error_status + "')", true);
            }
        }

        protected void Check_list_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (dt_checklist.Rows.Count > 0 && dt_checklist != null)
            {
                string error_status = "";
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                   
                    RadioButton rbyes = (RadioButton)e.Row.FindControl("rbyes");
                    if ( Convert.ToInt32(dt_checklist.Rows[e.Row.RowIndex]["Yes"].ToString()) == 1)
                    {
                        rbyes.Checked = true;
                    }

                    RadioButton rbno = (RadioButton)e.Row.FindControl("rbno");
                    if (Convert.ToInt32(dt_checklist.Rows[e.Row.RowIndex]["No"].ToString()) == 1)
                    {
                        rbno.Checked = true;
                    }

                    RadioButton rbna = (RadioButton)e.Row.FindControl("rbna");
                    if (Convert.ToInt32(dt_checklist.Rows[e.Row.RowIndex]["NA"].ToString()) == 1)
                    {
                        rbna.Checked = true;
                    }
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + error_status.ToString() + "')", true);
                }
            }

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

    }
}
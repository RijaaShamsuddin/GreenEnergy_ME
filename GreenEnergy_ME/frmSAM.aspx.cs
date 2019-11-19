using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmSAM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime dt = DateTime.Now;
    }
    protected void rdbpartial_CheckedChanged(object sender, EventArgs e)
    {
        if (rdbpartial.Checked == true)
        {
            rdbfullfinal.Checked = false;

            ckbChanges_approval.Checked = false;
            ckbLegal_Expense.Checked = false;
            ckbMarkup.Checked = false;
            ckbother.Checked = false;
            txtbother.Visible = false;
            
        }
    }
    protected void rdbfullfinal_CheckedChanged(object sender, EventArgs e)
    {
        if (rdbfullfinal.Checked == true)
        {
            rdbpartial.Checked = false;

            ckbChanges_approval.Checked = false;
            ckbLegal_Expense.Checked = false;
            ckbMarkup.Checked = false;
            ckbother.Checked = false;
            txtbother.Visible = false;

        }
    }
    protected void chkbsettlement_CheckedChanged(object sender, EventArgs e)
    {
        if (chkbsettlement.Checked == true)
        {
            rdbpartial.Enabled = true;
            rdbfullfinal.Enabled = true;
        }
        else
        {
            rdbpartial.Enabled = false;
            rdbpartial.Checked = false;
            rdbfullfinal.Enabled = false;
            rdbfullfinal.Checked = false;
        }
    }
    protected void ckbChanges_approval_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbChanges_approval.Checked == true)
        {
            ckbLegal_Expense.Checked = false;
            ckbMarkup.Checked = false;
            ckbother.Checked = false;
            txtbother.Visible = false;

            chkbsettlement.Checked = false;
            rdbpartial.Enabled = false;
            rdbpartial.Checked = false;
            rdbfullfinal.Enabled = false;
            rdbfullfinal.Checked = false;
        }
    }
    protected void ckbLegal_Expense_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbLegal_Expense.Checked == true)
        {
            ckbChanges_approval.Checked = false;
            ckbMarkup.Checked = false;
            ckbother.Checked = false;
            txtbother.Visible = false;

            chkbsettlement.Checked = false;
            rdbpartial.Enabled = false;
            rdbpartial.Checked = false;
            rdbfullfinal.Enabled = false;
            rdbfullfinal.Checked = false;

        }
    }
    protected void ckbMarkup_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbMarkup.Checked == true)
        {
            ckbChanges_approval.Checked = false;
            ckbLegal_Expense.Checked = false;
            ckbother.Checked = false;
            txtbother.Visible = false;

            chkbsettlement.Checked = false;
            rdbpartial.Enabled = false;
            rdbpartial.Checked = false;
            rdbfullfinal.Enabled = false;
            rdbfullfinal.Checked = false;

        }
    }
    protected void ckbother_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbother.Checked == true)
        {
            ckbChanges_approval.Checked = false;
            ckbLegal_Expense.Checked = false;
            ckbMarkup.Checked = false;
            txtbother.Visible = true;
        }
        else
        {
            txtbother.Visible = false;
        }
    }
    protected void CkbAmicable_CheckedChanged(object sender, EventArgs e)
    {
        if (CkbAmicable.Checked == true)
        {
            ckbthroughother.Checked = false;
            txtbthroughother.Visible = false;
            ckbRestructuring.Enabled = true;
            ckbRescheduling.Enabled = true; 
            ckbSale.Enabled = true;        
            ckbCompromise.Enabled = true;  
            ckbConsent.Enabled = true;     
            ckbSine.Enabled = true;
            ckbDebt.Enabled = true;        
        }
    }
    protected void ckbthroughother_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbthroughother.Checked == true)
        {
            CkbAmicable.Checked = false;
            txtbthroughother.Visible = true;

            ckbRestructuring.Checked = false;
            ckbRescheduling.Checked = false;
            ckbSale.Checked = false;
            ckbCompromise.Checked = false;
            ckbConsent.Checked = false;
            ckbSine.Checked = false;
            ckbDebt.Checked = false;

            ckbRestructuring.Enabled = false;
            ckbRescheduling.Enabled = false;
            ckbSale.Enabled = false;
            ckbCompromise.Enabled = false;
            ckbConsent.Enabled = false;
            ckbSine.Enabled = false;
            ckbDebt.Enabled = false;       

        }
    }
    protected void ckbIncrease_CheckedChanged(object sender, EventArgs e)
    {

        if (ckbIncrease.Checked == true)
        {
            ckbExisting.Checked = false;
            ckbReduce.Checked = false;
            ckbExit.Checked = false;
        }

    }
    protected void ckbExisting_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbExisting.Checked == true)
        {
            ckbIncrease.Checked = false;
            ckbReduce.Checked = false;
            ckbExit.Checked = false;
        }
    }
    protected void ckbReduce_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbReduce.Checked == true)
        {
            ckbExisting.Checked = false;
            ckbIncrease.Checked = false;
            ckbExit.Checked = false;
        }
    }
    protected void ckbExit_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbExit.Checked == true)
        {
            ckbExisting.Checked = false;
            ckbIncrease.Checked = false;
            ckbReduce.Checked = false;
        }
    }
}
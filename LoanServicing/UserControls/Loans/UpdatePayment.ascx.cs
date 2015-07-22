using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserControls_UpdatePayment : System.Web.UI.UserControl
{
    public int LoanID
    {
        set
        {
            odsPayment.SelectParameters["LoanID"].DefaultValue = value.ToString();
            hfLoanID.Value = value.ToString();
        }
        get
        {
            return hfLoanID.Value == "" ? 0 : Convert.ToInt32(hfLoanID.Value);
        }
    }
    public int PaymentID
    {
        set
        {
            odsPayment.SelectParameters["PaymentID"].DefaultValue = value.ToString();
        }
    }
    public string CurrentMode
    {
        set
        {
            if (value == "Insert")
            {
                dvPayment.ChangeMode(DetailsViewMode.Insert);
            }
            else if (value == "Edit")
            {
                dvPayment.ChangeMode(DetailsViewMode.Edit);
            }
        }
    }

    public string TargetControl
    {
        set
        {
            mpePayment.TargetControlID = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        mpePayment.CancelControlID = (dvPayment.FindControl("btnCancelPayment") as Button).ClientID;
    }

    protected void dvPayment_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        RaiseBubbleEvent(sender, e);
    }
    protected void dvPayment_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        RaiseBubbleEvent(sender, e);
    }

    public void Show()
    {
        mpePayment.Show();
    }

    private void SetPaymentDateRange()
    {
        Controls_CalendarTextbox ucPaymentDate = (Controls_CalendarTextbox)dvPayment.FindControl("ucPaymentDate");
        DataTable dtLoan = LoansBLL.Get(LoanID).Tables[0];
        ucPaymentDate.MinimumDate = Convert.ToDateTime(dtLoan.Rows[0]["StartDate"].ToString());
        ucPaymentDate.MaximumDate = Convert.ToDateTime(dtLoan.Rows[0]["EndDate"].ToString());
        ucPaymentDate.RangeErrorMessage = "Please enter a date between " + Convert.ToDateTime(dtLoan.Rows[0]["StartDate"].ToString()).ToShortDateString() + " and " + Convert.ToDateTime(dtLoan.Rows[0]["EndDate"].ToString()).ToShortDateString();
        ucPaymentDate.RangeRequired = true;
    }
    protected void dvPayment_DataBound(object sender, EventArgs e)
    {
        if (LoanID != 0)
        {
            SetPaymentDateRange();
        }
    }
}
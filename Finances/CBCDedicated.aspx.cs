﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.Finances
{
    public partial class CBCDedicated : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private decimal _begBalTotal2 = 0m;
        private decimal _changeTotal2 = 0m;
        private decimal _balanceTotal2 = 0m;

        protected void gvDFAcctSummary_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                _begBalTotal2 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "BegBal"));
                _changeTotal2 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "ChangeAmt"));
                _balanceTotal2 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "NewBalance"));

                LinkButton lb = e.Row.Cells[0].Controls[0] as LinkButton;
                lb.Text = DataBinder.Eval(e.Row.DataItem, "AcctDesc").ToString();
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Totals:";
                e.Row.Cells[3].Text = _begBalTotal2.ToString("c0");
                e.Row.Cells[4].Text = _changeTotal2.ToString("c0");
                e.Row.Cells[5].Text = _balanceTotal2.ToString("c0");
            }
        }

        protected void gvAcctTrans_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = e.Row.Cells[0].Controls[0] as LinkButton;
                lb.Text = string.Format("{0:MM/dd/yy}", DataBinder.Eval(e.Row.DataItem, "TransDate"));
            }
        }
    }
}
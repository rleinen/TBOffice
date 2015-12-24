using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.Finances
{
    public partial class MinistryDedicatedAccounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dsMinistryLeaders.SelectParameters["UserId"].DefaultValue = SessionMgr.User.UserID.ToString();

        }

        protected void ddlMinistryLeader_DataBound(object sender, EventArgs e)
        {
            ddlMinistryLeader.SelectedValue = SessionMgr.User.UserID.ToString();
        }

        protected void ddlMinistryLeader_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlFiscalYear_DataBound(object sender, EventArgs e)
        {
            ddlFiscalYear.SelectedValue = "20142015";
        }

        protected void ddlFiscalYear_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        decimal BegBalT = 0m;
        decimal ChangeT = 0m;
        decimal BalanceT = 0m;
        protected void gvUserDedAccounts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Compute Balance Columns
                decimal BegBal = 0m;
                decimal Change = 0m;
                decimal Balance = 0m;

                BegBal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "BegBalAmt"));
                Change = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "ChangeAmt"));
                Balance = BegBal + Change;

                e.Row.Cells[5].Text = Balance.ToString("c0");

                if (Balance < 0)
                {
                    e.Row.Cells[5].Font.Bold = true;
                    e.Row.Cells[5].ForeColor = System.Drawing.Color.Maroon;
                    e.Row.Cells[5].BackColor = System.Drawing.Color.LightGray;
                }

                // Set Select column text
                LinkButton lb = e.Row.Cells[0].Controls[0] as LinkButton;
                lb.Text = DataBinder.Eval(e.Row.DataItem, "AccountDesc").ToString();

                BegBalT += BegBal;
                ChangeT += Change;
                BalanceT += Balance;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[0].Text = "Totals: ";
                e.Row.Cells[3].Text = BegBalT.ToString("c0");
                e.Row.Cells[4].Text = ChangeT.ToString("c0");
                e.Row.Cells[5].Text = BalanceT.ToString("c0");
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
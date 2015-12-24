using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.Finances
{
    public partial class MinistryAccounts : System.Web.UI.Page
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

        }

        protected void ddlFiscalYear_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        decimal YTDActualT = 0m;
        decimal YTDBudgetT = 0m;
        decimal YTDBalanceT = 0m;
        decimal AnnualBudgetT = 0m;
        decimal AnnualBalanceT = 0m;
        protected void gvUserGFAccounts_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Compute Balance Columns
                decimal YTDActual = 0m;
                decimal YTDBudget = 0m;
                decimal YTDBalance = 0m;
                decimal AnnualBudget = 0m;
                decimal AnnualBalance = 0m;

                YTDActual = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "YTDAmt"));
                YTDBudget = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "YTDBudgetAmt"));
                YTDBalance = YTDBudget + YTDActual;

                AnnualBudget = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "BudgetAmt"));
                AnnualBalance = AnnualBudget + YTDActual;

                e.Row.Cells[6].Text = YTDBalance.ToString("c0");
                e.Row.Cells[7].Text = AnnualBalance.ToString("c0");

                if (YTDBalance < 0)
                {
                    e.Row.Cells[6].Font.Bold = true;
                    e.Row.Cells[6].ForeColor = System.Drawing.Color.Maroon;
                    e.Row.Cells[6].BackColor = System.Drawing.Color.LightGray ;
                }
                if (AnnualBalance < 0)
                {
                    e.Row.Cells[7].Font.Bold = true;
                    e.Row.Cells[7].ForeColor = System.Drawing.Color.Maroon;
                    e.Row.Cells[7].BackColor = System.Drawing.Color.LightGray;
                }

                // Set Select column text
                LinkButton lb = e.Row.Cells[0].Controls[0] as LinkButton;
                lb.Text = DataBinder.Eval(e.Row.DataItem, "AccountDesc").ToString();

                YTDActualT += YTDActual;
                YTDBudgetT += YTDBudget;
                YTDBalanceT += YTDBalance;
                AnnualBalanceT += AnnualBalance;
                AnnualBudgetT += AnnualBudget;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Totals: ";
                e.Row.Cells[3].Text = AnnualBudgetT.ToString("c0");
                e.Row.Cells[4].Text = YTDBudgetT.ToString("c0");
                e.Row.Cells[5].Text = YTDActualT.ToString("c0");
                e.Row.Cells[6].Text = YTDBalanceT.ToString("c0");
                e.Row.Cells[7].Text = AnnualBalanceT.ToString("c0");
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
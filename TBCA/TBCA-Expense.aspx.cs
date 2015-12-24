using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.TBCA
{
    public partial class TBCA_Expense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvIncExpSummary_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string label = DataBinder.Eval(e.Row.DataItem, "Fund").ToString();
                if (label == "Balance")
                {
                    foreach (TableCell cell in e.Row.Cells)
                    {
                        cell.Font.Bold = true;
                        cell.BackColor = System.Drawing.Color.LightGray;
                    }
                }
                else
                {
                    e.Row.Cells[3].Font.Bold = true;
                    e.Row.Cells[3].BackColor = System.Drawing.Color.LightGray;
                }
            }
            else if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = ddlFund.SelectedItem.Text;
            }
        }

        protected void ddlFund_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlFiscalYear_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlFiscalYear_DataBound(object sender, EventArgs e)
        {

        }

        private decimal _actualTotal = 0m;
        private decimal _budgetTotal = 0m;
        private decimal _balanceTotal = 0m;

        protected void gvIncomeDepts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                _actualTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "ActualAmt"));
                _budgetTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "BudgetAmt"));
                _balanceTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Difference"));

                LinkButton lb = e.Row.Cells[0].Controls[0] as LinkButton;
                lb.Text = DataBinder.Eval(e.Row.DataItem, "DeptDesc").ToString();
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Totals:";
                e.Row.Cells[3].Text = _actualTotal.ToString("c0");
                e.Row.Cells[4].Text = _budgetTotal.ToString("c0");
                e.Row.Cells[5].Text = _balanceTotal.ToString("c0");
            }
        }

        private decimal _actualTotal2 = 0m;
        private decimal _budgetTotal2 = 0m;
        private decimal _balanceTotal2 = 0m;
        protected void gvExpenseAccts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                _actualTotal2 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "ActualAmt"));
                _budgetTotal2 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "BudgetAmt"));
                _balanceTotal2 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Difference"));

                LinkButton lb = e.Row.Cells[0].Controls[0] as LinkButton;
                lb.Text = DataBinder.Eval(e.Row.DataItem, "AcctDesc").ToString();
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Totals:";
                e.Row.Cells[3].Text = _actualTotal2.ToString("c0");
                e.Row.Cells[4].Text = _budgetTotal2.ToString("c0");
                e.Row.Cells[5].Text = _balanceTotal2.ToString("c0");
            }
        }

        protected void gvExpenseAccts_SelectedIndexChanged(object sender, EventArgs e)
        {
            BudgetForm.Visible = true;
            BudgetForm.LoadBudget(Convert.ToInt32(ddlFiscalYear.SelectedValue), Convert.ToInt32(gvExpenseAccts.SelectedDataKey.Value));
        }

        protected void gvAcctTrans_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = e.Row.Cells[0].Controls[0] as LinkButton;
                lb.Text = string.Format("{0:MM/dd/yy}", DataBinder.Eval(e.Row.DataItem, "TransDate"));
            }
        }

        protected void gvMonthlySummary_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (Convert.ToString(DataBinder.Eval(e.Row.DataItem, "RowTitle")) == "Balance")
                {
                    foreach (TableCell cell in e.Row.Cells)
                    {
                        cell.Font.Bold = true;
                        cell.BackColor = System.Drawing.Color.LightSalmon;
                    }
                }

            }
        }
        protected void BudgetForm_BudgetUpdated(object sender, EventArgs e)
        {
            dsMonthlySummary.Select(DataSourceSelectArguments.Empty);
            gvMonthlySummary.DataBind();

            dsExpenseAccts.Select(DataSourceSelectArguments.Empty);
            gvExpenseAccts.DataBind();

            dsExpenseDepts.Select(DataSourceSelectArguments.Empty);
            gvExpenseDepts.DataBind();

            dsIncExpSummary.Select(DataSourceSelectArguments.Empty);
            gvIncExpSummary.DataBind();

        }

    }
}
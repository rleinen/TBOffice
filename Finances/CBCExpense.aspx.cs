using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.Finances
{
    public partial class CBCExpense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private decimal _actualTotal = 0m;
        private decimal _budgetTotal = 0m;
        private decimal _balanceTotal = 0m;
        protected void gvExpenseDepts_RowDataBound(object sender, GridViewRowEventArgs e)
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
        protected void gvExpenseSubDepts_RowDataBound(object sender, GridViewRowEventArgs e)
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

        private decimal _actualTotal3 = 0m;
        private decimal _budgetTotal3 = 0m;
        private decimal _balanceTotal3 = 0m;
        protected void gvExpenseAccts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                _actualTotal3 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "ActualAmt"));
                _budgetTotal3 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "BudgetAmt"));
                _balanceTotal3 += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Difference"));

                LinkButton lb = e.Row.Cells[0].Controls[0] as LinkButton;
                lb.Text = DataBinder.Eval(e.Row.DataItem, "AcctDesc").ToString();

                LinkButton lb4 = e.Row.Cells[4].Controls[1] as LinkButton;
                decimal bdgAmt = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "BudgetAmt"));
                lb4.Text = bdgAmt.ToString("c0");
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Totals:";
                e.Row.Cells[3].Text = _actualTotal3.ToString("c0");
                e.Row.Cells[4].Text = _budgetTotal3.ToString("c0");
                e.Row.Cells[5].Text = _balanceTotal3.ToString("c0");
            }
        }

        protected void gvExpenseAccts_SelectedIndexChanged(object sender, EventArgs e)
        {
            //BudgetForm.Visible = true;
            //BudgetForm.LoadBudget(Convert.ToInt32(ddlFiscalYear.SelectedValue), Convert.ToInt32(gvExpenseAccts.SelectedDataKey.Value));
        }

        protected void gvIncExpSummary_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string label = DataBinder.Eval(e.Row.DataItem, "General Fund").ToString();
                if (label == "Balance")
                {
                    e.Row.Cells[0].Font.Bold = true;
                    e.Row.Cells[1].Font.Bold = true;
                    e.Row.Cells[2].Font.Bold = true;
                    e.Row.Cells[3].Font.Bold = true;
                    e.Row.Cells[0].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[1].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[2].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[3].BackColor = System.Drawing.Color.LightGray;
                }
                else
                {
                    e.Row.Cells[3].Font.Bold = true;
                    e.Row.Cells[3].BackColor = System.Drawing.Color.LightGray;
                }
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

        protected void gvMonthlySummary_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string label = DataBinder.Eval(e.Row.DataItem, "RowTitle").ToString();
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
                    e.Row.Cells[15].Font.Bold = true;
                    e.Row.Cells[15].BackColor = System.Drawing.Color.LightGray;
                }
            }
        }

        protected void BudgetForm_BudgetUpdated(object sender, EventArgs e)
        {
            dsMonthlySummary.Select(DataSourceSelectArguments.Empty);
            gvMonthlySummary.DataBind();

            dsExpenseSubDepts.Select(DataSourceSelectArguments.Empty);
            gvExpenseSubDepts.DataBind();

            dsExpenseDepts.Select(DataSourceSelectArguments.Empty);
            gvExpenseDepts.DataBind();

            dsIncExpSummary.Select(DataSourceSelectArguments.Empty);
            gvIncExpSummary.DataBind();

        }

        protected void gvExpenseSubDepts_SelectedIndexChanged(object sender, EventArgs e)
        {
            BudgetForm.Visible = true;
            BudgetForm.LoadBudget(Convert.ToInt32(ddlFiscalYear.SelectedValue), Convert.ToInt32(gvExpenseSubDepts.SelectedDataKey.Value));
        }

    }
}
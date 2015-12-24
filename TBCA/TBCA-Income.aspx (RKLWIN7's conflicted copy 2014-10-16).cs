using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.TBCA
{
    public partial class TBCA_Income : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlFiscalYear_DataBound(object sender, EventArgs e)
        {

        }

        protected void ddlFiscalYear_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlFund_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void gvIncomeAccts_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvIncomeAccts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
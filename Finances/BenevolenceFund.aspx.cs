using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.Finances
{
    public partial class BenevolenceFund : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlFiscalYear_DataBound(object sender, EventArgs e)
        {

        }

        private void GetBFTransactions()
        {
            txtSearch.Text = txtSearch.Text.Trim();
            if (txtSearch.Text.Length == 0)
            {
                txtSearch.Text = " ";
            }
            dsBFGiftTrans.Select(DataSourceSelectArguments.Empty);
            gvBFGiftTrans.DataBind();
        }

        protected void ddlFiscalYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetBFTransactions();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GetBFTransactions();
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = " ";
            GetBFTransactions();
        }

        private decimal _giftTotal = 0m;
        protected void gvBFGiftTrans_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                _giftTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TransAmt"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Totals:";
                e.Row.Cells[4].Text = _giftTotal.ToString("c2");
            }
        }

        private decimal _incomeTotal = 0m;
        protected void gvBFIncome_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                _incomeTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TransAmt"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Income Total:";
                e.Row.Cells[4].Text = _incomeTotal.ToString("c2");
            }
        }
    }
}
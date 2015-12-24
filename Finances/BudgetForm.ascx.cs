using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.Finances
{
    public partial class BudgetForm : System.Web.UI.UserControl
    {
        public event EventHandler BudgetUpdated;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (MyUser.IsFinanceAdmin())
            {
                btnCopyFrom.Enabled = true;
                btnDivideEqual.Enabled = true;
                btnReset.Enabled = true;
                btnSave.Enabled = true;
            }
            else
            {
                btnCopyFrom.Enabled = false;
                btnDivideEqual.Enabled = false;
                btnReset.Enabled = false;
                btnSave.Enabled = false;
            }
        }

        public void LoadBudget(int fiscalYear, int acctId)
        {
            dsBudgetEntry.SelectParameters[0].DefaultValue = fiscalYear.ToString();
            dsBudgetEntry.SelectParameters[1].DefaultValue = acctId.ToString();
            dsBudgetEntry.SelectParameters[2].DefaultValue = SessionMgr.User.UserID.ToString();

            DataView vw = (DataView)dsBudgetEntry.Select(DataSourceSelectArguments.Empty);
            txtBudgetAmt.Text = vw[0]["BudgetAmt"].ToString();
            txtM1Amt.Text = vw[0]["M1Amt"].ToString();
            txtM2Amt.Text = vw[0]["M2Amt"].ToString();
            txtM3Amt.Text = vw[0]["M3Amt"].ToString();
            txtM4Amt.Text = vw[0]["M4Amt"].ToString();
            txtM5Amt.Text = vw[0]["M5Amt"].ToString();
            txtM6Amt.Text = vw[0]["M6Amt"].ToString();
            txtM7Amt.Text = vw[0]["M7Amt"].ToString();
            txtM8Amt.Text = vw[0]["M8Amt"].ToString();
            txtM9Amt.Text = vw[0]["M9Amt"].ToString();
            txtM10Amt.Text = vw[0]["M10Amt"].ToString();
            txtM11Amt.Text = vw[0]["M11Amt"].ToString();
            txtM12Amt.Text = vw[0]["M12Amt"].ToString();
            varAcctId.Value = vw[0]["AcctId"].ToString();
            varFiscalYear.Value = vw[0]["FiscalYear"].ToString();
            varBudgetItemId.Value = vw[0]["BudgetItemId"].ToString();
            labTitle.Text = vw[0]["AcctDesc"].ToString() + " (Budget)";
        }

        protected void btnCopyFrom_Click(object sender, EventArgs e)
        {
            int startIdx = GetFirstNonZeroIdx();
            if (startIdx == 0 || startIdx == 12) return;

            decimal srcAmt = GetMonthValue(startIdx);
            SetMonthValues(startIdx + 1, srcAmt);
            SetTotal();

        }

        protected void btnDivideEqual_Click(object sender, EventArgs e)
        {
            int startIdx = GetFirstNonZeroIdx();
            if (startIdx == 0 || startIdx == 12) return;

            int div = 13 - startIdx;
            decimal amt = GetMonthValue(startIdx);
            decimal divamt = amt / div;

            SetMonthValues(startIdx, divamt);
            if (div == 12)
            {
                SetTotal(amt);
            }
            else
            {
                SetTotal();
            }
            
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            for (int i = 1; i < 13; i++)
            {
                SetMonthValue(i, 0);
            }
            txtBudgetAmt.Text = "0";
        }

        private void SetMonthValues(int startIdx, decimal amt)
        {
            for (int i = startIdx; i < 13; i++)
            {
                SetMonthValue(i, amt);
            }
        }
        private void SetTotal()
        {
            decimal tot = 0;
            for (int i = 1; i < 13; i++)
            {
                tot += GetMonthValue(i);
            }
            txtBudgetAmt.Text = tot.ToString("F2");
        }

        private void SetTotal(decimal totamt)
        {
            decimal tot = 0;
            for (int i = 1; i < 13; i++)
            {
                tot += GetMonthValue(i);
            }
            if (tot != totamt)
            {
                SetMonthValue(12, GetMonthValue(12) + (totamt - tot));
            }
            txtBudgetAmt.Text = totamt.ToString("F2");
        }

        private int GetFirstNonZeroIdx()
        {
            int startIdx = 0;
            for (int i = 12; i > 0; i--)
            {
                if (GetMonthValue(i) > 0)
                {
                    startIdx = i;
                    break;
                }
            }
            return startIdx;
        }

        private decimal GetMonthValue(int idx)
        {
            TextBox tb = this.FindControl("txtM" + idx.ToString() + "Amt") as TextBox;
            if (tb == null) return 0;
            return Convert.ToDecimal(tb.Text);
        }
        private void SetMonthValue(int idx, decimal amt)
        {
            TextBox tb = this.FindControl("txtM" + idx.ToString() + "Amt") as TextBox;
            if (tb == null) return;
            tb.Text = amt.ToString("F2");
        }

        private void CheckTotal()
        {
            decimal mtot = 0;
            for (int i = 1; i < 13; i++)
            {
                mtot += GetMonthValue(i);
            }
            decimal totamt = Convert.ToDecimal(txtBudgetAmt.Text);
            if (mtot != totamt)
            {
                if (totamt > 0 && mtot == 0)
                {
                    decimal divamt = totamt / 12;
                    SetMonthValues(1, divamt);
                    SetTotal(totamt);
                }
                else if (totamt > 0 && mtot != 0)
                {
                    SetTotal(totamt);
                }
                else if (totamt == 0 && mtot > 0)
                {
                    SetTotal();
                }
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            CheckTotal();

            dsBudgetEntry.UpdateParameters["BudgetItemId"].DefaultValue = varBudgetItemId.Value;
            dsBudgetEntry.UpdateParameters["FiscalYear"].DefaultValue = varFiscalYear.Value;
            dsBudgetEntry.UpdateParameters["AcctId"].DefaultValue = varAcctId.Value;
            dsBudgetEntry.UpdateParameters["BudgetAmt"].DefaultValue = txtBudgetAmt.Text;
            dsBudgetEntry.UpdateParameters["M1Amt"].DefaultValue = txtM1Amt.Text;
            dsBudgetEntry.UpdateParameters["M2Amt"].DefaultValue = txtM2Amt.Text;
            dsBudgetEntry.UpdateParameters["M3Amt"].DefaultValue = txtM3Amt.Text;
            dsBudgetEntry.UpdateParameters["M4Amt"].DefaultValue = txtM4Amt.Text;
            dsBudgetEntry.UpdateParameters["M5Amt"].DefaultValue = txtM5Amt.Text;
            dsBudgetEntry.UpdateParameters["M6Amt"].DefaultValue = txtM6Amt.Text;
            dsBudgetEntry.UpdateParameters["M7Amt"].DefaultValue = txtM7Amt.Text;
            dsBudgetEntry.UpdateParameters["M8Amt"].DefaultValue = txtM8Amt.Text;
            dsBudgetEntry.UpdateParameters["M9Amt"].DefaultValue = txtM9Amt.Text;
            dsBudgetEntry.UpdateParameters["M10Amt"].DefaultValue = txtM10Amt.Text;
            dsBudgetEntry.UpdateParameters["M11Amt"].DefaultValue = txtM11Amt.Text;
            dsBudgetEntry.UpdateParameters["M12Amt"].DefaultValue = txtM12Amt.Text;
            dsBudgetEntry.UpdateParameters["MB"].DefaultValue = SessionMgr.User.UserID.ToString();
            dsBudgetEntry.UpdateParameters["MDT"].DefaultValue = DateTime.Now.ToString();

            dsBudgetEntry.Update();
            LoadBudget(Convert.ToInt32(varFiscalYear.Value), Convert.ToInt32(varAcctId.Value));

            if (BudgetUpdated != null)
            {
                BudgetUpdated(this, EventArgs.Empty);
            }
        }


    }
}
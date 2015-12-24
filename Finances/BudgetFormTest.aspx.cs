using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.Finances
{
    public partial class BudgetFormTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BudgetForm.LoadBudget(20142015, 60);
            }
        }

        protected void BudgetForm_BudgetUpdated(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToString();
        }
    }
}
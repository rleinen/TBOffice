using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.Employee
{
    public partial class Timesheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private decimal _workTotal = 0m;
        private decimal _vacTotal = 0m;
        private decimal _sickTotal = 0m;
        private decimal _holTotal = 0m;
        private decimal _weekTotal = 0m;

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                _workTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "WorkHours"));
                _vacTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "VacationHours"));
                _sickTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "SickHours"));
                _holTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "HolidayHours"));
                _weekTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalHours"));

            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Totals:";
                e.Row.Cells[4].Text = _workTotal.ToString("f1");
                e.Row.Cells[5].Text = _vacTotal.ToString("f1");
                e.Row.Cells[6].Text = _sickTotal.ToString("f1");
                e.Row.Cells[7].Text = _holTotal.ToString("f1");
                e.Row.Cells[8].Text = _weekTotal.ToString("f1");
            }

        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            dvEEBalance.DataBind();
        }
    }
}
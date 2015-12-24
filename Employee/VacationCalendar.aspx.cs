using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace TBOffice.Employee
{
    public partial class VacationCalendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetDDL(DateTime.Now.Month, DateTime.Now.Year);
            }
            SetDates();

        }

        private void SetDDL(int month, int year)
        {
            ddlMonth.SelectedValue = month.ToString();
            ddlYear.SelectedValue = year.ToString();

        }

        private void SetDates()
        {
            int curMonth = Convert.ToInt32(ddlMonth.SelectedValue);
            int curYear = Convert.ToInt32(ddlYear.SelectedValue);

            labTitle.Text = ddlMonth.SelectedItem.Text + " " + ddlYear.SelectedItem.Text;

            DateTime begMonthDate = new DateTime(curYear, curMonth, 1);
            int begMonthDay = (int)begMonthDate.DayOfWeek;
            DateTime endMonthDate = begMonthDate.AddMonths(1).AddDays(-1);
            DateTime begDate = begMonthDate.AddDays(1 - begMonthDay);
            DateTime endDate = begDate.AddDays(42);

            DateTime idxDate;
            string dateCellId = "";
            string dateLabelId = "";
            string dateListId = "";

            for (int i = 1; i <= 42; i++)
            {
                idxDate = begDate.AddDays(i-2);
                dateCellId = "cell_" + i.ToString();
                dateLabelId = "day_" + i.ToString();
                dateListId = "list_" + i.ToString();

                HtmlTableCell cell = (HtmlTableCell)this.FindControlRecursive(dateCellId);
                HtmlGenericControl label = (HtmlGenericControl)this.FindControlRecursive(dateLabelId);
                ListView list = (ListView)this.FindControlRecursive(dateListId);

                label.InnerHtml = idxDate.Day.ToString();

                if (idxDate.Month != curMonth)
                {
                    cell.Attributes["class"] = "cellShade";
                }

                dsTOCalEntry.SelectParameters["TODate"].DefaultValue = idxDate.ToShortDateString();
                list.DataSource = dsTOCalEntry;
                list.DataBind();

            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            int month = Convert.ToInt32(ddlMonth.SelectedValue);
            int year = Convert.ToInt32(ddlMonth.SelectedValue);
            month -= 1;

            if (month == 0)
            {
                month = 12;
                year -= 1;
            }
            SetDDL(month, year);
            SetDates();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int month = Convert.ToInt32(ddlMonth.SelectedValue);
            int year = Convert.ToInt32(ddlMonth.SelectedValue);
            month += 1;

            if (month == 13)
            {
                month = 11;
                year += 1;
            }
            SetDDL(month, year);
            SetDates();
        }

    }

    public static class ControlExtensions
    {
        /// <summary>
        /// recursively finds a child control of the specified parent.
        /// </summary>
        /// <param name="control"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Control FindControlRecursive(this Control control, string id)
        {
            if (control == null) return null;
            //try to find the control at the current level
            Control ctrl = control.FindControl(id);

            if (ctrl == null)
            {
                //search the children
                foreach (Control child in control.Controls)
                {
                    ctrl = FindControlRecursive(child, id);

                    if (ctrl != null) break;
                }
            }
            return ctrl;
        }
    }

}
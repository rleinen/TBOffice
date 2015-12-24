using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.Employee
{
    public partial class Timesheet3 : System.Web.UI.Page
    {
        public int CurWeekId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            dsEEList2.SelectParameters["UserId"].DefaultValue = SessionMgr.User.UserID.ToString();

            using (var db = new TBOffice.Model.TBBFEntities())
            {
                var w = db.Weeks.Where(wk => wk.BegDate <= DateTime.Now && wk.EndDate >= DateTime.Now).SingleOrDefault();
                if (w != null)
                {
                    CurWeekId = w.WeekID;
                }
            }



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

                if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "WorkHours")) != 0)
                {
                    e.Row.Cells[3].Font.Bold = true;
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Maroon;
                }
                if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "VacationHours")) != 0)
                {
                    e.Row.Cells[4].Font.Bold = true;
                    e.Row.Cells[4].ForeColor = System.Drawing.Color.Maroon;
                }

                if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "SickHours")) != 0)
                {
                    e.Row.Cells[5].Font.Bold = true;
                    e.Row.Cells[5].ForeColor = System.Drawing.Color.Maroon;
                }

                if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "HolidayHours")) != 0)
                {
                    e.Row.Cells[6].Font.Bold = true;
                    e.Row.Cells[6].ForeColor = System.Drawing.Color.Maroon;
                }


            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Totals:";
                e.Row.Cells[3].Text = _workTotal.ToString("f1");
                e.Row.Cells[4].Text = _vacTotal.ToString("f1");
                e.Row.Cells[5].Text = _sickTotal.ToString("f1");
                e.Row.Cells[6].Text = _holTotal.ToString("f1");
                e.Row.Cells[7].Text = _weekTotal.ToString("f1");
            }

        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            dvEEBalance.DataBind();
        }

        protected void ddlWeeks_DataBound(object sender, EventArgs e)
        {
            ddlWeeks.SelectedValue = CurWeekId.ToString();
        }

        protected void ddlEE_DataBound(object sender, EventArgs e)
        {
            string uid = SessionMgr.User.UserID.ToString();
            if (ddlEE.Items.FindByValue(uid) != null)
            {
                ddlEE.Items.FindByValue(uid).Selected = true;
            }
        }
    }
}
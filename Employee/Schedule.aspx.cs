using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.Employee
{
    public partial class Schedule : System.Web.UI.Page
    {
        public int CurWeekId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new TBOffice.Model.TBBFEntities())
            {
                var w = db.Weeks.Where(wk => wk.BegDate <= DateTime.Now && wk.EndDate >= DateTime.Now).SingleOrDefault();
                if (w != null)
                {
                    CurWeekId = w.WeekID;
                }
            }
        }

        protected void ddlWeeks_DataBound(object sender, EventArgs e)
        {
            ddlWeeks.SelectedValue = CurWeekId.ToString();
        }

    }
}
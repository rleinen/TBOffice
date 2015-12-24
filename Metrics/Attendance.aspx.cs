using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.Metrics
{
    public partial class Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            gridAttendance.SelectedIndex = -1;
            dvAttendance.ChangeMode(DetailsViewMode.Insert);
            dvAttendance.DataBind();
        }

        protected void dvOffering_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            //gridOfferings.DataBind();
            //dvOffering.ChangeMode(DetailsViewMode.Insert);
            //dvOffering.DataBind();
        }

        protected void dvAttendance_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            int head = Convert.ToInt32(dsAttendanceEntry.InsertParameters["HeadCount"].DefaultValue);
            int card = Convert.ToInt32(dsAttendanceEntry.InsertParameters["CardCount"].DefaultValue);
            if (head == 0)
            {
                dsAttendanceEntry.InsertParameters["CardPct"].DefaultValue = "0";
            }
            else
            {
                Decimal pct = card / head;
                dsAttendanceEntry.InsertParameters["CardPct"].DefaultValue = pct.ToString();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice.Metrics
{
    public partial class Offerings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            gridOfferings.SelectedIndex = -1;
            dvOffering.ChangeMode(DetailsViewMode.Insert);
            dvOffering.DataBind();
        }

        protected void dvOffering_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            gridOfferings.DataBind();
            dvOffering.ChangeMode(DetailsViewMode.Insert);
            dvOffering.DataBind();
        }
    }
}
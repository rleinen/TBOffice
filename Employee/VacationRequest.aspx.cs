using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.Employee
{
    public partial class VacationRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dsEEList.SelectParameters["UserId"].DefaultValue = MyUser.User.UserID.ToString();
                ddlEE.DataBind();
            }
        }

        protected void btnRefresh_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect(Request.Url.ToString());
        }

        protected void gridTORequestApprovals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int TORequestId = Convert.ToInt32(gridTORequestApprovals.DataKeys[index].Value);
            dsTORequestApprovals.UpdateParameters["UserID"].DefaultValue = MyUser.User.UserID.ToString();
            dsTORequestApprovals.UpdateParameters["TORequestID"].DefaultValue = TORequestId.ToString();
            dsTORequestApprovals.Update();

            gridTORequestApprovals.DataBind();
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            if (txtDateFrom.Text == "") return;

            DateTime dtFrom = Convert.ToDateTime(txtDateFrom.Text);

            dsRequestTO.InsertParameters["TOUserID"].DefaultValue = ddlEE.SelectedValue.ToString();

            if (txtDateTo.Text != "")
            {
                DateTime dtTo = Convert.ToDateTime(txtDateTo.Text);
                while (dtFrom <= dtTo)
                {
                    dsRequestTO.InsertParameters["TODate"].DefaultValue = dtFrom.ToShortDateString();
                    dsRequestTO.Insert();
                    dtFrom = dtFrom.AddDays(1);
                }
            }
            else
            {
                dsRequestTO.InsertParameters["TODate"].DefaultValue = dtFrom.ToShortDateString();
                dsRequestTO.Insert();
            }

            gridTOUserRequests.DataBind();
            gridTORequestApprovals.DataBind();

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtDateFrom.Text = "";
            txtDateTo.Text = "";
        }

        protected void dsTOFutureRequestsByUser_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            gridTORequestApprovals.DataBind();
        }

        protected void btnViewCal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/employee/vacationcalendar.aspx");
        }

    }
}
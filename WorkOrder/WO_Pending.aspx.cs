using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.WorkOrder
{
    public partial class WO_Pending : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                this.Title = "Pending WO List";
                if (MyUser.IsFacilityAdmin() == false)
                {
                    cmdApprove.Enabled = false;
                    cmdDelete.Enabled = false;
                }
                else if (MyUser.IsSuperAdmin() == false)
                {
                    cmdDelete.Enabled = false;
                }
            }
            
        }

        protected void gridWO_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = e.Row.Cells[1].Controls[0] as LinkButton;
                lb.Text = DataBinder.Eval(e.Row.DataItem, "ShortDesc").ToString();
            }

        }

        protected void gridWO_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url = "~/workorder/workorder.aspx?woid=" + gridWO.SelectedDataKey.Value.ToString();
            ResponseHelper.Redirect(url, "_blank","");
        }

        protected void cmdRefresh_Click(object sender, EventArgs e)
        {
            dsWO.Select(DataSourceSelectArguments.Empty);
            gridWO.DataBind();
        }

        protected void cmdApprove_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gridWO.Rows)
            {
                if ((row.Cells[0].FindControl("ddlSelect") as CheckBox).Checked)
                {
                    dsApprove.UpdateParameters["WorkOrderId"].DefaultValue = row.Cells[2].Text;
                    dsApprove.UpdateParameters["ApprovalUserId"].DefaultValue = ddlActionUser.SelectedValue;
                    dsApprove.UpdateParameters["MB"].DefaultValue = SessionMgr.User.UserID.ToString();
                    dsApprove.Update();
                }
            }
            dsWO.Select(DataSourceSelectArguments.Empty);
            gridWO.DataBind();
        }

        //protected void cmdAssign_Click(object sender, EventArgs e)
        //{
        //    foreach (GridViewRow row in gridWO.Rows)
        //    {
        //        if ((row.Cells[0].FindControl("ddlSelect") as CheckBox).Checked)
        //        {
        //            dsAssign.UpdateParameters["WorkOrderId"].DefaultValue = row.Cells[2].Text;
        //            dsAssign.UpdateParameters["AssignedUserId"].DefaultValue = ddlActionUser.SelectedValue;
        //            dsAssign.UpdateParameters["MB"].DefaultValue = SessionMgr.User.UserID.ToString();
        //            dsAssign.Update();
        //        }
        //    }
        //    dsWO.Select(DataSourceSelectArguments.Empty);
        //    gridWO.DataBind();
        //}

        //protected void cmdComplete_Click(object sender, EventArgs e)
        //{
        //    foreach (GridViewRow row in gridWO.Rows)
        //    {
        //        if ((row.Cells[0].FindControl("ddlSelect") as CheckBox).Checked)
        //        {
        //            dsComplete.UpdateParameters["WorkOrderId"].DefaultValue = row.Cells[2].Text;
        //            dsComplete.UpdateParameters["CompletedUserId"].DefaultValue = ddlActionUser.SelectedValue;
        //            dsComplete.UpdateParameters["MB"].DefaultValue = SessionMgr.User.UserID.ToString();
        //            dsComplete.Update();
        //        }
        //    }
        //    dsWO.Select(DataSourceSelectArguments.Empty);
        //    gridWO.DataBind();
        //}

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gridWO.Rows)
            {
                if ((row.Cells[0].FindControl("ddlSelect") as CheckBox).Checked)
                {
                    dsDelete.DeleteParameters["WorkOrderId"].DefaultValue = row.Cells[2].Text;
                    dsDelete.Delete();
                }
            }
            dsWO.Select(DataSourceSelectArguments.Empty);
            gridWO.DataBind();
        }

        protected void ddlActionUser_DataBound(object sender, EventArgs e)
        {
            string uid = SessionMgr.User.UserID.ToString();
            if (ddlActionUser.Items.FindByValue(uid) != null)
            {
                ddlActionUser.Items.FindByValue(uid).Selected = true;
            }

        }
    }
}
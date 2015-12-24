using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.WorkOrder
{
    public partial class WorkOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CurrentUserId"] = SessionMgr.User.UserID.ToString();
            if (!this.IsPostBack)
            {
                if (Request.QueryString["woid"].ToString().ToUpper() == "0")
                {
                    this.Title = "Work Order (NEW)";
                    dvWO.ChangeMode(DetailsViewMode.Insert);
                    this.tableNote.Visible = false;
                }
                else
                {
                    this.Title = "Work Order # " + Request.QueryString["woid"].ToString();
                    dvWO.ChangeMode(DetailsViewMode.Edit);
                }
            }
            else
            {
                this.Title = "Work Order # " + Request.QueryString["woid"].ToString();
            }
            
        }

        protected void dsWO_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception == null)
            {
                string url = "~/workorder/workorder.aspx?woid=" + e.Command.Parameters["@WorkOrderId"].Value.ToString();
                Response.Redirect(url);
            }
        }

        protected void dvWO_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("~/default.aspx");
            }
            else if (e.CommandName.Equals("Update", StringComparison.OrdinalIgnoreCase))
            {
                if (txtNewNote.Text.Trim() != "")
                {
                    dsWONotes.InsertParameters["WorkOrderId"].DefaultValue = Request.QueryString["woid"].ToString();
                    dsWONotes.InsertParameters["Note"].DefaultValue = txtNewNote.Text;
                    dsWONotes.InsertParameters["CB"].DefaultValue = SessionMgr.User.UserID.ToString();
                    dsWONotes.Insert();

                    txtNewNote.Text = "";
                    dsWONotes.Select(DataSourceSelectArguments.Empty);
                    repNotes.DataBind();
                }
            }
            
        }

        protected void dsWO_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            //this.dsWO.UpdateParameters["@MB"].DefaultValue = SessionMgr.User.UserID.ToString();
        }

        protected void btnSaveNote_Click(object sender, EventArgs e)
        {
            dsWONotes.InsertParameters["WorkOrderId"].DefaultValue = Request.QueryString["woid"].ToString();
            dsWONotes.InsertParameters["Note"].DefaultValue = txtNewNote.Text;
            dsWONotes.InsertParameters["CB"].DefaultValue = SessionMgr.User.UserID.ToString();
            dsWONotes.Insert();

            dsWO.Update();

            txtNewNote.Text = "";
            dsWONotes.Select(DataSourceSelectArguments.Empty);
            repNotes.DataBind();

            dvWO.ChangeMode(DetailsViewMode.ReadOnly);
        }

    }
}
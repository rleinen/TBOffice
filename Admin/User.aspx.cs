using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Objects;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;

namespace TBOffice.Admin
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsertRole_Click(object sender, EventArgs e)
        {
            string roleid = ((DropDownList)gvUserRoles.FooterRow.FindControl("ddlRole")).SelectedValue;
            if (roleid == "0") return;
            dsUserRoles.InsertParameters["RoleId"].DefaultValue = roleid;
            dsUserRoles.InsertParameters["UserId"].DefaultValue = ddlEE.SelectedValue;
            dsUserRoles.Insert();

            dsUserRoles.Select(DataSourceSelectArguments.Empty);
            gvUserRoles.DataBind();
        }

        protected void btnInsertRole_Click2(object sender, EventArgs e)
        {
            string roleid = ((DropDownList)((GridViewRow)gvUserRoles.Controls[0].Controls[0]).Cells[0].FindControl("ddlRole")).SelectedValue;
            if (roleid == "0") return;
            dsUserRoles.InsertParameters["RoleId"].DefaultValue = roleid;
            dsUserRoles.InsertParameters["UserId"].DefaultValue = ddlEE.SelectedValue;
            dsUserRoles.Insert();

            dsUserRoles.Select(DataSourceSelectArguments.Empty);
            gvUserRoles.DataBind();
        }

        protected void btnAddVacAllotment_Click(object sender, EventArgs e)
        {
            string allot = ((TextBox)gvVacationAllotment.FooterRow.FindControl("txtVacAllotIns")).Text;
            string allotDT = ((TextBox)gvVacationAllotment.FooterRow.FindControl("txtVacAllotDateIns")).Text;

            decimal vacHours;
            if (Decimal.TryParse(allot, out vacHours) == false) return;

            DateTime VacDT;
            if (DateTime.TryParse(allotDT, out VacDT) == false) return;

            dsVacation.InsertParameters["TSDate"].DefaultValue = VacDT.ToShortDateString();
            dsVacation.InsertParameters["VacationHours"].DefaultValue = vacHours.ToString();
            dsVacation.Insert();

            dsVacation.Select(DataSourceSelectArguments.Empty);
            gvVacationAllotment.DataBind();

        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            int userid = 0;

            string cs = ConfigurationManager.ConnectionStrings["TBBF"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ins_secusers", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter pUserId = new SqlParameter("@UserId", SqlDbType.Int);
                pUserId.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(pUserId);
                cmd.ExecuteNonQuery();

                userid = int.Parse(pUserId.Value.ToString());
            }

            dsEEList.Select(DataSourceSelectArguments.Empty);
            ddlEE.DataBind();
            ddlEE.SelectedValue = userid.ToString();

            dsUser.Select(DataSourceSelectArguments.Empty);
            dvUser.DataBind();
        }
    }
}
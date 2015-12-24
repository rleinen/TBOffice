using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TBOffice
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

                int userid = int.Parse(pUserId.Value.ToString());
                Response.Write("New UserId is: " + userid.ToString());

            }

        }
    }
}
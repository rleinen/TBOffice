using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TBOffice.Logic;
using TBOffice.Model;

namespace TBOffice.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Focus();
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (MyUser.Login(txtUserName.Text, txtPassword.Text))
            {
                //FormsAuthentication.SetAuthCookie(txtUserName.Text, true);
                Response.Redirect("~/default.aspx");
            }
            else
            {
                txtFailureText.Text = "Login failure.";
            }
        }

    }
}
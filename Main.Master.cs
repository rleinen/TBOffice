using APNSoft.WebControls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using TBOffice.Logic;
using TBOffice.Model;

namespace TBOffice
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (MyUser.User == null)
            {
                hidUserID.Value = "0";
            }
            else
            {
                hidUserID.Value = MyUser.User.UserID.ToString();
            }
            //Set empty DataSource from XmlDocument
            //APNMenu.DataSource = new XmlDocument();
            //APNMenu.DataBind();
            //LoadMenuItems();
            /*
            //Get elements collection
            MenuElementCollection _Elements = APNMenu.Elements;

            //Add root elements
            _Elements.AddRootItem("Home");
            MenuElement _AboutUs = _Elements.AddRootItem("About Us");
            _Elements.AddRootSeparator();
            _Elements.AddRootItem("Products");
            _Elements.AddRootItem("Solutions");

            //Add child nodes for "About Us"
            _AboutUs.AddChildItem("Awards");
            _AboutUs.AddChildItem("Certificates");
            MenuElement _ContactUs = _AboutUs.AddChildItem("Contact Us");
            _AboutUs.AddChildSeparator();
            _AboutUs.AddChildItem("Financial Highlights");
            _AboutUs.AddChildItem("History");

            //Add child nodes for "Contact Us"
            _ContactUs.AddChildItem("Call Us");
            _ContactUs.AddChildItem("E-mail Us");
            */
           
        }

        public void LoadMenuItems()
        {
            //using (var db = new TBOffice.Model.TBBFEntities())
            //{
            //    MenuElementCollection MainMenu = APNMenu.Elements;
            //    MenuElement TopMenu = null;

            //    var qry = db.get_MenusByUser(MyUser.User != null ? MyUser.User.UserID : 0);
            //    foreach (fxMenu m in qry)
            //    {
            //        if (m.ParentMenuID == null)
            //        {
            //            TopMenu = MainMenu.AddRootItem(m.ShortDesc);
            //        }
            //        else
            //        {
            //            MenuElement el = TopMenu.AddChildItem(m.ShortDesc);
            //            el.href = m.NavigateUrl;
            //        }

            //    }
            //}
            
        }

        protected void Unnamed_LoggedOut(object sender, EventArgs e)
        {
            MyUser.Logout();
        }

    }
}
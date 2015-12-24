using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.Security;
using TBOffice.Model;

namespace TBOffice.Logic
{
    public class SessionContext
    {
        protected static HttpSessionState Session
        {
            get{
                return HttpContext.Current != null ? HttpContext.Current.Session : null;
            }
            
        }
    }

    public class SessionMgr : SessionContext
    {
        private const string _CurrentUserKey = "CurrentUserKey";
        public static TBUser User
        {
            get
            {
                TBUser u = (TBUser)Session[_CurrentUserKey];
                if (u == null)
                {
                    if (MyUser.ReLogin())
                    {
                        return (TBUser)Session[_CurrentUserKey];
                    }
                    return null;
                }
                return u;
            }
            set
            {
                Session[_CurrentUserKey] = value;
            }
        }

    }

    public class MyUser
    {
        public static void Logout()
        {
            SessionMgr.User = null;
            FormsAuthentication.SignOut();
        }

        public static bool Login(string userName, string password)
        {
            TBUser u; 
            using (var db = new TBOffice.Model.TBBFEntities())
            {
                u = db.TBUsers.Include("Roles")
                              .Include("EECategory")
                              .Include("EEType")
                              .Where(usr => usr.UserName.ToLower() == userName.ToLower() && usr.Password == password).SingleOrDefault();
            }

            if (u != null)
            {
                SessionMgr.User = u;
                FormsAuthentication.SetAuthCookie(u.UserName, true);
                return true;
            }

            return false;

        }

        public static bool ReLogin()
        {
            string userName = HttpContext.Current.User.Identity.Name;
            TBUser u;
            using (var db = new TBOffice.Model.TBBFEntities())
            {
                u = db.TBUsers.Include("Roles")
                              .Include("EECategory")
                              .Include("EEType")
                              .Where(usr => usr.UserName.ToLower() == userName.ToLower()).SingleOrDefault();
            }

            if (u != null)
            {
                SessionMgr.User = u;
                FormsAuthentication.SetAuthCookie(u.UserName, true);
                return true;
            }

            return false;

        }

        public static bool IsInRole(string roleName)
        {
            foreach(Role r in SessionMgr.User.Roles){
                if (r.RoleName.ToLower() == roleName.ToLower()) return true;
            }
            return false;
        }

        public static bool IsSuperAdmin()
        {
            if (MyUser.IsInRole("super admin")) return true;
            return false;
        }

        public static bool IsFinanceAdmin()
        {
            if (MyUser.IsInRole("super admin")) return true;
            else if (MyUser.IsInRole("finance admin")) return true;
            return false;
        }

        public static bool IsHRAdmin()
        {
            if (MyUser.IsInRole("super admin")) return true;
            else if (MyUser.IsInRole("hr admin")) return true;
            return false;
        }

        public static bool IsPastorLevel()
        {
            if (MyUser.IsInRole("super admin")) return true;
            else if (MyUser.IsInRole("pastor/elder")) return true;
            return false;
        }

        public static bool IsFacilityAdmin()
        {
            if (MyUser.IsInRole("facility admin")) return true;
            return false;
        }
        public static bool IsFacilityTeam()
        {
            if (MyUser.IsInRole("facility team")) return true;
            return false;
        }

        public static TBUser User
        {
            get { return SessionMgr.User; }
        }

    }


}
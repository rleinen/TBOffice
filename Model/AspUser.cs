//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TBOffice.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class AspUser
    {
        public AspUser()
        {
            this.TBUsers = new HashSet<TBUser>();
        }
    
        public System.Guid ApplicationId { get; set; }
        public System.Guid UserId { get; set; }
        public string UserName { get; set; }
        public bool IsAnonymous { get; set; }
        public System.DateTime LastActivityDate { get; set; }
    
        public virtual AspApplication AspApplication { get; set; }
        public virtual AspMembership AspMembership { get; set; }
        public virtual AspProfile AspProfile { get; set; }
        public virtual ICollection<TBUser> TBUsers { get; set; }
    }
}

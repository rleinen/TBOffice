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
    
    public partial class TBUser
    {
        public TBUser()
        {
            this.EECompensationHistory = new HashSet<EECompensation>();
            this.TORequests = new HashSet<TORequest>();
            this.TORequestsApprovedByUser = new HashSet<TORequest>();
            this.TSEntries = new HashSet<TSEntry>();
            this.TSWeeks = new HashSet<TSWeek>();
            this.Roles = new HashSet<Role>();
        }
    
        public int UserID { get; set; }
        public Nullable<System.Guid> AspUserID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName { get; set; }
        public string Email { get; set; }
        public bool IsEmployee { get; set; }
        public Nullable<bool> IsFullTime { get; set; }
        public Nullable<bool> IsExempt { get; set; }
        public Nullable<int> EETypeID { get; set; }
        public Nullable<int> EECategoryID { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> TermDate { get; set; }
        public byte MinHours { get; set; }
        public byte MaxHours { get; set; }
        public byte[] RowVersion { get; set; }
        public Nullable<System.DateTime> FTStartDate { get; set; }
        public Nullable<short> AnnualVacHours { get; set; }
        public Nullable<short> CapVacHours { get; set; }
        public Nullable<decimal> PerPPVacHours { get; set; }
        public Nullable<System.DateTime> NextTierDate { get; set; }
        public Nullable<int> LastPayPeriodId { get; set; }
    
        public virtual EECategory EECategory { get; set; }
        public virtual EEType EEType { get; set; }
        public virtual AspUser AspUser { get; set; }
        public virtual ICollection<EECompensation> EECompensationHistory { get; set; }
        public virtual ICollection<TORequest> TORequests { get; set; }
        public virtual ICollection<TORequest> TORequestsApprovedByUser { get; set; }
        public virtual ICollection<TSEntry> TSEntries { get; set; }
        public virtual ICollection<TSWeek> TSWeeks { get; set; }
        public virtual AspMembership AspMembership { get; set; }
        public virtual ICollection<Role> Roles { get; set; }
    }
}

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
    
    public partial class ins_secUsers_Result
    {
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
    }
}
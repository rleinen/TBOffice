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
    
    public partial class Offering
    {
        public int OfferingID { get; set; }
        public Nullable<int> SundayID { get; set; }
        public Nullable<int> ServiceID { get; set; }
        public Nullable<decimal> GeneralAmt { get; set; }
        public Nullable<decimal> BenevolentAmt { get; set; }
        public Nullable<decimal> MissionsAmt { get; set; }
    
        public virtual Service Service { get; set; }
        public virtual Sunday Sunday { get; set; }
    }
}

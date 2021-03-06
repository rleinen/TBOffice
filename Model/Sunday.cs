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
    
    public partial class Sunday
    {
        public Sunday()
        {
            this.Offerings = new HashSet<Offering>();
            this.AttendanceCounts = new HashSet<AttendanceCount>();
        }
    
        public int SundayID { get; set; }
        public Nullable<System.DateTime> SunDate { get; set; }
        public Nullable<short> SunMonth { get; set; }
        public Nullable<short> SunYear { get; set; }
        public Nullable<int> FiscalYear { get; set; }
        public Nullable<short> WeekOfYear { get; set; }
        public Nullable<short> WeekOfFiscalYear { get; set; }
        public Nullable<short> WeekOfMonth { get; set; }
    
        public virtual ICollection<Offering> Offerings { get; set; }
        public virtual ICollection<AttendanceCount> AttendanceCounts { get; set; }
    }
}

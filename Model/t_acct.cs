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
    
    public partial class t_acct
    {
        public t_acct()
        {
            this.t_acct_budget = new HashSet<t_acct_budget>();
            this.t_acct_beg_bal = new HashSet<t_acct_beg_bal>();
            this.t_acct1 = new HashSet<t_acct>();
            this.t_acct11 = new HashSet<t_acct>();
            this.t_acct_trans = new HashSet<t_acct_trans>();
            this.t_acct_trans1 = new HashSet<t_acct_trans>();
        }
    
        public int AcctId { get; set; }
        public string ShortDesc { get; set; }
        public byte AcctTypeId { get; set; }
        public Nullable<byte> FundId { get; set; }
        public Nullable<int> DeptAcctId { get; set; }
        public Nullable<int> SubDeptAcctId { get; set; }
        public Nullable<decimal> BegBalAmt { get; set; }
        public Nullable<int> CB { get; set; }
        public Nullable<System.DateTime> CDT { get; set; }
        public Nullable<int> MB { get; set; }
        public Nullable<System.DateTime> MDT { get; set; }
    
        public virtual ICollection<t_acct_budget> t_acct_budget { get; set; }
        public virtual ICollection<t_acct_beg_bal> t_acct_beg_bal { get; set; }
        public virtual ICollection<t_acct> t_acct1 { get; set; }
        public virtual t_acct t_acct2 { get; set; }
        public virtual t_acct_fund t_acct_fund { get; set; }
        public virtual t_acct_type t_acct_type { get; set; }
        public virtual ICollection<t_acct> t_acct11 { get; set; }
        public virtual t_acct t_acct3 { get; set; }
        public virtual ICollection<t_acct_trans> t_acct_trans { get; set; }
        public virtual ICollection<t_acct_trans> t_acct_trans1 { get; set; }
    }
}

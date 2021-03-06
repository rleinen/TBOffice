﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class TBBFEntities : DbContext
    {
        public TBBFEntities()
            : base("name=TBBFEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<AspApplication> AspApplications { get; set; }
        public DbSet<AspMembership> AspMemberships { get; set; }
        public DbSet<AspProfile> AspProfiles { get; set; }
        public DbSet<AspRole> AspRoles { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<TBUser> TBUsers { get; set; }
        public DbSet<Congregation> Congregations { get; set; }
        public DbSet<DateList> DateLists { get; set; }
        public DbSet<EECategory> EECategories { get; set; }
        public DbSet<EECompensation> EECompensations { get; set; }
        public DbSet<EEType> EETypes { get; set; }
        public DbSet<Offering> Offerings { get; set; }
        public DbSet<AttendanceCount> AttendanceCounts { get; set; }
        public DbSet<Service> Services { get; set; }
        public DbSet<Sunday> Sundays { get; set; }
        public DbSet<TORequest> TORequests { get; set; }
        public DbSet<TSEntry> TSEntries { get; set; }
        public DbSet<TSWeek> TSWeeks { get; set; }
        public DbSet<Week> Weeks { get; set; }
        public DbSet<AspUser> AspUsers { get; set; }
        public DbSet<t_acct> t_acct { get; set; }
        public DbSet<t_acct_beg_bal> t_acct_beg_bal { get; set; }
        public DbSet<t_acct_budget> t_acct_budget { get; set; }
        public DbSet<t_acct_fiscal_month> t_acct_fiscal_month { get; set; }
        public DbSet<t_acct_fiscal_year> t_acct_fiscal_year { get; set; }
        public DbSet<t_acct_fund> t_acct_fund { get; set; }
        public DbSet<t_acct_trans> t_acct_trans { get; set; }
        public DbSet<t_acct_trans_txfr> t_acct_trans_txfr { get; set; }
        public DbSet<t_acct_trans_type> t_acct_trans_type { get; set; }
        public DbSet<t_acct_type> t_acct_type { get; set; }
        public DbSet<t_acct_user> t_acct_user { get; set; }
        public DbSet<t_sec_role_type> t_sec_role_type { get; set; }
        public DbSet<t_sec_user> t_sec_user { get; set; }
        public DbSet<t_sec_user_role> t_sec_user_role { get; set; }
        public DbSet<YearType> YearTypes { get; set; }
        public DbSet<t_date_month> t_date_month { get; set; }
        public DbSet<t_date_year> t_date_year { get; set; }
        public DbSet<qryService> qryServices { get; set; }
        public DbSet<qrySunday> qrySundays { get; set; }
        public DbSet<vw_ExpenseDept_Budget_By_FY> vw_ExpenseDept_Budget_By_FY { get; set; }
        public DbSet<vw_GF_ExpenseAcct_Budget_By_FY> vw_GF_ExpenseAcct_Budget_By_FY { get; set; }
        public DbSet<vw_GF_ExpenseDept_Budget_By_FY> vw_GF_ExpenseDept_Budget_By_FY { get; set; }
        public DbSet<vw_GF_IncomeDept_Budget_By_FY> vw_GF_IncomeDept_Budget_By_FY { get; set; }
        public DbSet<vw_IncomeDept_Budget_By_FY> vw_IncomeDept_Budget_By_FY { get; set; }
        public DbSet<vw_person_member_type> vw_person_member_type { get; set; }
        public DbSet<vwAttachment> vwAttachments { get; set; }
        public DbSet<vwBudgetMaster> vwBudgetMasters { get; set; }
        public DbSet<vwClass> vwClasses { get; set; }
        public DbSet<vwExpenseDept> vwExpenseDepts { get; set; }
        public DbSet<vwGFExpenseDept> vwGFExpenseDepts { get; set; }
        public DbSet<vwGFIncomeAcctBudget> vwGFIncomeAcctBudgets { get; set; }
        public DbSet<vwGFIncomeDept> vwGFIncomeDepts { get; set; }
        public DbSet<vwIncomeDept> vwIncomeDepts { get; set; }
        public DbSet<vwTransMaster> vwTransMasters { get; set; }
    
        public virtual ObjectResult<string> add_tblDates(Nullable<System.DateTime> dt)
        {
            var dtParameter = dt.HasValue ?
                new ObjectParameter("dt", dt) :
                new ObjectParameter("dt", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("add_tblDates", dtParameter);
        }
    
        public virtual int approve_tblTORequest(Nullable<int> userID, Nullable<int> tORequestID)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var tORequestIDParameter = tORequestID.HasValue ?
                new ObjectParameter("TORequestID", tORequestID) :
                new ObjectParameter("TORequestID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("approve_tblTORequest", userIDParameter, tORequestIDParameter);
        }
    
        public virtual int chk_UserTSEntries(Nullable<int> userID, Nullable<int> weekID)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var weekIDParameter = weekID.HasValue ?
                new ObjectParameter("WeekID", weekID) :
                new ObjectParameter("WeekID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("chk_UserTSEntries", userIDParameter, weekIDParameter);
        }
    
        public virtual int del_tblTORequest(Nullable<int> tORequestID)
        {
            var tORequestIDParameter = tORequestID.HasValue ?
                new ObjectParameter("TORequestID", tORequestID) :
                new ObjectParameter("TORequestID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("del_tblTORequest", tORequestIDParameter);
        }
    
        public virtual ObjectResult<get_EE_Balances_Result> get_EE_Balances(Nullable<int> userID)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<get_EE_Balances_Result>("get_EE_Balances", userIDParameter);
        }
    
        public virtual ObjectResult<get_TimesheetEntries_Result> get_TimesheetEntries(Nullable<int> userId, Nullable<int> weekId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));
    
            var weekIdParameter = weekId.HasValue ?
                new ObjectParameter("WeekId", weekId) :
                new ObjectParameter("WeekId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<get_TimesheetEntries_Result>("get_TimesheetEntries", userIdParameter, weekIdParameter);
        }
    
        public virtual int ins_tblTORequest(Nullable<int> tOUserID, Nullable<System.DateTime> tODate)
        {
            var tOUserIDParameter = tOUserID.HasValue ?
                new ObjectParameter("TOUserID", tOUserID) :
                new ObjectParameter("TOUserID", typeof(int));
    
            var tODateParameter = tODate.HasValue ?
                new ObjectParameter("TODate", tODate) :
                new ObjectParameter("TODate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ins_tblTORequest", tOUserIDParameter, tODateParameter);
        }
    
        public virtual int ins_tblTSEntry(Nullable<int> userID, Nullable<System.DateTime> startDate)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var startDateParameter = startDate.HasValue ?
                new ObjectParameter("StartDate", startDate) :
                new ObjectParameter("StartDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ins_tblTSEntry", userIDParameter, startDateParameter);
        }
    
        public virtual int ins_tblTSWeek(Nullable<int> userID, Nullable<System.DateTime> startDate)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var startDateParameter = startDate.HasValue ?
                new ObjectParameter("StartDate", startDate) :
                new ObjectParameter("StartDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ins_tblTSWeek", userIDParameter, startDateParameter);
        }
    
        public virtual ObjectResult<usp_tblTSEntryUpdate_Result> usp_tblTSEntryUpdate(Nullable<int> tSEntryID, Nullable<int> userID, Nullable<System.DateTime> tSDate, Nullable<decimal> workHours, Nullable<decimal> vacationHours, Nullable<decimal> sickHours, Nullable<decimal> holidayHours, Nullable<decimal> totalHours, Nullable<bool> isAdjustment, string notes)
        {
            var tSEntryIDParameter = tSEntryID.HasValue ?
                new ObjectParameter("TSEntryID", tSEntryID) :
                new ObjectParameter("TSEntryID", typeof(int));
    
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var tSDateParameter = tSDate.HasValue ?
                new ObjectParameter("TSDate", tSDate) :
                new ObjectParameter("TSDate", typeof(System.DateTime));
    
            var workHoursParameter = workHours.HasValue ?
                new ObjectParameter("WorkHours", workHours) :
                new ObjectParameter("WorkHours", typeof(decimal));
    
            var vacationHoursParameter = vacationHours.HasValue ?
                new ObjectParameter("VacationHours", vacationHours) :
                new ObjectParameter("VacationHours", typeof(decimal));
    
            var sickHoursParameter = sickHours.HasValue ?
                new ObjectParameter("SickHours", sickHours) :
                new ObjectParameter("SickHours", typeof(decimal));
    
            var holidayHoursParameter = holidayHours.HasValue ?
                new ObjectParameter("HolidayHours", holidayHours) :
                new ObjectParameter("HolidayHours", typeof(decimal));
    
            var totalHoursParameter = totalHours.HasValue ?
                new ObjectParameter("TotalHours", totalHours) :
                new ObjectParameter("TotalHours", typeof(decimal));
    
            var isAdjustmentParameter = isAdjustment.HasValue ?
                new ObjectParameter("IsAdjustment", isAdjustment) :
                new ObjectParameter("IsAdjustment", typeof(bool));
    
            var notesParameter = notes != null ?
                new ObjectParameter("Notes", notes) :
                new ObjectParameter("Notes", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<usp_tblTSEntryUpdate_Result>("usp_tblTSEntryUpdate", tSEntryIDParameter, userIDParameter, tSDateParameter, workHoursParameter, vacationHoursParameter, sickHoursParameter, holidayHoursParameter, totalHoursParameter, isAdjustmentParameter, notesParameter);
        }
    
        public virtual ObjectResult<fxMenu> get_MenusByUser(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<fxMenu>("get_MenusByUser", userIdParameter);
        }
    
        public virtual ObjectResult<ins_secUsers_Result> ins_secUsers(string userName, string password, string firstName, string lastName, string email, Nullable<bool> isEmployee, Nullable<bool> isFullTime, Nullable<bool> isExempt, Nullable<int> eETypeID, Nullable<int> eECategoryID, Nullable<System.DateTime> startDate, Nullable<System.DateTime> termDate, Nullable<byte> minHours, Nullable<byte> maxHours, Nullable<System.DateTime> fTStartDate, Nullable<short> annualVacHours, Nullable<short> capVacHours, Nullable<decimal> perPPVacHours, Nullable<System.DateTime> nextTierDate, Nullable<int> lastPayPeriodId, ObjectParameter userId)
        {
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));
    
            var firstNameParameter = firstName != null ?
                new ObjectParameter("FirstName", firstName) :
                new ObjectParameter("FirstName", typeof(string));
    
            var lastNameParameter = lastName != null ?
                new ObjectParameter("LastName", lastName) :
                new ObjectParameter("LastName", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var isEmployeeParameter = isEmployee.HasValue ?
                new ObjectParameter("IsEmployee", isEmployee) :
                new ObjectParameter("IsEmployee", typeof(bool));
    
            var isFullTimeParameter = isFullTime.HasValue ?
                new ObjectParameter("IsFullTime", isFullTime) :
                new ObjectParameter("IsFullTime", typeof(bool));
    
            var isExemptParameter = isExempt.HasValue ?
                new ObjectParameter("IsExempt", isExempt) :
                new ObjectParameter("IsExempt", typeof(bool));
    
            var eETypeIDParameter = eETypeID.HasValue ?
                new ObjectParameter("EETypeID", eETypeID) :
                new ObjectParameter("EETypeID", typeof(int));
    
            var eECategoryIDParameter = eECategoryID.HasValue ?
                new ObjectParameter("EECategoryID", eECategoryID) :
                new ObjectParameter("EECategoryID", typeof(int));
    
            var startDateParameter = startDate.HasValue ?
                new ObjectParameter("StartDate", startDate) :
                new ObjectParameter("StartDate", typeof(System.DateTime));
    
            var termDateParameter = termDate.HasValue ?
                new ObjectParameter("TermDate", termDate) :
                new ObjectParameter("TermDate", typeof(System.DateTime));
    
            var minHoursParameter = minHours.HasValue ?
                new ObjectParameter("MinHours", minHours) :
                new ObjectParameter("MinHours", typeof(byte));
    
            var maxHoursParameter = maxHours.HasValue ?
                new ObjectParameter("MaxHours", maxHours) :
                new ObjectParameter("MaxHours", typeof(byte));
    
            var fTStartDateParameter = fTStartDate.HasValue ?
                new ObjectParameter("FTStartDate", fTStartDate) :
                new ObjectParameter("FTStartDate", typeof(System.DateTime));
    
            var annualVacHoursParameter = annualVacHours.HasValue ?
                new ObjectParameter("AnnualVacHours", annualVacHours) :
                new ObjectParameter("AnnualVacHours", typeof(short));
    
            var capVacHoursParameter = capVacHours.HasValue ?
                new ObjectParameter("CapVacHours", capVacHours) :
                new ObjectParameter("CapVacHours", typeof(short));
    
            var perPPVacHoursParameter = perPPVacHours.HasValue ?
                new ObjectParameter("PerPPVacHours", perPPVacHours) :
                new ObjectParameter("PerPPVacHours", typeof(decimal));
    
            var nextTierDateParameter = nextTierDate.HasValue ?
                new ObjectParameter("NextTierDate", nextTierDate) :
                new ObjectParameter("NextTierDate", typeof(System.DateTime));
    
            var lastPayPeriodIdParameter = lastPayPeriodId.HasValue ?
                new ObjectParameter("LastPayPeriodId", lastPayPeriodId) :
                new ObjectParameter("LastPayPeriodId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ins_secUsers_Result>("ins_secUsers", userNameParameter, passwordParameter, firstNameParameter, lastNameParameter, emailParameter, isEmployeeParameter, isFullTimeParameter, isExemptParameter, eETypeIDParameter, eECategoryIDParameter, startDateParameter, termDateParameter, minHoursParameter, maxHoursParameter, fTStartDateParameter, annualVacHoursParameter, capVacHoursParameter, perPPVacHoursParameter, nextTierDateParameter, lastPayPeriodIdParameter, userId);
        }
    }
}

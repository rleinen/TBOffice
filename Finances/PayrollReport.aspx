<%@ Page Title="Payroll Report" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PayrollReport.aspx.cs" Inherits="TBOffice.Finances.PayrollReport" %>

<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>
<%@ Register Src="~/Finances/BudgetForm.ascx" TagPrefix="uc1" TagName="BudgetForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header-table{margin:10px; border-collapse:collapse;}
        .header-row {font-family:Tahoma; background-color:#dfdfdf}
        .header-row td {padding:3px;}
        .header-label {padding-left:10px; padding-right:50px; font-weight:bold; color:navy;}
        .label {color:maroon;}
        .label2 {color:maroon;margin-left:20px;}
        .column1-table{margin:0px; border-collapse:collapse;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%--    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <table style="width: 100%;" class="header-table">
        <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
        <tr>
            <td style="width:600px;vertical-align:top; text-align:left;">
            </td>
        </tr>

    </table>--%>

    <div>
        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="PayPeriod"></dx:ASPxDocumentViewer>    
    </div>

</asp:Content>

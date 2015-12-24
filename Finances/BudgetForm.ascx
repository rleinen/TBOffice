<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BudgetForm.ascx.cs" Inherits="TBOffice.Finances.BudgetForm" %>


<style type="text/css">
    .auto-style1 {
        width: 600px;
        border-collapse: collapse;
        border:solid 1px black;
    }
    .auto-style2 {
        text-align: center;
        width:50px;
    }
    .txtamt{
        background-color:lightgray;
        width:75px;
        text-align:right;
        font-weight:bold;
    }
    .auto-style3 {
        font-size:11px;
        padding-top:5px;
        font-family:Arial;
        font-weight:bold;
        color:navy;
        text-align: center;
        width:50px;
    }
    .auto-style4 {
        text-align: center;
        width:50px;
        padding-bottom:5px;
    }
    .form-header{
        background-color:#990000; font-weight:bold; color:#FFFFCC; text-align:center; margin-bottom:10px; border-bottom:solid 1px black;
        font-family:Arial; font-size:13px;
    }
</style>


<div style="width:600px;">
    <asp:HiddenField ID="varFiscalYear" runat="server" />
    <asp:HiddenField ID="varAcctId" runat="server" />
    <asp:HiddenField ID="varBudgetItemId" runat="server" />

    <table class="auto-style1">
        <tr>
            <td colspan="6" class="form-header">
                <asp:Label ID="labTitle" runat="server" Text="Budget for ...................."></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Jul</td>
            <td class="auto-style3">Aug</td>
            <td class="auto-style3">Sep</td>
            <td class="auto-style3">Oct</td>
            <td class="auto-style3">Nov</td>
            <td class="auto-style3">Dec</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="txtM1Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM2Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM3Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM4Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM5Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM6Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Jan</td>
            <td class="auto-style3">Feb</td>
            <td class="auto-style3">Mar</td>
            <td class="auto-style3">Apr</td>
            <td class="auto-style3">May</td>
            <td class="auto-style3">Jun</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="txtM7Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM8Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM9Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM10Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM11Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtM12Amt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Total</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:TextBox ID="txtBudgetAmt" runat="server" CssClass="txtamt"></asp:TextBox>
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="btnCopyFrom" runat="server" OnClick="btnCopyFrom_Click" Text="Copy From" />
            </td>
            <td class="auto-style4">
                <asp:Button ID="btnDivideEqual" runat="server" OnClick="btnDivideEqual_Click" Text="Divide Equal" />
            </td>
            <td class="auto-style4">
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
            </td>
            <td class="auto-style4">
                <asp:Button ID="btnSave" runat="server" Text="Save Budget" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>


</div>



<asp:SqlDataSource ID="dsBudgetEntry" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>'
    SelectCommand="get_t_acct_budget" SelectCommandType="StoredProcedure"
    UpdateCommand="save_t_acct_budget" UpdateCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="FiscalYear" Type="Int64"></asp:Parameter>
        <asp:Parameter Name="AcctId" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="UserId" Type="Int32"></asp:Parameter>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="BudgetItemId" Type="Int64"></asp:Parameter>
        <asp:Parameter Name="FiscalYear" Type="Int64"></asp:Parameter>
        <asp:Parameter Name="AcctId" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="BudgetAmt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M1Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M2Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M3Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M4Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M5Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M6Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M7Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M8Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M9Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M10Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M11Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="M12Amt" Type="Decimal"></asp:Parameter>
        <asp:Parameter Name="MB" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="MDT" Type="DateTime"></asp:Parameter>
    </UpdateParameters>
</asp:SqlDataSource>

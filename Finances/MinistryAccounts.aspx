<%@ Page Title="Ministry Budget Accounts" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MinistryAccounts.aspx.cs" Inherits="TBOffice.Finances.MinistryAccounts" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header-table{margin:10px; border-collapse:collapse;}
        .header-row {font-family:Tahoma; background-color:#dfdfdf}
        .header-row td {padding:3px;}
        .header-label {padding-left:10px; padding-right:50px; font-weight:bold; color:navy;}
        .label {color:maroon;}
        .label2 {color:maroon;margin-left:20px;}
        .label3 {color:maroon;margin-left:20px;}
        .column1-table{margin:0px; border-collapse:collapse;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 100%;" class="header-table">
        <tr class="header-row">
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Ministry Budget Accounts" CssClass="header-label"></asp:Label>
                <span style="width:50px;"></span>
                <asp:Label ID="Label2" runat="server" Text="Ministry Leader: " CssClass="label"></asp:Label>
                <cc1:OboutDropDownList ID="ddlMinistryLeader" runat="server" AutoPostBack="True" DataTextField="FullName" DataValueField="UserId"
                    FolderStyle="styles//dropdownlist/black_glass/OboutDropDownList" Width="200px" ControlsToDisable="" ControlsToEnable="" DataSourceID="dsMinistryLeaders" 
                    DisablingValues="" EnablingValues="" MenuWidth="200px" OnDataBound="ddlMinistryLeader_DataBound" OnSelectedIndexChanged="ddlMinistryLeader_SelectedIndexChanged">
                </cc1:OboutDropDownList>
                <span style="width:50px;"></span>
                <asp:Label ID="Label1" runat="server" Text="Fiscal Year: " CssClass="label3"></asp:Label>
                <cc1:OboutDropDownList ID="ddlFiscalYear" runat="server" AutoPostBack="True" DataTextField="ShortDesc" DataValueField="FiscalYear"
                    FolderStyle="styles//dropdownlist/black_glass/OboutDropDownList" Width="200px" ControlsToDisable="" ControlsToEnable="" DataSourceID="dsFiscalYear" 
                    DisablingValues="" EnablingValues="" MenuWidth="200px" OnDataBound="ddlFiscalYear_DataBound" OnSelectedIndexChanged="ddlFiscalYear_SelectedIndexChanged">
                </cc1:OboutDropDownList>
            </td>
        </tr>
        <tr>
            <td style="width:600px;vertical-align:top; text-align:left;padding-top:5px;">
                <table style="width: 100%;" class="column1-table">
                <tr>
                <td style="vertical-align:top; text-align:left; padding-top:5px;" >
                    <asp:GridView ID="gvUserGFAccounts" runat="server" AutoGenerateColumns="False" DataKeyNames="AcctId" DataSourceID="dsUserGFAccounts" 
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both"
                        Font-Names="Arial" Font-Size="Small" ShowFooter="true"  OnRowDataBound="gvUserGFAccounts_RowDataBound">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" HeaderText="Account Name" ControlStyle-Font-Names="Arial" ItemStyle-Width="200" FooterStyle-HorizontalAlign="Right"></asp:CommandField>
                            <asp:BoundField DataField="AcctId" HeaderText="AcctId" ReadOnly="True" SortExpression="AcctId" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="AccountDesc" HeaderText="AccountDesc" SortExpression="AccountDesc" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="BudgetAmt" HeaderText="Annual Budget" DataFormatString="{0:c0}" ItemStyle-Width="75" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"></asp:BoundField>
                            <asp:BoundField DataField="YTDBudgetAmt" HeaderText="YTD Budget" ReadOnly="True" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"></asp:BoundField>
                            <asp:BoundField DataField="YTDAmt" HeaderText="YTD Actual" ReadOnly="True" ItemStyle-Width="75" DataFormatString="{0:c0}" 
                                ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"></asp:BoundField>
                            <asp:BoundField DataField="YTDBal" HeaderText="YTD Balance" ReadOnly="True" ItemStyle-Width="75" SortExpression="YTDBal" 
                                ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"></asp:BoundField>
                            <asp:BoundField DataField="TotalBalance" HeaderText="Annual Balance" ItemStyle-Width="75" ReadOnly="True" 
                                ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" ItemStyle-BackColor=""></asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Font-Bold="true" ></FooterStyle>
                        
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Font-Names="Arial" HorizontalAlign="Center"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                        <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                    </asp:GridView>

                </td>
                </tr>
            </table>
            </td>
            <td style="vertical-align:top; text-align:left; padding-left:5px; padding-top:10px;">
                <div style="height:800px; width:600px; overflow-y:auto; border:solid 1px #000000;">
                <asp:GridView ID="gvAcctTrans" runat="server" AutoGenerateColumns="False" DataSourceID="dsAcctTrans" DataKeyNames="TransId" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" OnRowDataBound="gvAcctTrans_RowDataBound"
                        Font-Names="Arial" Font-Size="Small">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ItemStyle-Width="75" HeaderText="Date"></asp:CommandField>
                        <asp:BoundField DataField="TransId" HeaderText="TransId" SortExpression="TransId" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="TransDate" HeaderText="Date" SortExpression="TransDate" DataFormatString="{0:MM/dd/yy}" 
                            ItemStyle-Width="75" Visible="false" ></asp:BoundField>
                        <asp:BoundField DataField="AcctId" HeaderText="AcctId" SortExpression="AcctId" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="AcctDesc" HeaderText="AcctDesc" SortExpression="AcctDesc" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="Vendor" HeaderText="Vendor" SortExpression="Vendor" ItemStyle-Width="300"></asp:BoundField>
                        <asp:BoundField DataField="Memo" HeaderText="Memo" SortExpression="Memo" ItemStyle-Width="300"></asp:BoundField>
                        <asp:BoundField DataField="TransAmt" HeaderText="Amount" SortExpression="TransAmt" DataFormatString="{0:c2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center" Height="40"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                    <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                </asp:GridView>
                </div>
            </td>
        </tr>

    </table>


    <asp:SqlDataSource runat="server" ID="dsFiscalYear" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [FiscalYear], [ShortDesc], [BegDate], [EndDate] FROM [t_acct_fiscal_year] ORDER BY [FiscalYear] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsMinistryLeaders" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_MinistryAccount_UserList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="UserId" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>    
    <asp:SqlDataSource ID="dsAcctTrans" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_Acct_Trans_By_FY" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="gvUserGFAccounts" PropertyName="SelectedValue" Name="AcctId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsUserGFAccounts" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_User_BudgetSummary" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMinistryLeader" PropertyName="SelectedValue" Name="UserId" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

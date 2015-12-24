<%@ Page Title="GF Income" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GFIncome.aspx.cs" Inherits="TBOffice.Finances.GFIncome" %>
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
    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <table style="width: 100%;" class="header-table">
        <tr class="header-row">
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="General Fund Income" CssClass="header-label"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Fiscal Year: " CssClass="label"></asp:Label>
                <cc1:OboutDropDownList ID="ddlFiscalYear" runat="server" AutoPostBack="True" DataTextField="ShortDesc" DataValueField="FiscalYear"
                    FolderStyle="styles//dropdownlist/black_glass/OboutDropDownList" Width="200px" ControlsToDisable="" ControlsToEnable="" DataSourceID="dsFiscalYear" 
                    DisablingValues="" EnablingValues="" MenuWidth="200px" OnDataBound="ddlFiscalYear_DataBound" OnSelectedIndexChanged="ddlFiscalYear_SelectedIndexChanged">
                </cc1:OboutDropDownList>
            </td>
        </tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
        <tr>
            <td style="width:600px;vertical-align:top; text-align:left;">
                <table style="width: 100%;" class="column1-table">
                <tr><td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                <asp:GridView ID="gvIncomeDepts" runat="server" AutoGenerateColumns="False" DataKeyNames="DeptAcctId" DataSourceID="dsIncomeDepts" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both"
                    Font-Names="Arial" Font-Size="Small" ShowFooter="true" OnRowDataBound="gvIncomeDepts_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ItemStyle-Width="300" HeaderText="Department">
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:CommandField>
                        <asp:BoundField DataField="DeptAcctId" HeaderText="DeptAcctId" ReadOnly="True" SortExpression="DeptAcctId" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="DeptDesc" HeaderText="Department" SortExpression="DeptDesc" ItemStyle-Width="300" Visible="false">
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ActualAmt" HeaderText="Actual" ReadOnly="True" SortExpression="ActualAmt" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                        <asp:BoundField DataField="BudgetAmt" HeaderText="Budget" ReadOnly="True" SortExpression="BudgetAmt" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                        <asp:BoundField DataField="Difference" HeaderText="Balance" ReadOnly="True" SortExpression="Difference" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Font-Bold="true" HorizontalAlign="Right"></FooterStyle>

                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                    <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td></tr>
                <tr>
                <td style="vertical-align:top; text-align:left; padding-top:5px;" >
                    <div style="height:405px; overflow-y:auto; border:solid 1px #000000;">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                    <asp:GridView ID="gvIncomeAccts" runat="server" AutoGenerateColumns="False" DataKeyNames="AcctId" DataSourceID="dsIncomeAccts" 
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both"
                        Font-Names="Arial" Font-Size="Small" ShowFooter="true" OnRowDataBound="gvIncomeAccts_RowDataBound" OnSelectedIndexChanged="gvIncomeAccts_SelectedIndexChanged" >
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ItemStyle-Width="300" HeaderText="Account Name">
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:CommandField>
                            <asp:BoundField DataField="AcctId" HeaderText="AcctId" ReadOnly="True" SortExpression="AcctId" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="AcctDesc" HeaderText="Account Name" SortExpression="AcctDesc" ItemStyle-Width="300" Visible="false">
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ActualAmt" HeaderText="Actual" ReadOnly="True" SortExpression="ActualAmt" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                            <asp:BoundField DataField="BudgetAmt" HeaderText="Budget" ReadOnly="True" SortExpression="BudgetAmt" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                            <asp:BoundField DataField="Difference" HeaderText="Balance" ReadOnly="True" SortExpression="Difference" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Font-Bold="true" HorizontalAlign="Right"></FooterStyle>

                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                        <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                </td>
                </tr>
            </table>
            </td>
            <td style="vertical-align:top; text-align:left; padding-left:5px;">
                <div style="margin-bottom:10px;">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                <asp:GridView ID="gvIncExpSummary" runat="server" AutoGenerateColumns="False" DataSourceID="dsIncExpSummary" Width="600" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" OnRowDataBound="gvIncExpSummary_RowDataBound"
                        Font-Names="Arial" Font-Size="Small">
                    <Columns>
                        <asp:BoundField DataField="General Fund" HeaderText="General Fund" ReadOnly="True" SortExpression="General Fund"></asp:BoundField>
                        <asp:BoundField DataField="Actual" HeaderText="Actual" ReadOnly="True" SortExpression="Actual" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ></asp:BoundField>
                        <asp:BoundField DataField="Budget" HeaderText="Budget" ReadOnly="True" SortExpression="Budget" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ></asp:BoundField>
                        <asp:BoundField DataField="Balance" HeaderText="Balance" ReadOnly="True" SortExpression="Balance" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                    <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>               
                </div>
                <div style="height:250px; width:600px; overflow-y:auto; border:solid 1px #000000;">
                    <asp:UpdatePanel ID="panAcctTrans" runat="server">
                        <ContentTemplate>
                <asp:GridView ID="gvAcctTrans" runat="server" AutoGenerateColumns="False" DataSourceID="dsAcctTrans" DataKeyNames="TransId" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" OnRowDataBound="gvAcctTrans_RowDataBound"
                        Font-Names="Arial" Font-Size="Small">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ItemStyle-Width="75" HeaderText="Date"></asp:CommandField>
                        <asp:BoundField DataField="TransId" HeaderText="TransId" SortExpression="TransId" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="TransDate" HeaderText="Date" SortExpression="TransDate" DataFormatString="{0:MM/dd/yy}" ItemStyle-Width="75" Visible="false" ></asp:BoundField>
                        <asp:BoundField DataField="AcctId" HeaderText="AcctId" SortExpression="AcctId" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="AcctDesc" HeaderText="AcctDesc" SortExpression="AcctDesc" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="Vendor" HeaderText="Vendor" SortExpression="Vendor" ItemStyle-Width="200"></asp:BoundField>
                        <asp:BoundField DataField="Memo" HeaderText="Memo" SortExpression="Memo" ItemStyle-Width="200"></asp:BoundField>
                        <asp:BoundField DataField="TransAmt" HeaderText="Amount" SortExpression="TransAmt" DataFormatString="{0:c2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                    <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>               
                </div>
                <div style="height:180px; width:600px; overflow-y:auto; margin-top:6px;">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <uc1:BudgetForm runat="server" ID="BudgetForm" OnBudgetUpdated="BudgetForm_BudgetUpdated" />
                        </ContentTemplate>
                    </asp:UpdatePanel>               
                </div>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top; text-align:left;" colspan="2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                <asp:GridView ID="gvMonthlySummary" runat="server" AutoGenerateColumns="False" DataSourceID="dsMonthlySummary" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both"
                        Font-Names="Arial" Font-Size="Small" OnRowDataBound="gvMonthlySummary_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="AcctId" HeaderText="AcctId" ReadOnly="True" SortExpression="AcctId" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="RowTitle" HeaderText="" ReadOnly="True" SortExpression="RowTitle" ItemStyle-Width="100" ItemStyle-Font-Bold="true"></asp:BoundField>
                        <asp:BoundField DataField="AcctDesc" HeaderText="AcctDesc" ReadOnly="True" SortExpression="AcctDesc" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="Jul" HeaderText="Jul" ReadOnly="True" SortExpression="Jul" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Aug" HeaderText="Aug" ReadOnly="True" SortExpression="Aug" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Sep" HeaderText="Sep" ReadOnly="True" SortExpression="Sep" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Oct" HeaderText="Oct" ReadOnly="True" SortExpression="Oct" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Nov" HeaderText="Nov" ReadOnly="True" SortExpression="Nov" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Dec" HeaderText="Dec" ReadOnly="True" SortExpression="Dec" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Jan" HeaderText="Jan" ReadOnly="True" SortExpression="Jan" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Feb" HeaderText="Feb" ReadOnly="True" SortExpression="Feb" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Mar" HeaderText="Mar" ReadOnly="True" SortExpression="Mar" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Apr" HeaderText="Apr" ReadOnly="True" SortExpression="Apr" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="May" HeaderText="May" ReadOnly="True" SortExpression="May" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Jun" HeaderText="Jun" ReadOnly="True" SortExpression="Jun" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="75" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85" HeaderStyle-HorizontalAlign="Center"
                                        ItemStyle-Font-Bold="true" ItemStyle-ForeColor="Black"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                    <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

    </table>


    <asp:SqlDataSource runat="server" ID="dsFiscalYear" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [FiscalYear], [ShortDesc], [BegDate], [EndDate] FROM [t_acct_fiscal_year] ORDER BY [FiscalYear] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsIncomeDepts" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_GF_IncomeDept_BudgetVSActual" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsIncomeAccts" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_GF_IncomeSubDept_BudgetVSActual" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="gvIncomeDepts" PropertyName="SelectedValue" Name="DeptAcctId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAcctTrans" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_Acct_Trans_By_FY" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="gvIncomeAccts" PropertyName="SelectedValue" Name="AcctId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsMonthlySummary" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_Acct_BudgetVSActual_Monthly_By_FY" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvIncomeAccts" PropertyName="SelectedValue" Name="AcctId" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsIncExpSummary" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_GF_IncomeExpenseSummary_BudgetVSActual" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

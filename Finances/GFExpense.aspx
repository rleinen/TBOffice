<%@ Page Title="GF Expense" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GFExpense.aspx.cs" Inherits="TBOffice.Finances.GFExpense" MaintainScrollPositionOnPostback="true" %>
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
                <asp:Label ID="Label3" runat="server" Text="General Fund Expenses" CssClass="header-label"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Fiscal Year: " CssClass="label"></asp:Label>
                <cc1:OboutDropDownList ID="ddlFiscalYear" runat="server" AutoPostBack="True" DataTextField="ShortDesc" DataValueField="FiscalYear"
                    FolderStyle="styles//dropdownlist/black_glass/OboutDropDownList" Width="200px" ControlsToDisable="" ControlsToEnable="" DataSourceID="dsFiscalYear" 
                    DisablingValues="" EnablingValues="" MenuWidth="200px">
                </cc1:OboutDropDownList>
            </td>
        </tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
        <tr>
            <td style="width:600px;vertical-align:top; text-align:left;">
                <table style="width: 100%;" class="column1-table">
                <tr><td>
                    <div style="height:175px; border:solid 1px #000000;">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                <asp:GridView ID="gvExpenseDepts" runat="server" AutoGenerateColumns="False" DataKeyNames="DeptAcctId" DataSourceID="dsExpenseDepts" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both"
                    Font-Names="Arial" Font-Size="Small" ShowFooter="true" OnRowDataBound="gvExpenseDepts_RowDataBound">
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

                    <HeaderStyle HorizontalAlign="Center" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

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
                </td></tr>
                <tr>
                <td style="vertical-align:top; text-align:left; padding-top:5px;" >
                    <div style="height:177px; overflow-y:auto; border:solid 1px #000000;">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                    <asp:GridView ID="gvExpenseSubDepts" runat="server" AutoGenerateColumns="False" DataKeyNames="AcctId" DataSourceID="dsExpenseSubDepts" 
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both"
                        Font-Names="Arial" Font-Size="Small" ShowFooter="true" OnRowDataBound="gvExpenseSubDepts_RowDataBound" >
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ItemStyle-Width="300" HeaderText="Sub-Department" ></asp:CommandField>
                            <asp:BoundField DataField="AcctId" HeaderText="AcctId" ReadOnly="True" SortExpression="AcctId" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="AcctDesc" HeaderText="Sub-Department" SortExpression="AcctDesc" ItemStyle-Width="300" Visible="false">
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ActualAmt" HeaderText="Actual" ReadOnly="True" SortExpression="ActualAmt" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                            <asp:BoundField DataField="BudgetAmt" HeaderText="Budget" ReadOnly="True" SortExpression="BudgetAmt" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                            <asp:BoundField DataField="Difference" HeaderText="Balance" ReadOnly="True" SortExpression="Difference" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Font-Bold="true" HorizontalAlign="Right"></FooterStyle>

                        <HeaderStyle HorizontalAlign="Center" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

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
                <tr>
                <td style="vertical-align:top; text-align:left; padding-top:5px;" >
                    <div style="height:250px; overflow-y:auto; border:solid 1px #000000;">
                    <asp:UpdatePanel ID="updExpenseAccts" runat="server">
                        <ContentTemplate>
                        <asp:GridView ID="gvExpenseAccts" runat="server" AutoGenerateColumns="False" DataKeyNames="AcctId" DataSourceID="dsExpenseAccts" 
                            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both"
                            Font-Names="Arial" Font-Size="Small" ShowFooter="true" OnRowDataBound="gvExpenseAccts_RowDataBound" OnSelectedIndexChanged="gvExpenseAccts_SelectedIndexChanged" >
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" ItemStyle-Width="300" HeaderText="Account Name" >
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:CommandField>
                                <asp:BoundField DataField="AcctId" HeaderText="AcctId" ReadOnly="True" SortExpression="AcctId" Visible="false"></asp:BoundField>
                                <asp:BoundField DataField="AcctDesc" HeaderText="Account Name" SortExpression="AcctDesc" ItemStyle-Width="300" Visible="false">
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ActualAmt" HeaderText="Actual" ReadOnly="True" SortExpression="ActualAmt" 
                                    DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                                <asp:TemplateField HeaderText="Budget" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnEditBudget" runat="server" Text="$$$" CommandName="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:BoundField DataField="BudgetAmt" HeaderText="Budget" ReadOnly="True" SortExpression="BudgetAmt" 
                                    DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>--%>
                                <asp:BoundField DataField="Difference" HeaderText="Balance" ReadOnly="True" SortExpression="Difference" DataFormatString="{0:c0}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="85"></asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Font-Bold="true" HorizontalAlign="Right"></FooterStyle>

                            <HeaderStyle HorizontalAlign="Center" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

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

                    <HeaderStyle HorizontalAlign="Center" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

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
                                <asp:BoundField DataField="TransDate" HeaderText="Date" SortExpression="TransDate" DataFormatString="{0:MM/dd/yy}" ItemStyle-Width="75" visible="false"></asp:BoundField>
                                <asp:BoundField DataField="AcctId" HeaderText="AcctId" SortExpression="AcctId" Visible="false"></asp:BoundField>
                                <asp:BoundField DataField="AcctDesc" HeaderText="AcctDesc" SortExpression="AcctDesc" Visible="false"></asp:BoundField>
                                <asp:BoundField DataField="Vendor" HeaderText="Vendor" SortExpression="Vendor" ItemStyle-Width="200"></asp:BoundField>
                                <asp:BoundField DataField="Memo" HeaderText="Memo" SortExpression="Memo" ItemStyle-Width="200"></asp:BoundField>
                                <asp:BoundField DataField="TransAmt" HeaderText="Amount" SortExpression="TransAmt" DataFormatString="{0:c2}" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100"></asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                            <HeaderStyle HorizontalAlign="Center" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

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
                <div style="height:250px; width:600px; overflow-y:auto; margin-top:6px;">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <uc1:BudgetForm runat="server" ID="BudgetForm" OnBudgetUpdated="BudgetForm_BudgetUpdated" Visible="false" />
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

                    <HeaderStyle HorizontalAlign="Center" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

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

<%--    <asp:Button ID="btnShowPopup" runat="server" Text="Popup" OnClick="btnShowPopup_Click" />

    <asp:Panel ID="ModalPanel" runat="server" Width="500px">
     ASP.NET AJAX is a free framework for quickly creating a new generation of more 
     efficient, more interactive and highly-personalized Web experiences that work 
     across all the most popular browsers.<br />
     <asp:Button ID="OKButton" runat="server" Text="Close" />
    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlId="btnShowPopup" 
     PopupControlID="ModalPanel" OkControlID="OKButton" />--%>

<%--    <asp:Panel ID="panPop" runat="server" Width="500px" style="display:none;">
        <asp:UpdatePanel ID="updEditBudget" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <ajaxToolkit:ModalPopupExtender ID="modalPop" runat="server"
                    TargetControlID="btnShowPopup" PopupControlID="panPop" CancelControlID="btnClose" />
                <div>
                    <asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" CausesValidation="true"></asp:LinkButton> | 
                    <asp:LinkButton ID="btnClose" runat="server" Text="Close" CausesValidation="false"></asp:LinkButton>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>--%>

    <asp:SqlDataSource runat="server" ID="dsFiscalYear" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [FiscalYear], [ShortDesc], [BegDate], [EndDate] FROM [t_acct_fiscal_year] ORDER BY [FiscalYear] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsExpenseDepts" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_GF_ExpenseDept_BudgetVSActual" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsExpenseSubDepts" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_GF_ExpenseSubDept_BudgetVSActual" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="gvExpenseDepts" PropertyName="SelectedValue" Name="DeptAcctId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsExpenseAccts" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_GF_ExpenseAcct_BudgetVSActual" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="gvExpenseSubDepts" PropertyName="SelectedValue" Name="SubDeptAcctId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAcctTrans" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_Acct_Trans_By_FY" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="gvExpenseAccts" PropertyName="SelectedValue" Name="AcctId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsMonthlySummary" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_GF_ExpenseAcct_BudgetVSActual_Monthly_By_FY" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvExpenseAccts" PropertyName="SelectedValue" Name="AcctId" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsIncExpSummary" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_GF_IncomeExpenseSummary_BudgetVSActual" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAcctBudget" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        DeleteCommand="DELETE FROM [t_acct_budget] WHERE [BudgetItemId] = @BudgetItemId" 
        InsertCommand="INSERT INTO [t_acct_budget] ([FiscalYear], [AcctId], [BudgetAmt], [M1Amt], [M2Amt], [M3Amt], [M4Amt], [M5Amt], [M6Amt], [M7Amt], [M8Amt], [M9Amt], [M10Amt], [M11Amt], [M12Amt], [CB], [CDT], [MB], [MDT]) VALUES (@FiscalYear, @AcctId, @BudgetAmt, @M1Amt, @M2Amt, @M3Amt, @M4Amt, @M5Amt, @M6Amt, @M7Amt, @M8Amt, @M9Amt, @M10Amt, @M11Amt, @M12Amt, @CB, @CDT, @MB, @MDT)" 
        SelectCommand="SELECT [BudgetItemId], [FiscalYear], [AcctId], [BudgetAmt], [M1Amt], [M2Amt], [M3Amt], [M4Amt], [M5Amt], [M6Amt], [M7Amt], [M8Amt], [M9Amt], [M10Amt], [M11Amt], [M12Amt], [CB], [CDT], [MB], [MDT] FROM [t_acct_budget] WHERE (([AcctId] = @AcctId) AND ([FiscalYear] = @FiscalYear))" 
        UpdateCommand="UPDATE [t_acct_budget] SET [FiscalYear] = @FiscalYear, [AcctId] = @AcctId, [BudgetAmt] = @BudgetAmt, [M1Amt] = @M1Amt, [M2Amt] = @M2Amt, [M3Amt] = @M3Amt, [M4Amt] = @M4Amt, [M5Amt] = @M5Amt, [M6Amt] = @M6Amt, [M7Amt] = @M7Amt, [M8Amt] = @M8Amt, [M9Amt] = @M9Amt, [M10Amt] = @M10Amt, [M11Amt] = @M11Amt, [M12Amt] = @M12Amt, [CB] = @CB, [CDT] = @CDT, [MB] = @MB, [MDT] = @MDT WHERE [BudgetItemId] = @BudgetItemId">
        <DeleteParameters>
            <asp:Parameter Name="BudgetItemId" Type="Int64"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="gvExpenseAccts" PropertyName="SelectedValue" Name="AcctId" Type="Int32"></asp:ControlParameter>
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
            <asp:Parameter Name="CB" Type="Int32" DefaultValue="<%= SessionMgr.User.UserID %>"></asp:Parameter>
            <asp:Parameter Name="CDT" Type="DateTime" DefaultValue="<%= DateTime.Now() %>"></asp:Parameter>
            <asp:Parameter Name="MB" Type="Int32" DefaultValue="<%= SessionMgr.User.UserID %>"></asp:Parameter>
            <asp:Parameter Name="MDT" Type="DateTime" DefaultValue="<%= DateTime.Now() %>"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvExpenseAccts" PropertyName="SelectedValue" Name="AcctId" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int64"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="gvExpenseAccts" PropertyName="SelectedValue" Name="AcctId" Type="Int32"></asp:ControlParameter>
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
            <asp:Parameter Name="MB" Type="Int32" DefaultValue="<%= SessionMgr.User.UserID %>"></asp:Parameter>
            <asp:Parameter Name="MDT" Type="DateTime" DefaultValue="<%= DateTime.Now() %>"></asp:Parameter>
            <asp:Parameter Name="BudgetItemId" Type="Int64"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

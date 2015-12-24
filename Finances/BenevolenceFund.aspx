<%@ Page Title="Benevolence Fund" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BenevolenceFund.aspx.cs" Inherits="TBOffice.Finances.BenevolenceFund" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>
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

    <table style="width: 100%;" class="header-table">
        <tr class="header-row">
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Benevolence Fund" CssClass="header-label"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Fiscal Year: " CssClass="label"></asp:Label>
                <cc1:OboutDropDownList ID="ddlFiscalYear" runat="server" AutoPostBack="True" DataTextField="ShortDesc" DataValueField="FiscalYear"
                    FolderStyle="styles//dropdownlist/black_glass/OboutDropDownList" Width="200px" ControlsToDisable="" ControlsToEnable="" DataSourceID="dsFiscalYear" 
                    DisablingValues="" EnablingValues="" MenuWidth="200px" OnDataBound="ddlFiscalYear_DataBound" OnSelectedIndexChanged="ddlFiscalYear_SelectedIndexChanged">
                </cc1:OboutDropDownList>
                <span style="width:30px;"></span>
                <asp:Label ID="Label2" runat="server" Text="Search Text: " CssClass="label"></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                <span style="width:30px;"></span>
                <asp:Button ID="btnShowAll" runat="server" Text="Show All" OnClick="btnShowAll_Click" />
            </td>
        </tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
        <tr>
            <td style="width:480px;vertical-align:top; text-align:left;">
                <table style="width: 100%;" class="column1-table">
                    <tr><td style="vertical-align:top; text-align:left; padding-top:0px;" >
                        <div style="height:650px; width:465px; overflow-y:auto; border:solid 1px #000000;">
                        <asp:GridView ID="gvBFIncome" runat="server" AutoGenerateColumns="False" DataSourceID="dsBFIncome" ShowFooter="true" 
                            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowDataBound="gvBFIncome_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="TransId" HeaderText="TransId" SortExpression="TransId" Visible="false"></asp:BoundField>
                                <asp:BoundField DataField="TransDate" HeaderText="Date" SortExpression="TransDate" DataFormatString="{0:MM/dd/yy}" ItemStyle-HorizontalAlign="Center" ></asp:BoundField>
                                <asp:BoundField DataField="Memo" HeaderText="Income Source (Memo)" SortExpression="Memo"></asp:BoundField>
                                <asp:BoundField DataField="Vendor" HeaderText="Vendor" SortExpression="Vendor" Visible="false"></asp:BoundField>
                                <asp:BoundField DataField="TransAmt" HeaderText="Income" SortExpression="TransAmt" DataFormatString="{0:c2}" 
                                    ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" ></asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                            <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        </div>
                    </td></tr>
                </table>
            </td>
            <td style="vertical-align:top; text-align:left; padding-left:5px; padding-top:0px;">
                <table style="width: 100%;" class="column1-table">
                <tr><td>
                <div style="width:500px; margin-bottom:10px;">
                    <asp:GridView ID="gvBFBalance" runat="server" AutoGenerateColumns="False" DataSourceID="dsBFBalance" 
                        BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" HorizontalAlign="Right">
                        <Columns>
                            <asp:BoundField DataField="CurrentDate" HeaderText="Benevolent Fund" ReadOnly="True" SortExpression="CurrentDate"></asp:BoundField>
                            <asp:BoundField DataField="BFBalance" HeaderText="Balance" ReadOnly="True" DataFormatString="{0:c2}" SortExpression="BFBalance"></asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                        <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                </div>
                </td></tr>
                <tr>
                <td>
                <div style="height:580px; width:500px; overflow-y:auto; border:solid 1px #000000; margin-top:10px;">
                    <asp:GridView ID="gvBFGiftTrans" runat="server" AutoGenerateColumns="False" DataSourceID="dsBFGiftTrans" ShowFooter="true" 
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowDataBound="gvBFGiftTrans_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="TransId" HeaderText="TransId" SortExpression="TransId" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="TransDate" HeaderText="Date" SortExpression="TransDate" DataFormatString="{0:MM/dd/yy}"></asp:BoundField>
                            <asp:BoundField DataField="Memo" HeaderText="Gift Description" SortExpression="Memo"></asp:BoundField>
                            <asp:BoundField DataField="Vendor" HeaderText="Vendor" SortExpression="Vendor" FooterStyle-HorizontalAlign="Right"></asp:BoundField>
                            <asp:BoundField DataField="TransAmt" HeaderText="Gift Amt" ReadOnly="True" SortExpression="TransAmt" 
                                ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" DataFormatString="{0:c2}"></asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

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
            </td>
        </tr>
    </table>


    <asp:SqlDataSource runat="server" ID="dsFiscalYear" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [FiscalYear], [ShortDesc], [BegDate], [EndDate] FROM [t_acct_fiscal_year] ORDER BY [FiscalYear] DESC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsBFBalance" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_BF_Balance" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsBFIncome" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_BF_Income" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsBFGiftTrans" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_BF_GiftTrans" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiscalYear" PropertyName="SelectedValue" Name="FiscalYear" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtSearch" PropertyName="Text" Name="SearchText" Type="String" ConvertEmptyStringToNull="true"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Timesheet.aspx.cs" Inherits="TBOffice.Employee.Timesheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="width:25%">&nbsp;</td>
            <td style="width:25%">&nbsp;</td>
            <td style="width:25%">&nbsp;</td>
            <td style="width:25%">&nbsp;</td>
        </tr>
        <tr>
            <td>Employee Timesheet</td>
            <td colspan="3">
                <asp:Label ID="Label1" runat="server" Text="Employee: "></asp:Label>
                <asp:DropDownList ID="cmbEE" runat="server" DataSourceID="dsEEList" DataTextField="DisplayName" DataValueField="UserID" AutoPostBack="True">
                </asp:DropDownList>
                <span style="width:10px;"></span>
                <asp:Label ID="Label2" runat="server" Text="Week: "></asp:Label>
                <asp:DropDownList ID="cmbWeeks" runat="server" DataSourceID="dsWeeks" DataTextField="Year-Week" DataValueField="WeekID" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">

                <asp:GridView ID="GridView1" runat="server" DataSourceID="dsTSEntry" AutoGenerateColumns="False" DataKeyNames="TSEntryID" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowFooter="true" OnRowDataBound="GridView1_RowDataBound" OnRowUpdated="GridView1_RowUpdated">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ItemStyle-Width="50">

                        </asp:CommandField>
                        <asp:BoundField DataField="TSEntryID" HeaderText="TSEntryID" ReadOnly="True" InsertVisible="False" SortExpression="TSEntryID" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="TSDate" HeaderText="Date" SortExpression="TSDate" DataFormatString="{0:ddd (M/dd)}" ReadOnly="true">
                            <ItemStyle HorizontalAlign="Right" Width="90"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="WorkHours" HeaderText="Work" SortExpression="WorkHours" DataFormatString="{0:f1}">
                            <ItemStyle HorizontalAlign="Center" Width="70"></ItemStyle>
                            <ControlStyle Width="70" />
                        </asp:BoundField>
                        <asp:BoundField DataField="VacationHours" HeaderText="Vacation" SortExpression="VacationHours" DataFormatString="{0:f1}">
                            <ItemStyle HorizontalAlign="Center" Width="70"></ItemStyle>
                            <ControlStyle Width="70" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SickHours" HeaderText="Sick" SortExpression="SickHours" DataFormatString="{0:f1}">
                            <ItemStyle HorizontalAlign="Center" Width="70"></ItemStyle>
                            <ControlStyle Width="70" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HolidayHours" HeaderText="Holiday" SortExpression="HolidayHours" DataFormatString="{0:f1}">
                            <ItemStyle HorizontalAlign="Center" Width="70"></ItemStyle>
                            <ControlStyle Width="70" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalHours" HeaderText="Total" ReadOnly="True" SortExpression="TotalHours" DataFormatString="{0:f1}">
                            <ItemStyle HorizontalAlign="Center" Width="70" Font-Bold="true"></ItemStyle>
                            <ControlStyle Width="70" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes">
                            <ItemStyle HorizontalAlign="Left" Width="250"></ItemStyle>
                            <ControlStyle Width="250" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" HorizontalAlign="Center" Font-Bold="true"></FooterStyle>

                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>

                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#FFF1D4"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#B95C30"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#F1E5CE"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#93451F"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:DetailsView ID="dvEEBalance" runat="server" Height="50px" Width="213px" DataSourceID="dsEEBalances" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>
                    <Fields>
                        <asp:BoundField DataField="WorkBalance" HeaderText="Work Balance" SortExpression="WorkBalance" DataFormatString="{0:f1}">
                            <ControlStyle Font-Bold="True" ForeColor="#CC0000"></ControlStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="VacBalance" HeaderText="Vac Balance" SortExpression="VacBalance" DataFormatString="{0:f1}"></asp:BoundField>
                        <asp:BoundField DataField="SickBalance" HeaderText="Sick Balance" SortExpression="SickBalance" DataFormatString="{0:f1}"></asp:BoundField>

                    </Fields>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                </asp:DetailsView>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>


    <asp:SqlDataSource ID="dsEEList" runat="server" ConnectionString="<%$ ConnectionStrings:TBBF %>" 
        SelectCommand="SELECT UserID, DisplayName FROM secUsers ORDER BY FirstName, LastName"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsWeeks" runat="server" ConnectionString="<%$ ConnectionStrings:TBBF %>" 
        SelectCommand="SELECT TOP 60 [WeekID], ' ' + datename(m,[BegDate]) + '-' + datename(d,[BegDate]) + ' to ' + datename(m,[EndDate]) + '-' + datename(d,[EndDate]) + ' -- ' + datename(year,[BegDate]) + ' (' + cast([WeekNum] AS varchar(3)) + ')' AS [Year-Week], [begdate], [enddate] FROM [tblWeeks] WHERE [begdate] >= dateadd(year,-1,getdate())"></asp:SqlDataSource>


    <asp:SqlDataSource ID="dsTSEntry" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="get_TimesheetEntries" SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_tblTSEntryUpdate" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="cmbEE" PropertyName="SelectedValue" Name="UserId" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="cmbWeeks" PropertyName="SelectedValue" Name="WeekId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TSEntryID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UserID" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="TSDate"></asp:Parameter>
            <asp:Parameter Name="WorkHours" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="VacationHours" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="SickHours" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="HolidayHours" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="TotalHours" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="IsAdjustment" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Notes" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsEEBalances" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_EE_Balances" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="cmbEE" PropertyName="SelectedValue" Name="UserID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

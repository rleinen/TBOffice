<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Timesheet3.aspx.cs" Inherits="TBOffice.Employee.Timesheet3" %>

<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header-table{margin:10px; border-collapse:collapse;}
        .header-row {font-family:Tahoma; background-color:#dfdfdf}
        .header-row td {padding:3px;}
        .header-label {padding-left:10px; padding-right:50px; font-weight:bold; color:navy;}
        .label {color:maroon;}
        .label2 {color:maroon;margin-left:20px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;" class="header-table">
        <tr class="header-row">
            <td>
                <asp:Label ID="Label3" runat="server" Text="Employee Timesheet" CssClass="header-label"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Employee: " CssClass="label"></asp:Label>
                <cc1:OboutDropDownList ID="ddlEE" runat="server" DataSourceID="dsEEList" DataTextField="DisplayName" DataValueField="UserID" AutoPostBack="True"  
                    FolderStyle="styles//dropdownlist/black_glass/OboutDropDownList" Width="200px"></cc1:OboutDropDownList>
                <span style="width:10px;"></span>
                <asp:Label ID="Label2" runat="server" Text="Week: " CssClass="label2"></asp:Label>
                <cc1:OboutDropDownList ID="ddlWeeks" runat="server"  DataSourceID="dsWeeks" DataTextField="Year-Week" DataValueField="WeekID" 
                    AutoPostBack="True" Width="300px" Height="400px"></cc1:OboutDropDownList>               
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td>

                <asp:GridView ID="GridView1" runat="server" DataSourceID="dsTSEntry" AutoGenerateColumns="False" DataKeyNames="TSEntryID"
                    Font-Names='"Courier New",Courier,monospace'
                    CellPadding="4" ShowFooter="true" OnRowDataBound="GridView1_RowDataBound" OnRowUpdated="GridView1_RowUpdated" ForeColor="#333333" GridLines="Both">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="TSEntryID" HeaderText="TSEntryID" ReadOnly="True" InsertVisible="False" SortExpression="TSEntryID" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="TSDate" HeaderText="Date" SortExpression="TSDate" DataFormatString="{0:ddd (M/dd)}" ReadOnly="true">
                            <ItemStyle HorizontalAlign="Right" Width="120"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Work" SortExpression="WorkHours">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("WorkHours") %>' ID="TextBox1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("WorkHours", "{0:f1}") %>' ID="Label1"></asp:Label>
                            </ItemTemplate>

                            <ControlStyle Width="70px"></ControlStyle>

                            <ItemStyle HorizontalAlign="Center" Width="70px"></ItemStyle>
                        </asp:TemplateField>

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
                            <ItemStyle HorizontalAlign="Left" Width="350"></ItemStyle>
                            <ControlStyle Width="250" />
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True" ItemStyle-Width="50"></asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#dfdfdf"></EditRowStyle>

                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" HorizontalAlign="Center" Font-Bold="true"></FooterStyle>

                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#284775"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td>
                <asp:DetailsView ID="dvEEBalance" runat="server" Height="50px" Width="213px" DataSourceID="dsEEBalances" AutoGenerateRows="False" Font-Names='"Courier New",Courier,monospace'
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Both">
                    <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></EditRowStyle>
                    <Fields>
                        <asp:BoundField DataField="WorkBalance" HeaderText="Work Balance" SortExpression="WorkBalance" DataFormatString="{0:f1}" ItemStyle-HorizontalAlign="Right">
                            <ControlStyle Font-Bold="True" ForeColor="#CC0000"></ControlStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="VacBalance" HeaderText="Vac Balance" SortExpression="VacBalance" DataFormatString="{0:f1}" ItemStyle-HorizontalAlign="Right"></asp:BoundField>
                        <asp:BoundField DataField="SickBalance" HeaderText="Sick Balance" SortExpression="SickBalance" DataFormatString="{0:f1}" ItemStyle-HorizontalAlign="Right"></asp:BoundField>

                    </Fields>
                    <FooterStyle BackColor="White" ForeColor="#333333"></FooterStyle>

                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#336666"></PagerStyle>

                    <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>
                </asp:DetailsView>
            </td>
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
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserId" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlWeeks" PropertyName="SelectedValue" Name="WeekId" Type="Int32"></asp:ControlParameter>
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
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

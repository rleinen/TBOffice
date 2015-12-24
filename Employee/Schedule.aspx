<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" MaintainScrollPositionOnPostback="true" 
    AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="TBOffice.Employee.Schedule" %>
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

    <table style="width: 99%;" class="header-table">
        <tr class="header-row">
            <td>
                <asp:Label ID="Label3" runat="server" Text="Employee Schedule" CssClass="header-label"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Week: " CssClass="label2"></asp:Label>
                <asp:DropDownList ID="ddlWeeks" runat="server"  DataSourceID="dsWeeks" DataTextField="Year-Week" DataValueField="WeekID" 
                    AutoPostBack="True" Width="300px" OnDataBound="ddlWeeks_DataBound"></asp:DropDownList>    
                           
            </td>
        </tr>
        <tr><td></td></tr>
        <tr>
            <td>


<%--                <asp:GridView ID="GridView1" runat="server" DataSourceID="dsTSEntry" AutoGenerateColumns="False" DataKeyNames="TSEntryID"
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
                </asp:GridView>--%>

                <asp:GridView ID="gridSchedule" runat="server" AutoGenerateColumns="False" DataKeyNames="ScheduleId" DataSourceID="dsSchedule" 
                    CellPadding="4" ForeColor="#333333" GridLines="Both">

                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="DisplayName" HeaderText="Name" ReadOnly="True" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="ScheduleId" HeaderText="ScheduleId" ReadOnly="True" InsertVisible="False" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="MonHours" HeaderText="Monday" ItemStyle-Width="125"></asp:BoundField>
                        <asp:BoundField DataField="TueHours" HeaderText="Tuesday" ItemStyle-Width="125"></asp:BoundField>
                        <asp:BoundField DataField="WedHours" HeaderText="Wednesday" ItemStyle-Width="125"></asp:BoundField>
                        <asp:BoundField DataField="ThuHours" HeaderText="Thursday" ItemStyle-Width="125"></asp:BoundField>
                        <asp:BoundField DataField="FriHours" HeaderText="Friday" ItemStyle-Width="125"></asp:BoundField>
                        <%--<asp:BoundField DataField="SatHours" HeaderText="Saturday" ItemStyle-Width="125"></asp:BoundField>--%>
                        <asp:BoundField DataField="SunHours" HeaderText="Sunday" ItemStyle-Width="125"></asp:BoundField>
                        <asp:CommandField ShowEditButton="True" ItemStyle-Width="75"></asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>
                    <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                </asp:GridView>

            </td>
        </tr>



    </table>

    <asp:SqlDataSource ID="dsWeeks" runat="server" ConnectionString="<%$ ConnectionStrings:TBBF %>" 
        SelectCommand="SELECT TOP 60 [WeekID], ' ' + datename(m,[BegDate]) + '-' + datename(d,[BegDate]) + ' to ' + datename(m,[EndDate]) + '-' + datename(d,[EndDate]) + ' -- ' + datename(year,[BegDate]) + ' (' + cast([WeekNum] AS varchar(3)) + ')' AS [Year-Week], [begdate], [enddate] FROM [tblWeeks] WHERE [begdate] >= dateadd(year,-1,getdate())"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSchedule" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_tblSchedule" SelectCommandType="StoredProcedure" UpdateCommand="upd_tblSchedule" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlWeeks" PropertyName="SelectedValue" Name="WeekId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ScheduleId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="EmailTo" Type="String"></asp:Parameter>
            <asp:Parameter Name="MonHours" Type="String"></asp:Parameter>
            <asp:Parameter Name="TueHours" Type="String"></asp:Parameter>
            <asp:Parameter Name="WedHours" Type="String"></asp:Parameter>
            <asp:Parameter Name="ThuHours" Type="String"></asp:Parameter>
            <asp:Parameter Name="FriHours" Type="String"></asp:Parameter>
            <%--<asp:Parameter Name="SatHours" Type="String"></asp:Parameter>--%>
            <asp:Parameter Name="SunHours" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

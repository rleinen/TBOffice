<%@ Page Title="Attendance" Language="C#" MasterPageFile="~/Main.Master" MaintainScrollPositionOnPostback="true" 
    AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="TBOffice.Metrics.Attendance" %>

<%@ Register Assembly="ControlExtensions" Namespace="Grids" TagPrefix="cc1" %>

<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            
        }
        .header-table{margin:10px; border-collapse:collapse; width: 975px; border: 1px solid #000000;}
        .header-row {font-family:Tahoma; background-color:#dfdfdf}
        .header-row td {padding:3px;}
        .header-label {padding-left:10px; padding-right:50px; font-weight:bold; color:navy;}
        .label {color:maroon;}
        .label2 {color:maroon;margin-left:20px;}
        .grid1-cell{padding:10px; vertical-align:top;}
        .grid2-cell{padding:10px; vertical-align:top; text-align:left;}
        .hide{display:none;}
    </style>

        <script src="../Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table class="header-table">

        <tr class="header-row">
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Attendance By Service" CssClass="header-label"></asp:Label>
                    <Spc:SpacerImage ID="SpacerImage2" runat="server" Width="100px" />
                <asp:Label ID="Label1" runat="server" Text="Service: "></asp:Label>
                    <Spc:SpacerImage ID="SpacerImage1" runat="server" Width="10px" />
                <asp:DropDownList ID="ddlService" runat="server" 
                    DataSourceID="dsServices" DataTextField="ServiceDesc" DataValueField="ServiceID" AutoPostBack="true">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="grid1-cell">
                <asp:GridView ID="gridAttendance" runat="server" DataSourceID="dsAttendanceList"
                    AutoGenerateColumns="False" DataKeyNames="ServiceAttendanceId" GridLines="Both"
                    CellPadding="4" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="ServiceAttendanceID" ReadOnly="True" InsertVisible="False" 
                            ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide"></asp:BoundField>
                        <asp:BoundField DataField="ServiceID" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide"></asp:BoundField>
                        <asp:TemplateField HeaderText="Date" SortExpression="SundayID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlSundayEdit" runat="server" DataSourceID="dsSundayList" Width="90px"
                                    DataTextField="SunDate" DataValueField="SundayID" SelectedValue='<%# Bind("SundayID") %>'
                                    DataTextFormatString="{0:MM/dd/yy}">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("SunDate","{0:MM/dd/yy}") %>' ID="Label1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="100px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HeadCount" HeaderText="Heads" SortExpression="HeadCount">
                            <HeaderStyle Width="50px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CardCount" HeaderText="Cards" SortExpression="CardCount">
                            <HeaderStyle Width="50px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CardPct" HeaderText="Card %" SortExpression="CardPct" 
                            ReadOnly="true" DataFormatString="{0:P0}">
                            <HeaderStyle Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AdultSSCount" HeaderText="Adult SS" SortExpression="AdultSSCount">
                            <HeaderStyle Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ChildSSCount" HeaderText="Child SS" SortExpression="ChildSSCount">
                            <HeaderStyle Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="YouthSSCount" HeaderText="Youth SS" SortExpression="YouthSSCount">
                            <HeaderStyle Width="62px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ParkingCount" HeaderText="Parking" SortExpression="ParkingCount">
                            <HeaderStyle Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <HeaderTemplate>
                                <asp:LinkButton runat="server" Text="Add New" CommandName="Insert" CausesValidation="False" ID="btnInsert" OnClick="btnInsert_Click"></asp:LinkButton>
                            </HeaderTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;
                                <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="100px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                    </Columns>

                    <Columns>
                    </Columns>
                    <EditRowStyle BackColor="#999999"></EditRowStyle>

                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </td>
            <td class="grid2-cell">
                <asp:DetailsView ID="dvAttendance" runat="server" AutoGenerateRows="False"
                    DataKeyNames="ServiceAttendanceID" DataSourceID="dsAttendanceEntry" OnItemInserting="dvAttendance_ItemInserting"
                    CellPadding="2" ForeColor="#333333" GridLines="Both">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True"></CommandRowStyle>

                    <EditRowStyle BackColor="#999999"></EditRowStyle>

                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True"></FieldHeaderStyle>
                    <Fields>
                        <asp:TemplateField HeaderText="Date" SortExpression="SundayID">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlSundayInsert" runat="server" DataSourceID="dsSundayList"
                                    DataTextField="SunDate" DataValueField="SundayID" SelectedValue='<%# Bind("SundayID") %>'
                                    DataTextFormatString="{0:MM/dd/yy}">
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("SundayID") %>' ID="Label1"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Service" SortExpression="ServiceID">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlServiceInsert" runat="server" DataSourceID="dsServices"
                                    DataTextField="ServiceDesc" DataValueField="ServiceID" SelectedValue='<%# Bind("ServiceID") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("ServiceID") %>' ID="Label2"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HeadCount" HeaderText="Heads" SortExpression="HeadCount"></asp:BoundField>
                        <asp:BoundField DataField="CardCount" HeaderText="Cards" SortExpression="CardCount"></asp:BoundField>
                        <asp:BoundField DataField="CardPct" HeaderText="CardCount" SortExpression="CardCount" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="AdultSSCount" HeaderText="Adult SS" SortExpression="AdultSSCount"></asp:BoundField>
                        <asp:BoundField DataField="ChildSSCount" HeaderText="Child SS" SortExpression="ChildSSCount"></asp:BoundField>
                        <asp:BoundField DataField="YouthSSCount" HeaderText="Youth SS" SortExpression="YouthSSCount"></asp:BoundField>
                        <asp:BoundField DataField="ParkingCount" HeaderText="Parking" SortExpression="ParkingCount"></asp:BoundField>
                        <asp:CommandField ShowInsertButton="True"></asp:CommandField>
                    </Fields>

                    <Fields>
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                </asp:DetailsView>
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="dsSundayList" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [SundayID], [SunDate] FROM [tblSundays] ORDER BY [SunDate] DESC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsServices" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="	SELECT s.[ServiceID], c.CongregationDesc + ' (' + s.ServiceCode + ')' AS [ServiceDesc]
	FROM   tblServices s INNER JOIN tblCongregations c ON s.congregationid = c.congregationid
	order by c.CongregationDesc ASC, s.serviceid asc"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsAttendanceList" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_tblServiceAttendance_byService" SelectCommandType="StoredProcedure" UpdateCommand="upd_tblServiceAttendance" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlService" PropertyName="SelectedValue" Name="ServiceID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ServiceAttendanceID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="SundayID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ServiceID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="HeadCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="CardCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="CardPct" Type="Double"></asp:Parameter>
            <asp:Parameter Name="AdultSSCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="ChildSSCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="YouthSSCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="ParkingCount" Type="Int16"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsAttendanceEntry" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>'
        InsertCommand="ins_tblServiceAttendance" InsertCommandType="StoredProcedure" 
        SelectCommand="get_tblServiceAttendance" SelectCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="SundayID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ServiceID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="HeadCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="CardCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="CardPct" Type="Double"></asp:Parameter>
            <asp:Parameter Name="AdultSSCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="ChildSSCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="YouthSSCount" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="ParkingCount" Type="Int16"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="ServiceAttendanceID" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>

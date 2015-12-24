<%@ Page Title="User Mgmt" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="TBOffice.Admin.User" %>
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
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <table style="width: 100%;" class="header-table">
        <tr class="header-row">
            <td>
                <asp:Label ID="Label3" runat="server" Text="User Management" CssClass="header-label"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="User Name: " CssClass="label"></asp:Label>
                <cc1:OboutDropDownList ID="ddlEE" runat="server" DataSourceID="dsEEList" DataTextField="DisplayName" DataValueField="UserID" AutoPostBack="True"  
                    FolderStyle="styles//dropdownlist/black_glass/OboutDropDownList" Width="200px" Height="600px"></cc1:OboutDropDownList>
                <span style="width:10px;"></span>
                <asp:Button ID="btnNewUser" runat="server" Text="Add User" OnClick="btnNewUser_Click" />
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:500px; vertical-align:top;">

                <ajaxToolkit:TabContainer ID="TabContainer1" runat="server">
                    <ajaxToolkit:TabPanel HeaderText="User Profile" ID="tabProfile" runat="server" ScrollBars="Auto">
                        <ContentTemplate>
                            <asp:DetailsView ID="dvUser" runat="server" 
                                Height="50px" Width="98%" 
                                BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                                CellPadding="3" CellSpacing="1" GridLines="None" 
                                AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="dsUser">
                                
                                <EditRowStyle BackColor="#DEDFDE" ForeColor="Black"></EditRowStyle>

                                <Fields>
                                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ItemStyle-HorizontalAlign="Right"></asp:CommandField>

                                    <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="True" InsertVisible="False" SortExpression="UserID"></asp:BoundField>
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName"></asp:BoundField>
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName"></asp:BoundField>
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName"></asp:BoundField>
                                    <asp:BoundField DataField="DisplayName" HeaderText="Display Name" ReadOnly="True" SortExpression="DisplayName"></asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email" ControlStyle-Width="275"></asp:BoundField>
                                    <asp:CheckBoxField DataField="IsEmployee" HeaderText="Employee?" SortExpression="IsEmployee"></asp:CheckBoxField>
                                    <asp:CheckBoxField DataField="IsFullTime" HeaderText="Full Time?" SortExpression="IsFullTime"></asp:CheckBoxField>
                                    <asp:CheckBoxField DataField="IsExempt" HeaderText="Exempt?" SortExpression="IsExempt"></asp:CheckBoxField>
                                    <asp:CheckBoxField DataField="IsEnabled" HeaderText="Enabled?" SortExpression="IsEnabled"></asp:CheckBoxField>
                                    <asp:TemplateField HeaderText="Employee Type">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlEETypeEdit" runat="server"
                                                DataSourceID="dsEEType" DataTextField="ShortDesc" DataValueField="EETypeId" SelectedValue='<%# Bind("EETypeID") %>' 
                                                Width="200px" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlEETypeIns" runat="server"
                                                DataSourceID="dsEEType" DataTextField="ShortDesc" DataValueField="EETypeId" SelectedValue='<%# Bind("EETypeID") %>' 
                                                Width="200px" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("EETypeDesc") %>' ID="labEEType"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Employee Category">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlEECategoryEdit" runat="server"
                                                DataSourceID="dsEECategory" DataTextField="ShortDesc" DataValueField="EECategoryId" SelectedValue='<%# Bind("EECategoryID") %>' 
                                                Width="200px" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlEECategoryIns" runat="server"
                                                DataSourceID="dsEECategory" DataTextField="ShortDesc" DataValueField="EECategoryId" SelectedValue='<%# Bind("EECategoryID") %>' 
                                                Width="200px" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("EECategoryDesc") %>' ID="labEECategory"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Start Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtStartDateEdit" runat="server" Width="100px" Text='<%# Bind("StartDate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calStartDate" runat="server" 
                                                TargetControlID="txtStartDateEdit" SelectedDate='<%# Convert.IsDBNull(Eval("StartDate")) ? null : Eval("StartDate") %>'></ajaxToolkit:CalendarExtender>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="txtStartDateIns" runat="server" Width="100px" Text='<%# Bind("StartDate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calStartDate" runat="server" 
                                                TargetControlID="txtStartDateIns"></ajaxToolkit:CalendarExtender>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="labStartDate" runat="server" Width="100px" Text='<%# Eval("StartDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Term Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtTermDateEdit" runat="server" Width="100px" Text='<%# Convert.IsDBNull(Eval("TermDate")) ? null : Eval("TermDate") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calTermDate" runat="server" 
                                                TargetControlID="txtTermDateEdit"></ajaxToolkit:CalendarExtender>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="txtTermDateIns" runat="server" Width="100px" Text='<%# Bind("TermDate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calTermDate" runat="server" 
                                                TargetControlID="txtTermDateIns"></ajaxToolkit:CalendarExtender>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="labTermDate" runat="server" Width="100px" Text='<%# Eval("TermDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="MinHours" HeaderText="Min Hours" ControlStyle-Width="50"></asp:BoundField>
                                    <asp:BoundField DataField="MaxHours" HeaderText="Max Hours" ControlStyle-Width="50"></asp:BoundField>
                                    <asp:TemplateField HeaderText="F/T Start Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtFTStartDateEdit" runat="server" Width="100px" Text='<%# Convert.IsDBNull(Eval("FTStartDate")) ? null : Eval("FTStartDate") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calFTStartDate" runat="server" 
                                                TargetControlID="txtFTStartDateEdit"></ajaxToolkit:CalendarExtender>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="txtFTStartDateIns" runat="server" Width="100px" Text='<%# Bind("FTStartDate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calFTStartDate" runat="server" 
                                                TargetControlID="txtFTStartDateIns"></ajaxToolkit:CalendarExtender>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="labFTStartDate" runat="server" Width="100px" Text='<%# Eval("FTStartDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="AnnualVacHours" HeaderText="Annual Vacation" ControlStyle-Width="50"></asp:BoundField>
                                    <asp:BoundField DataField="CapVacHours" HeaderText="Vacation Cap" ControlStyle-Width="50"></asp:BoundField>
                                    <asp:BoundField DataField="PerPPVacHours" HeaderText="Per PP Vacation" ControlStyle-Width="50"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Next Tier Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtNextTierDateEdit" runat="server" Width="100px" Text='<%# Convert.IsDBNull(Eval("NextTierDate")) ? null : Eval("NextTierDate") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calNextTierDate" runat="server" 
                                                TargetControlID="txtNextTierDateEdit"></ajaxToolkit:CalendarExtender>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="txtNextTierDateIns" runat="server" Width="100px" Text='<%# Bind("NextTierDate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calNextTierDate" runat="server" 
                                                TargetControlID="txtNextTierDateIns"></ajaxToolkit:CalendarExtender>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="labNextTierDate" runat="server" Width="100px" Text='<%# Eval("NextTierDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Last Pay Period">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlLPPEdit" runat="server"
                                                DataSourceID="dsPayPeriod" DataTextField="PayDate" DataValueField="PayPeriodId" SelectedValue='<%# Bind("LastPayPeriodId") %>' 
                                                Width="100px" AppendDataBoundItems="true">
                                                <asp:ListItem Text="Unspecified" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlLPPIns" runat="server"
                                                DataSourceID="dsPayPeriod" DataTextField="PayDate" DataValueField="PayPeriodId" SelectedValue='<%# Bind("LastPayPeriodId") %>' 
                                                Width="100px" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("LastPayDate") %>' ID="labEEType"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Fields>

                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black"></FooterStyle>

                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF"></HeaderStyle>

                                <FieldHeaderStyle Width="35%" />

                                <PagerStyle HorizontalAlign="Right" BackColor="#C6C3C6" ForeColor="Black"></PagerStyle>

                                <RowStyle BackColor="#DEDFDE" ForeColor="Black"></RowStyle>
                            </asp:DetailsView>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                </ajaxToolkit:TabContainer>

                        </td>
                        <td style="width:500px; vertical-align:top;">

                <ajaxToolkit:TabContainer ID="TabContainer2" runat="server" Height="600px">
                    <ajaxToolkit:TabPanel HeaderText="Role Assignment" ID="TabPanel2" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gvUserRoles" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" AutoGenerateColumns="False" DataKeyNames="RoleID" DataSourceID="dsUserRoles" ShowFooter="true">
                                <Columns>
                                    <asp:BoundField DataField="RoleID" HeaderText="RoleID" ReadOnly="True" Visible="false" InsertVisible="False" SortExpression="RoleID"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Role Name" SortExpression="RoleName">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("RoleName") %>' ID="Label1"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="200px"></ItemStyle>
                                        
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlRole" runat="server" DataSourceID="dsRoles" Width="175" 
                                                DataTextField="RoleName" DataValueField="RoleID" AppendDataBoundItems="true">
                                                <asp:ListItem Selected="True" Text="Select Role" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </FooterTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Remove" CommandName="Delete" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="btnInsertRole" runat="server" OnClick="btnInsertRole_Click">Add Role</asp:LinkButton>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <EmptyDataTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlRole" runat="server" DataSourceID="dsRoles" Width="175" 
                                                    DataTextField="RoleName" DataValueField="RoleID" AppendDataBoundItems="true">
                                                    <asp:ListItem Selected="True" Text="Select Role" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnInsertRole" runat="server" OnClick="btnInsertRole_Click2">Add Role</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
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

                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel HeaderText="Compensation History" ID="TabPanel8" runat="server">
                        <ContentTemplate></ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel HeaderText="Vacation Allotment" ID="TabPanel9" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gvVacationAllotment" runat="server" BackColor="White" BorderColor="#CC9966" ShowFooter="true" 
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="TSEntryID" DataSourceID="dsVacation">
                                <Columns>
                                    <asp:BoundField DataField="TSEntryID" HeaderText="TSEntryID" ReadOnly="True" InsertVisible="False" Visible="false"></asp:BoundField>
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Date" SortExpression="TSDate" HeaderStyle-Width="140px"
                                        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtVacAllotDateEdit" runat="server" Text='<%# Bind("TSDate") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalVacAllot" runat="server" TargetControlID="txtVacAllotDateEdit"></ajaxToolkit:CalendarExtender>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TSDate","{0:MM/dd/yyyy}") %>' ID="lblVacAllotDate"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtVacAllotDateIns" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalVacAllot" runat="server" TargetControlID="txtVacAllotDateIns"></ajaxToolkit:CalendarExtender>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Vacation" SortExpression="VacationHours" HeaderStyle-Width="140px"
                                        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("VacationHours") %>' ID="txtVacAllotEdit"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("VacationHours") %>' ID="lblVacAllot"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtVacAllotIns" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False" HeaderStyle-Width="150px"
                                        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="btnAddVacAllotment" runat="server" OnClick="btnAddVacAllotment_Click">Add Vacation</asp:LinkButton>
                                        </FooterTemplate>
                                    </asp:TemplateField>

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

                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                </ajaxToolkit:TabContainer>


                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="dsEEList" runat="server" ConnectionString="<%$ ConnectionStrings:TBBF %>" 
    SelectCommand="SELECT UserID, DisplayName FROM secUsers ORDER BY FirstName, LastName"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsUser" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        InsertCommand="ins_secUsers" InsertCommandType="StoredProcedure" 
        SelectCommand="get_secUsers" SelectCommandType="StoredProcedure" 
        UpdateCommand="upd_secUsers" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="IsEmployee" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="IsFullTime" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="IsExempt" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="EETypeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="EECategoryID" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="StartDate"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="TermDate"></asp:Parameter>
            <asp:Parameter Name="MinHours" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="MaxHours" Type="Byte"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="FTStartDate"></asp:Parameter>
            <asp:Parameter Name="AnnualVacHours" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="CapVacHours" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="PerPPVacHours" Type="Decimal"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="NextTierDate"></asp:Parameter>
            <asp:Parameter Name="LastPayPeriodId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="IsEnabled" Type="Boolean"></asp:Parameter>

        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="IsEmployee" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="IsFullTime" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="IsExempt" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="EETypeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="EECategoryID" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="StartDate"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="TermDate"></asp:Parameter>
            <asp:Parameter Name="MinHours" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="MaxHours" Type="Byte"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="FTStartDate"></asp:Parameter>
            <asp:Parameter Name="AnnualVacHours" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="CapVacHours" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="PerPPVacHours" Type="Decimal"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="NextTierDate"></asp:Parameter>
            <asp:Parameter Name="LastPayPeriodId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="IsEnabled" Type="Boolean"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsEEType" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="SELECT [ShortDesc], [EETypeID] FROM [tblEEType] ORDER BY [ShortDesc] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsEECategory" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="SELECT [ShortDesc], [EECategoryID] FROM [tblEECategory] ORDER BY [ShortDesc]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsPayPeriod" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="SELECT [PayPeriodId], convert(varchar,[PayDate],101) AS [PayDate] FROM [tblPayPeriod] ORDER BY [PayPeriodId] DESC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsUserRoles" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' DeleteCommand="del_secUserRoles" DeleteCommandType="StoredProcedure" InsertCommand="ins_secUserRoles" InsertCommandType="StoredProcedure" SelectCommand="get_secUserRoles" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserID" Type="Int32"></asp:ControlParameter>
            <asp:Parameter Name="RoleID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="RoleID" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsRoles" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [RoleID], [RoleName] FROM [secRoles] ORDER BY [RoleID]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsVacation" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' DeleteCommand="del_VacationAllotments" DeleteCommandType="StoredProcedure" InsertCommand="ins_VacationAllotments" InsertCommandType="StoredProcedure" SelectCommand="get_VacationAllotments" SelectCommandType="StoredProcedure" UpdateCommand="upd_VacationAllotments" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="TSEntryID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserID" Type="Int32"></asp:ControlParameter>
            <asp:Parameter DbType="Date" Name="TSDate"></asp:Parameter>
            <asp:Parameter Name="VacationHours" Type="Decimal"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TSEntryID" Type="Int32"></asp:Parameter>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserID" Type="Int32"></asp:ControlParameter>
            <asp:Parameter DbType="Date" Name="TSDate"></asp:Parameter>
            <asp:Parameter Name="VacationHours" Type="Decimal"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

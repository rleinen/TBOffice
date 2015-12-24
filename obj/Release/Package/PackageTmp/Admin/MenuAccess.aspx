<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MenuAccess.aspx.cs" Inherits="TBOffice.Admin.MenuAccess" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc2" %>

<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header-table{margin:10px; border-collapse:collapse;}
        .header-row {font-family:Tahoma; background-color:#dfdfdf}
        .header-row td {padding:3px;}
        .header-label {padding-left:10px; padding-right:50px; font-weight:bold; color:navy;}
        .label {color:maroon;}
        .label2 {color:maroon;margin-left:20px;}
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;" class="header-table">
        <tr class="header-row">
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Menu Access" CssClass="header-label"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="User Role: " CssClass="label"></asp:Label>
                <cc1:OboutDropDownList ID="ddlEE" runat="server" DataSourceID="dsRoleList" DataTextField="RoleName" DataValueField="RoleID" AutoPostBack="True"  
                    FolderStyle="styles//dropdownlist/black_glass/OboutDropDownList" Width="200px"></cc1:OboutDropDownList>
            </td>
        </tr>
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr>
            <td width="500px" style="vertical-align:top;">
                <asp:GridView ID="GridView1" runat="server" DataSourceID="dsMenu" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" DataKeyNames="MenuId">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="MenuID" HeaderText="ID" SortExpression="MenuID" ItemStyle-Width="50px"></asp:BoundField>
                        <asp:BoundField DataField="MenuDesc" HeaderText="Menu Name" SortExpression="ShortDesc" ItemStyle-Width="150px"></asp:BoundField>
                        <asp:BoundField DataField="NavigateUrl" HeaderText="Navigate Url" SortExpression="NavigateUrl" ItemStyle-Width="200px"></asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
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
            <td style="vertical-align:top">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="450px" DataSourceID="dsMenuIns"  HeaderText="Add Menu Access"
                    AutoGenerateRows="False" DefaultMode="Insert" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemInserted="DetailsView1_ItemInserted">

                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True"></CommandRowStyle>

                    <EditRowStyle BackColor="#999999"></EditRowStyle>

                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="150px"></FieldHeaderStyle>
                    <Fields>
                        <asp:TemplateField HeaderText="Menu Item">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlMenuIns" runat="server"
                                    DataSourceID="dsMenuList" DataTextField="MenuDesc" DataValueField="MenuId" SelectedValue='<%# Bind("MenuId") %>' Width="350px">
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" ItemStyle-HorizontalAlign="Right"></asp:CommandField>
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right"></FooterStyle>

                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                </asp:DetailsView>
                
                <br />
                <table cellpadding="0" cellspacing="0" class="width:450px">
                    <tr>
                        <td style="background-color:#5D7B9D; font-weight:bold; color:white; text-align:center; width:450px"><asp:Label ID="Label2" runat="server" Text="Modify or Insert Menu Item"></asp:Label></td>
                    </tr>
                    <tr>
                        <td  style="background-color:#5D7B9D; font-weight:bold; color:white; text-align:right; width:445px; padding-right:5px;">
                            <asp:DropDownList ID="ddlMenuItemSelect" runat="server" DataSourceID="dsMenuList" DataTextField="MenuDesc" DataValueField="MenuId" Width="313px" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>
                </table>

                <asp:DetailsView ID="DetailsView2" runat="server" Width="450px" DataSourceID="dsMenuItem" DataKeyNames="MenuId" OnItemUpdated="DetailsView2_ItemUpdated"
                    CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateRows="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True"></CommandRowStyle>

                    <EditRowStyle BackColor="#999999"></EditRowStyle>


                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="125px"></FieldHeaderStyle>
                    <Fields>
                        <asp:BoundField DataField="MenuID" HeaderText="Menu ID" ReadOnly="False" SortExpression="MenuID"></asp:BoundField>
                        <asp:TemplateField HeaderText="Parent Menu" SortExpression="ParentMenuID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlParentMenuEdit" runat="server"
                                    DataSourceID="dsParentMenuList" DataTextField="ShortDesc" DataValueField="MenuId" SelectedValue='<%# Bind("ParentMenuID") %>' Width="300px" AppendDataBoundItems="true">
                                    <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlParentMenuIns" runat="server"
                                    DataSourceID="dsParentMenuList" DataTextField="ShortDesc" DataValueField="MenuId" SelectedValue='<%# Bind("ParentMenuID") %>' Width="300px" AppendDataBoundItems="true">
                                    <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("ParentDesc") %>' ID="Label1"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="ShortDesc" HeaderText="ShortDesc" SortExpression="ShortDesc" ControlStyle-Width="297px"></asp:BoundField>
                        <asp:BoundField DataField="NavigateUrl" HeaderText="NavigateUrl" SortExpression="NavigateUrl" ControlStyle-Width="297px"></asp:BoundField>
                        <asp:BoundField DataField="ImageUrl" HeaderText="ImageUrl" SortExpression="ImageUrl" ControlStyle-Width="297px"></asp:BoundField>
                        <asp:BoundField DataField="Target" HeaderText="Target" SortExpression="Target" ControlStyle-Width="297px"></asp:BoundField>
                        <asp:CheckBoxField DataField="Enabled" HeaderText="Enabled" SortExpression="Enabled"></asp:CheckBoxField>
                        <asp:CommandField ShowInsertButton="True" ShowEditButton="True"></asp:CommandField>
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                </asp:DetailsView>
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="dsMenuItem" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>'
        InsertCommand="INSERT INTO [secMenu] ([MenuID], [ParentMenuID], [ShortDesc], [NavigateUrl], [ImageUrl], [Target], [Enabled]) 
                        VALUES (@MenuID, @ParentMenuID, @ShortDesc, @NavigateUrl, @ImageUrl, @Target, @Enabled)"
        SelectCommand="SELECT m.MenuID, m.ParentMenuID, m.ShortDesc, m.NavigateUrl, m.ImageUrl, m.Target, m.Enabled, pm.ShortDesc AS ParentDesc FROM secMenu AS m LEFT OUTER JOIN secMenu AS pm ON m.ParentMenuID = pm.MenuID WHERE (m.MenuID = @MenuID)"
        UpdateCommand="UPDATE [secMenu] SET [ParentMenuID] = @ParentMenuID, [ShortDesc] = @ShortDesc, [NavigateUrl] = @NavigateUrl, [ImageUrl] = @ImageUrl, [Target] = @Target, [Enabled] = @Enabled 
                        WHERE [MenuID] = @MenuID">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMenuItemSelect" PropertyName="SelectedValue" Name="MenuID"></asp:ControlParameter>
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="MenuID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ParentMenuID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ShortDesc" Type="String"></asp:Parameter>
            <asp:Parameter Name="NavigateUrl" Type="String"></asp:Parameter>
            <asp:Parameter Name="ImageUrl" Type="String"></asp:Parameter>
            <asp:Parameter Name="Target" Type="String"></asp:Parameter>
            <asp:Parameter Name="Enabled" Type="Boolean"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ParentMenuID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ShortDesc" Type="String"></asp:Parameter>
            <asp:Parameter Name="NavigateUrl" Type="String"></asp:Parameter>
            <asp:Parameter Name="ImageUrl" Type="String"></asp:Parameter>
            <asp:Parameter Name="Target" Type="String"></asp:Parameter>
            <asp:Parameter Name="Enabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="MenuID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>    
    
    <asp:SqlDataSource ID="dsMenuList" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="SELECT 
	                        m.menuid,
	                        [MenuDesc] = CASE WHEN m.ParentMenuID IS NULL
				                         THEN '* ' + m.ShortDesc + ' *'
				                         ELSE m.ShortDesc + isnull(' (' + m.NavigateUrl + ')','') END
                        FROM [secMenu] m LEFT OUTER JOIN secMenu pm ON m.ParentMenuID = pm.MenuID 
                        ORDER BY m.MenuID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsParentMenuList" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="SELECT 
	                        m.menuid,
	                        m.shortdesc
                        FROM [secMenu] m WHERE m.ParentMenuID IS NULL 
                        ORDER BY m.MenuID">
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="dsMenuIns" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>'
        InsertCommand="ins_MenuRoles" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="MenuID"></asp:Parameter>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="RoleID"></asp:ControlParameter>
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsMenu" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>'
        DeleteCommand="del_MenuRoles"
        SelectCommand="SELECT 
                            secMenuRoles.MenuID, 
                            [MenuDesc] = CASE WHEN m.ParentMenuID IS NULL
				                         THEN '* ' + m.ShortDesc + ' *'
				                         ELSE m.ShortDesc END, 
                            m.NavigateUrl 
                        FROM secMenuRoles INNER JOIN secMenu m ON secMenuRoles.MenuID = m.MenuID 
                                          INNER JOIN secRoles ON secMenuRoles.RoldID = secRoles.RoleID
                                          LEFT OUTER JOIN secMenu pm ON m.ParentMenuID = pm.MenuID 
                        WHERE (secMenuRoles.RoldID = @RoleID) ORDER BY secMenuRoles.MenuID"
        DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="MenuID"></asp:Parameter>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="RoleID"></asp:ControlParameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="RoleID"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsRoleList" runat="server" ConnectionString="<%$ ConnectionStrings:TBBF %>"
        SelectCommand="SELECT [RoleID], [RoleName] FROM [secRoles] ORDER BY [RoleID]"></asp:SqlDataSource>

</asp:Content>

<%@ Page Title="Offerings" Language="C#" MasterPageFile="~/Main.Master" MaintainScrollPositionOnPostback="true" 
    AutoEventWireup="true" CodeBehind="Offerings.aspx.cs" Inherits="TBOffice.Metrics.Offerings" %>

<%@ Register Assembly="ControlExtensions" Namespace="Grids" TagPrefix="cc1" %>

<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            
        }
        .header-table{margin:10px; border-collapse:collapse; width: 950px; border: 1px solid #000000;}
        .header-row {font-family:Tahoma; background-color:#dfdfdf}
        .header-row td {padding:3px;}
        .header-label {padding-left:10px; padding-right:50px; font-weight:bold; color:navy;}
        .label {color:maroon;}
        .label2 {color:maroon;margin-left:20px;}
        .grid1-cell{padding:10px;}
        .grid2-cell{padding:10px; vertical-align:top; text-align:left;}
    </style>

        <script src="../Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table class="header-table">

        <tr class="header-row">
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Offerings By Service" CssClass="header-label"></asp:Label>
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
                <asp:GridView ID="gridOfferings" runat="server" DataSourceID="dsOfferingList"
                    AutoGenerateColumns="False" DataKeyNames="OfferingId"
                    CellPadding="4" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="OfferingID" HeaderText="OfferingID" 
                            ReadOnly="True" InsertVisible="False" SortExpression="OfferingID" Visible="false" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
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
                        <asp:TemplateField HeaderText="Service" SortExpression="ServiceID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlServiceEdit" runat="server" DataSourceID="dsServices" Width="170px"
                                    DataTextField="ServiceDesc" DataValueField="ServiceID" SelectedValue='<%# Bind("ServiceID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("ServiceDesc") %>' ID="Label2"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="180px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="General" SortExpression="GeneralAmt">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("GeneralAmt") %>' ID="TextBox3" Width="70px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("GeneralAmt", "{0:c}") %>' ID="Label3"></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="80px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Benevolence" SortExpression="BenevolentAmt">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("BenevolentAmt") %>' ID="TextBox1" Width="80px"></asp:TextBox>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("BenevolentAmt", "{0:c}") %>' ID="Label4"></asp:Label>

                            </ItemTemplate>
                            <HeaderStyle Width="100px"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderText="Missions" SortExpression="MissionsAmt">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("MissionsAmt") %>' ID="TextBox5" Width="70px"></asp:TextBox>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("MissionsAmt", "{0:c}") %>' ID="Label5"></asp:Label>

                            </ItemTemplate>
                            <HeaderStyle Width="80px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <HeaderTemplate>
                                <asp:LinkButton runat="server" Text="New Offering" CommandName="Insert" CausesValidation="False" ID="btnInsert" OnClick="btnInsert_Click"></asp:LinkButton>
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
                <asp:DetailsView ID="dvOffering" runat="server" Height="50px" Width="125px" AutoGenerateRows="False"
                    DataKeyNames="OfferingID" DataSourceID="dsOfferingEntry" 
                    CellPadding="4" ForeColor="#333333" GridLines="Both" OnItemInserted="dvOffering_ItemInserted">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True"></CommandRowStyle>

                    <EditRowStyle BackColor="#999999"></EditRowStyle>

                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True"></FieldHeaderStyle>
                    <Fields>
                        <asp:BoundField DataField="OfferingID" HeaderText="OfferingID" ReadOnly="True" InsertVisible="False" SortExpression="OfferingID"></asp:BoundField>
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
                        <asp:TemplateField HeaderText="General" SortExpression="GeneralAmt">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("GeneralAmt", "{0:N}") %>' ID="TextBox1"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("GeneralAmt", "{0:N0}") %>' ID="TextBox1"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("GeneralAmt", "{0:c}") %>' ID="Label3"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Benevol." SortExpression="BenevolentAmt">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("BenevolentAmt", "{0:N}") %>' ID="TextBox2"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("BenevolentAmt", "{0:N0}") %>' ID="TextBox2"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("BenevolentAmt", "{0:c}") %>' ID="Label4"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Missions" SortExpression="MissionsAmt">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("MissionsAmt", "{0:N}") %>' ID="TextBox3"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("MissionsAmt", "{0:N0}") %>' ID="TextBox3"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("MissionsAmt", "{0:c}") %>' ID="Label5"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" ShowInsertButton="True"></asp:CommandField>
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                </asp:DetailsView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="dsOfferingEntry" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        InsertCommand="ins_tblOfferings" InsertCommandType="StoredProcedure" 
        SelectCommand="get_tblOfferings" SelectCommandType="StoredProcedure" 
        UpdateCommand="upd_tblOfferings" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="SundayID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ServiceID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="GeneralAmt" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="BenevolentAmt" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="MissionsAmt" Type="Decimal"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gridOfferings" PropertyName="SelectedValue" Name="OfferingID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OfferingID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="SundayID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ServiceID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="GeneralAmt" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="BenevolentAmt" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="MissionsAmt" Type="Decimal"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSundayList" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="SELECT [SundayID], [SunDate] FROM [tblSundays] ORDER BY [SunDate] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsOfferingList" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="get_tblOfferings_byService" SelectCommandType="StoredProcedure"
        UpdateCommand="upd_tblOfferings" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlService" PropertyName="SelectedValue" Name="ServiceID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OfferingID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="SundayID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ServiceID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="GeneralAmt" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="BenevolentAmt" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="MissionsAmt" Type="Decimal"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsServices" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="	SELECT s.[ServiceID], c.CongregationDesc + ' (' + s.ServiceCode + ')' AS [ServiceDesc]
	FROM   tblServices s INNER JOIN tblCongregations c ON s.congregationid = c.congregationid
	order by c.CongregationDesc ASC, s.serviceid asc"></asp:SqlDataSource>


</asp:Content>

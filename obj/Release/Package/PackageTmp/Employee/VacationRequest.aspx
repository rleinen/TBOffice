<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="VacationRequest.aspx.cs" Inherits="TBOffice.Employee.VacationRequest" %>

<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 950px;
            font-family:Tahoma;
            font-size:12px;
            border-collapse: collapse;
            margin:10px;
            background-color:#DFDFDF;
        }
        .auto-style2 {
            width: 100%;
            border-collapse: collapse;
        }
        .auto-style3 {
            width: 75px;
            border-collapse: collapse;
        }
        .auto-style4 {
            width: 100%;
            border-collapse: collapse;
        }
        .header-label {padding-left:10px; padding-right:50px; font-weight:bold; color:navy; font-size:16px; text-align:center;}
        .label {color:maroon; font-weight:bold;}
        .label2 {color:maroon;margin-left:20px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>

    <table cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td style="width:70%;padding-top:10px;">
                <table cellpadding="0" class="auto-style2">
                    <tr>
                        <td class="auto-style3 header-label" rowspan="2">
                            <asp:Label ID="Label1" runat="server" Text="Vacation"></asp:Label><br />
                            <asp:Label ID="Label6" runat="server" Text="Time"></asp:Label>
                        </td>
                        <td>
                            <Spc:SpacerImage ID="SpacerImage4" runat="server" Width="20px" />
                            <asp:Label ID="Label2" runat="server" Text="Employee: " CssClass="label"></asp:Label>
                            <Spc:SpacerImage ID="SpacerImage1" runat="server" Width="5px" />
                            <asp:DropDownList ID="ddlEE" runat="server" Width="207px" DataSourceID="dsEEList" DataTextField="DisplayName" DataValueField="UserID" AutoPostBack="true">
                            </asp:DropDownList>
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Width="10px" />
                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" Width="80px" OnCommand="btnRefresh_Command" />
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Width="1px" />
                            <asp:Button ID="btnViewCal" runat="server" Text="Calendar" Width="80px" OnClick="btnViewCal_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Request From: " CssClass="label"></asp:Label>
                            <Spc:SpacerImage ID="SpacerImage5" runat="server" Width="3px" />
                            <asp:TextBox ID="txtDateFrom" runat="server" Width="75px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender runat="server" TargetControlID="txtDateFrom"></ajaxToolkit:CalendarExtender>
                            <Spc:SpacerImage ID="SpacerImage6" runat="server" Width="10px" />

                            <asp:Label ID="Label4" runat="server" Text="To: " CssClass="label"></asp:Label>
                            <Spc:SpacerImage ID="SpacerImage7" runat="server" Width="3px" />
                            <asp:TextBox ID="txtDateTo" runat="server" Width="75px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender runat="server" TargetControlID="txtDateTo"></ajaxToolkit:CalendarExtender>

                            <Spc:SpacerImage ID="SpacerImage8" runat="server" Width="10px" />
                            <asp:Button ID="btnRequest" runat="server" Text="Request" Width="80px" OnClick="btnRequest_Click" />
                            <Spc:SpacerImage ID="SpacerImage9" runat="server" Width="1px" />
                            <asp:Button ID="btnReset" runat="server" Text="Reset" Width="80px" OnClick="btnReset_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align:top;padding-top:10px;">
                <table cellpadding="0" class="auto-style4">
                    <tr>
                        <td colspan="2" style="text-align:center; padding-top:5px; font-size:16px; vertical-align:bottom;">
                            <asp:Label ID="Label5" runat="server" Text="Awaiting Approval" CssClass="label"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr><td style="background-color:wheat">&nbsp;</td><td style="background-color:wheat">&nbsp;</td></tr>
        <tr>
            <td style="text-align:center;padding:10px;vertical-align:top;">
                <asp:GridView ID="gridTOUserRequests" runat="server" AutoGenerateColumns="False" DataKeyNames="TORequestID" DataSourceID="dsTOFutureRequestsByUser" 
                    CellPadding="4" ForeColor="#333333" GridLines="Both">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="TORequestID" HeaderText="TORequestID" ReadOnly="True" InsertVisible="False" SortExpression="TORequestID" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="Day" HeaderText="Day" ReadOnly="True" SortExpression="Day"></asp:BoundField>
                        <asp:BoundField DataField="Vacation Date" HeaderText="Date" ReadOnly="True" SortExpression="Vacation Date"></asp:BoundField>
                        <asp:BoundField DataField="DisplayName" HeaderText="Requested" ReadOnly="True" SortExpression="DisplayName"></asp:BoundField>
                        <asp:BoundField DataField="ApprovalUserName" HeaderText="Approval By"></asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                    </Columns>
                    <EmptyDataTemplate> No reqeuests for selected user </EmptyDataTemplate>
                    <EmptyDataRowStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>

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
            <td style="text-align:center; padding:10px;">
                <asp:GridView ID="gridTORequestApprovals" runat="server" AutoGenerateColumns="False" DataKeyNames="TORequestID" 
                    DataSourceID="dsTORequestApprovals" CellPadding="4" ForeColor="#333333" GridLines="Both" OnRowCommand="gridTORequestApprovals_RowCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="TORequestID" HeaderText="TORequestID" ReadOnly="True" InsertVisible="False" SortExpression="TORequestID" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="Day" HeaderText="Day" ReadOnly="True"></asp:BoundField>
                        <asp:BoundField DataField="Vacation Date" HeaderText="Date" ReadOnly="True"></asp:BoundField>
                        <asp:BoundField DataField="DisplayName" HeaderText="Requested By" ReadOnly="True"></asp:BoundField>
                        <asp:ButtonField ButtonType="Link" CommandName="Approve" Text="Approve" />
                    </Columns>

                    <EmptyDataTemplate> No Pending Reqeuests </EmptyDataTemplate>
                    <EmptyDataRowStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
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
        </tr>
    </table>

    <%-- Datasources --%>

    <asp:SqlDataSource ID="dsEEList" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_EEAuthList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="UserId" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsTOFutureRequestsByUser" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' OnDeleted="dsTOFutureRequestsByUser_Deleted" 
        SelectCommand="get_TO_FutureRequests_ByUser" SelectCommandType="StoredProcedure" 
        DeleteCommand="DELETE FROM tblTORequest WHERE (TORequestID = @TORequestID)">
        
        <DeleteParameters>
            <asp:Parameter Name="TORequestID"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlEE" PropertyName="SelectedValue" Name="UserId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsTORequestApprovals" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        SelectCommand="get_TO_RequestApprovals" SelectCommandType="StoredProcedure" 
        UpdateCommand="approve_tblTORequest" UpdateCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="TORequestID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsRequestTO" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        InsertCommand="ins_tblTORequest" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="TOUserID" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="TODate"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>

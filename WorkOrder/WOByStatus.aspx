﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="WOByStatus.aspx.cs" Inherits="TBOffice.WorkOrder.WOByStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            
        }
        .header-table{margin:10px; border-collapse:collapse; width: 975px; border: 1px solid #000000;}
        .header-row {font-family:Tahoma; background-color:#dfdfdf}
        .header-row td {padding:3px;}
        .header-label {padding-left:10px; padding-right:0px; font-weight:bold; color:navy;}
        .label {color:maroon;}
        .label2 {color:maroon;margin-left:20px;}
        .label3 {color:maroon;font-size:small;font-weight:bold;}
        .grid1-cell{padding:10px; vertical-align:top;}
        .grid2-cell{padding:10px; vertical-align:top; text-align:left;}
        .hide{display:none;}
        .gpad {padding-right:7px;}
    </style>

    <%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table class="header-table">

        <tr class="header-row">
            <td>
                <asp:Label ID="Label3" runat="server" Text="W/O By Status:" CssClass="header-label"></asp:Label>
                <Spc:SpacerImage ID="SpacerImage1" runat="server" Width="5px" />
                <asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="dsStatus" DataTextField="ShortDesc" DataValueField="StatusId" AutoPostBack="true">
                </asp:DropDownList>

                <Spc:SpacerImage ID="SpacerImage3" runat="server" Width="15px" />
                <asp:Label ID="Label2" runat="server" Text="Assigned To:" CssClass="label3"></asp:Label>
                <Spc:SpacerImage ID="SpacerImage4" runat="server" Width="0px" />
                <asp:DropDownList ID="ddlAssignedUserId" runat="server" AutoPostBack="true">
                    <asp:ListItem Text="Select User..." Value="0"></asp:ListItem>
                    <asp:ListItem Text="Bob Emslie" Value="36"></asp:ListItem>
                    <asp:ListItem Text="Darren Reeves" Value="37"></asp:ListItem>
                    <asp:ListItem Text="Dean Peters" Value="16"></asp:ListItem>
                    <asp:ListItem Text="Rick Noll" Value="22"></asp:ListItem>
                    <asp:ListItem Text="Rosa Cuellar" Value="21"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="38"></asp:ListItem>
                </asp:DropDownList>
                <Spc:SpacerImage ID="SpacerImage5" runat="server" Width="10px" />
                <asp:Button ID="cmdRefresh" runat="server" Text="Refresh" OnClick="cmdRefresh_Click" />

                <Spc:SpacerImage ID="SpacerImage6" runat="server" Width="90px" />
                <asp:Label ID="Label4" runat="server" Text="Action for:" CssClass="label3"></asp:Label>
                <Spc:SpacerImage ID="SpacerImage7" runat="server" Width="3px" />
                <asp:DropDownList ID="ddlActionUser" runat="server" DataSourceID="dsEEList" DataTextField="DisplayName" DataValueField="UserID" OnDataBound="ddlActionUser_DataBound"></asp:DropDownList>
                <Spc:SpacerImage ID="SpacerImage8" runat="server" Width="5px" />
                <asp:Label ID="Label5" runat="server" Text="Actions:" CssClass="label3"></asp:Label>
                <Spc:SpacerImage ID="SpacerImage9" runat="server" Width="5px" />
                <asp:Button ID="cmdApprove" runat="server" Text="Approve" OnClick="cmdApprove_Click" />
                <Spc:SpacerImage ID="SpacerImage10" runat="server" Width="3px" />
                <asp:Button ID="cmdAssign" runat="server" Text="Assign" OnClick="cmdAssign_Click" />
                <Spc:SpacerImage ID="SpacerImage11" runat="server" Width="3px" />
                <asp:Button ID="cmdComplete" runat="server" Text="Complete" OnClick="cmdComplete_Click" />
                <Spc:SpacerImage ID="SpacerImage12" runat="server" Width="3px" />
                <asp:Button ID="cmdDelete" runat="server" Text="Delete" OnClick="cmdDelete_Click" />

            </td>
        </tr>
        <tr>
            <td class="grid1-cell">
                <asp:GridView ID="gridWO" runat="server" DataSourceID="dsWO" OnRowDataBound="gridWO_RowDataBound" OnSelectedIndexChanged="gridWO_SelectedIndexChanged"
                    AutoGenerateColumns="False" DataKeyNames="WorkOrderId" Width="1250px"
                    CellPadding="2" ForeColor="#333333" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:templatefield HeaderText=" ">
                            <itemtemplate>
                                <asp:checkbox ID="ddlSelect" CssClass="gridCB" runat="server"></asp:checkbox>
                            </itemtemplate>
                        </asp:templatefield>
                        <asp:CommandField ShowSelectButton="True" HeaderText="Work Orders" ItemStyle-Width="290px" ItemStyle-HorizontalAlign="left"></asp:CommandField>
                        <asp:BoundField DataField="WorkOrderId" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="WorkOrderId"></asp:BoundField>
                        <asp:BoundField DataField="CategoryDesc" HeaderText="Category" ItemStyle-HorizontalAlign="Center" SortExpression="CategoryDesc" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="LocationDesc" HeaderText="Location" ItemStyle-HorizontalAlign="Center" SortExpression="LocationDesc" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="PriorityDesc" HeaderText="Priority" ItemStyle-HorizontalAlign="Center" SortExpression="PriorityDesc" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="AssignedName" HeaderText="Assigned" ItemStyle-HorizontalAlign="Center" SortExpression="AssignedName" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="CompletedName" HeaderText="Completed" SortExpression="CompletedName" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="RequestDT" HeaderText="Request" ItemStyle-HorizontalAlign="Center" SortExpression="RequestDT" DataFormatString="{0:MM/dd/yy}" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="ApprovalDT" HeaderText="Approval" ItemStyle-HorizontalAlign="Center" SortExpression="ApprovalDT" DataFormatString="{0:MM/dd/yy}" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="TargetDate" HeaderText="Target" ItemStyle-HorizontalAlign="Center" SortExpression="TargetDate" DataFormatString="{0:MM/dd/yy}" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="DueDate" HeaderText="Due" ItemStyle-HorizontalAlign="Center" SortExpression="DueDate" DataFormatString="{0:MM/dd/yy}" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="CostEstimate" HeaderText="$$ Est." ItemStyle-CssClass="gpad" ItemStyle-HorizontalAlign="Right" SortExpression="CostEstimate" ItemStyle-Width="70px" DataFormatString="{0:c0}" ></asp:BoundField>
                        <asp:BoundField DataField="CostActual" HeaderText="$$ Act." ItemStyle-CssClass="gpad" ItemStyle-HorizontalAlign="Right" SortExpression="CostActual" ItemStyle-Width="70px" DataFormatString="{0:c0}" ></asp:BoundField>
                        <asp:BoundField DataField="ManHoursEstimate" HeaderText="Time Est." ItemStyle-CssClass="gpad" ItemStyle-HorizontalAlign="Right" SortExpression="ManHoursEstimate" DataFormatString="{0:N1}" ItemStyle-Width="70px"></asp:BoundField>
                        <asp:BoundField DataField="ManHoursActual" HeaderText="Time Act." ItemStyle-CssClass="gpad" ItemStyle-HorizontalAlign="Right" SortExpression="ManHoursActual" DataFormatString="{0:N1}" ItemStyle-Width="70px"></asp:BoundField>
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
        </tr>
    </table>

    <asp:SqlDataSource ID="dsEEList" runat="server" ConnectionString="<%$ ConnectionStrings:TBBF %>" SelectCommand="SELECT UserID, DisplayName FROM secUsers ORDER BY FirstName, LastName"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsApprove" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        UpdateCommand="upd_tblWorkOrder_Approve" UpdateCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:Parameter Name="WorkOrderId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ApprovalUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="MB" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAssign" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>'  
        UpdateCommand="upd_tblWorkOrder_Assign" UpdateCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:Parameter Name="WorkOrderId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="AssignedUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="MB" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsComplete" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>'  
        UpdateCommand="upd_tblWorkOrder_Complete" UpdateCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:Parameter Name="WorkOrderId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="CompletedUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="MB" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsDelete" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>'  
        DeleteCommand="del_tblWorkOrder" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="WorkOrderId" Type="Int32"></asp:Parameter>
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [StatusId], [ShortDesc], [SeqNum] FROM [tblWOStatus] ORDER BY [SeqNum]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsWO" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_tblWorkOrders_by_Status" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlStatus" PropertyName="SelectedValue" Name="StatusId" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlAssignedUserId" PropertyName="SelectedValue" Name="AssignedUserId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


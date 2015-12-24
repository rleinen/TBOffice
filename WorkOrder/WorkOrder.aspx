<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="WorkOrder.aspx.cs" Inherits="TBOffice.WorkOrder.WorkOrder" %>

<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header-table{margin:10px; border-collapse:collapse;}
        .header-row {font-family:Tahoma; background-color:#dfdfdf}
        .header-row td {padding:3px;}
        .header-label {padding-left:10px; padding-right:50px; font-weight:bold; color:navy;}
        .label {color:maroon;}
        .label2 {color:maroon;margin-left:20px;}
        .detail-table{margin:1px; border-collapse:collapse;}
        .detail-tables td{padding:0px;}
        .detail-c1{width:250px;color:maroon;font-weight:bold;}
        .detail-c2{width:105px;border-left:1px solid black;border-right:1px solid black; padding-left:5px;}
        .detail-c3{width:175px;color:maroon;font-weight:bold; padding-left:5px;}
        .note-table{border-collapse:collapse; width:500px;}
        .note-table th {width:100%;font-family:Tahoma; background-color:#dfdfdf; font-weight:normal; font-size:small; color:navy;}
        .note-table td {}
        .note-date {padding-left:4px; font-family:Tahoma; background-color:#fcd9bf; font-weight:normal; font-size:smaller;}
        .note-user {padding-right:4px; font-family:Tahoma; background-color:#fcd9bf; font-weight:normal; font-size:smaller; text-align:right;}
        .note-body{padding:10px; font-family:Tahoma;font-weight:normal; font-size:smaller;}
        .detail-cell {vertical-align:top; text-align:left; width:755px;border:1px solid white;}
        .note-table-cell {vertical-align:top; text-align:left;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <table style="width: 99%;" class="header-table">
        <tr class="header-row">
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Work Order" CssClass="header-label"></asp:Label>
                <Spc:SpacerImage ID="spc1" runat="server" Width="100px" />

            </td>
        </tr>
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr>
            <td class="detail-cell">

                <asp:DetailsView ID="dvWO" runat="server" Height="50px" Width="750px" DataSourceID="dsWO"
                    AutoGenerateRows="false" DataKeyNames="WorkOrderId" Font-Names="Arial" Font-Size="Small"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnItemCommand="dvWO_ItemCommand"
                    CellPadding="3">
                    <EditRowStyle BackColor="#DDDDDD" Font-Bold="True" ForeColor="Navy"></EditRowStyle>
                    <Fields>
                        <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle BackColor="#fcd9bf" />
                        </asp:CommandField>
                        <asp:BoundField DataField="WorkOrderId" HeaderText="Work Order #" ReadOnly="True" InsertVisible="False" SortExpression="WorkOrderId">
                            <ItemStyle Font-Bold="true" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ShortDesc" HeaderText="Description:" SortExpression="ShortDesc" ControlStyle-Width="550px">
                            <ItemStyle Font-Bold="true" ForeColor="Navy" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Target Date:" SortExpression="TargetDate">
                            <EditItemTemplate>
                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:TextBox runat="server" Text='<%# Bind("TargetDate") %>' ID="txtTargetDateEdit" Width="100px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calTargetDate" runat="server"
                                                TargetControlID="txtTargetDateEdit" SelectedDate='<%# Convert.IsDBNull(Eval("TargetDate")) ? null : Eval("TargetDate") %>'>
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td class="detail-c2">Due Date:</td>
                                        <td class="detail-c3">
                                            <asp:TextBox runat="server" Text='<%# Bind("DueDate") %>' ID="txtDueDateEdit" Width="100px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calDueDate" runat="server"
                                                TargetControlID="txtDueDateEdit" SelectedDate='<%# Convert.IsDBNull(Eval("DueDate")) ? null : Eval("DueDate") %>'>
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:TextBox runat="server" Text='<%# Bind("TargetDate") %>' ID="txtTargetDateIns" Width="100px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calTargetDate" runat="server"
                                                TargetControlID="txtTargetDateIns" SelectedDate='<%# Convert.IsDBNull(Eval("TargetDate")) ? null : Eval("TargetDate") %>'>
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td class="detail-c2">Due Date:</td>
                                        <td class="detail-c3">
                                            <asp:TextBox runat="server" Text='<%# Bind("DueDate") %>' ID="txtDueDateIns" Width="100px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calDueDate" runat="server"
                                                TargetControlID="txtDueDateIns" SelectedDate='<%# Convert.IsDBNull(Eval("DueDate")) ? null : Eval("DueDate") %>'>
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>
                                </table>


                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Eval("TargetDate","{0:MM/dd/yyyy}") %>' ID="Label1"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Due Date:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Eval("DueDate","{0:MM/dd/yyyy}") %>' ID="Label2"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Location:" SortExpression="LocationId">

                            <EditItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlLocation" runat="server" SelectedValue='<%# Bind("LocationId") %>'
                                                DataSourceID="dsLocation" DataTextField="ShortDesc" DataValueField="LocationId">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Status:</td>
                                        <td class="detail-c3">
                                            <asp:DropDownList ID="ddlStatus" runat="server" SelectedValue='<%# Bind("StatusId") %>'
                                                DataSourceID="dsStatus" DataTextField="ShortDesc" DataValueField="StatusId">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlLocation" runat="server" SelectedValue='<%# Bind("LocationId") %>'
                                                DataSourceID="dsLocation" DataTextField="ShortDesc" DataValueField="LocationId">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Status:</td>
                                        <td class="detail-c3">
                                            <asp:DropDownList ID="ddlStatus" runat="server" SelectedValue='<%# Bind("StatusId") %>'
                                                DataSourceID="dsStatus" DataTextField="ShortDesc" DataValueField="StatusId">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Eval("LocationDesc") %>' ID="Label12"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Status:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Eval("StatusDesc") %>' ID="Label3"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category:" SortExpression="CategoryId">
                            <EditItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlCategory" runat="server" SelectedValue='<%# Bind("CategoryId") %>'
                                                DataSourceID="dsCategory" DataTextField="ShortDesc" DataValueField="CategoryId">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Priority:</td>
                                        <td class="detail-c3">
                                            <asp:DropDownList ID="ddlPriority" runat="server" SelectedValue='<%# Bind("PriorityId") %>'
                                                DataSourceID="dsPriority" DataTextField="ShortDesc" DataValueField="PriorityId">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlCategory" runat="server" SelectedValue='<%# Bind("CategoryId") %>'
                                                DataSourceID="dsCategory" DataTextField="ShortDesc" DataValueField="CategoryId">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Priority:</td>
                                        <td class="detail-c3">
                                            <asp:DropDownList ID="ddlPriority" runat="server" SelectedValue='<%# Bind("PriorityId") %>'
                                                DataSourceID="dsPriority" DataTextField="ShortDesc" DataValueField="PriorityId">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Eval("CategoryDesc") %>' ID="Label5"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Priority:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Eval("PriorityDesc") %>' ID="lblPriority"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Requested By:" SortExpression="RequestBy">
                            <EditItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:TextBox runat="server" Text='<%# Bind("RequestBy") %>' ID="TextBox3"></asp:TextBox>
                                        </td>
                                        <td class="detail-c2">Requested On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("RequestDT","{0:MM/dd/yyyy}") %>' ID="lblRequestDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:TextBox runat="server" Text='<%# Bind("RequestBy") %>' ID="txtRequestBy"></asp:TextBox>
                                        </td>
                                        <td class="detail-c2">Requested On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("RequestDT","{0:MM/dd/yyyy}") %>' ID="lblRequestDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Bind("RequestBy") %>' ID="Label6"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Requested On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("RequestDT","{0:MM/dd/yyyy}") %>' ID="lblRequestDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Approved By:" SortExpression="ApprovalUserId">
                            <EditItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlApprovalUserId" runat="server" SelectedValue='<%# Bind("ApprovalUserId") %>'>
                                                <asp:ListItem Text="Select User..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Dean Peters" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="Randy Leinen" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Tammy Werth" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Toni McCurdy" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Approved On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("ApprovalDT","{0:MM/dd/yyyy}") %>' ID="lblApprovalDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlApprovalUserId" runat="server" SelectedValue='<%# Bind("ApprovalUserId") %>'>
                                                <asp:ListItem Text="Select User..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Dean Peters" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="Randy Leinen" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Tammy Werth" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Toni McCurdy" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Approved On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("ApprovalDT","{0:MM/dd/yyyy}") %>' ID="lblApprovalDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Eval("ApprovedName") %>' ID="Label7"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Approved On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("ApprovalDT","{0:MM/dd/yyyy}") %>' ID="lblApprovalDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assigned To:" SortExpression="AssignedUserId">
                            <EditItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlAssignedUserId" runat="server" SelectedValue='<%# Bind("AssignedUserId") %>'>
                                                <asp:ListItem Text="Select User..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Bob Emslie" Value="36"></asp:ListItem>
                                                <asp:ListItem Text="Darren Reeves" Value="37"></asp:ListItem>
                                                <asp:ListItem Text="Dean Peters" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="Rick Noll" Value="22"></asp:ListItem>
                                                <asp:ListItem Text="Rosa Cuellar" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="Other" Value="38"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Assigned On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("AssignedDT","{0:MM/dd/yyyy}") %>' ID="lblAssignedDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlAssignedUserId" runat="server" SelectedValue='<%# Bind("AssignedUserId") %>'>
                                                <asp:ListItem Text="Select User..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Bob Emslie" Value="36"></asp:ListItem>
                                                <asp:ListItem Text="Darren Reeves" Value="37"></asp:ListItem>
                                                <asp:ListItem Text="Dean Peters" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="Rick Noll" Value="22"></asp:ListItem>
                                                <asp:ListItem Text="Rosa Cuellar" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="Other" Value="38"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Assigned On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("AssignedDT","{0:MM/dd/yyyy}") %>' ID="lblAssignedDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Bind("AssignedName") %>' ID="lblAssigned"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Assigned On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("AssignedDT","{0:MM/dd/yyyy}") %>' ID="lblAssignedDT"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Completed By:" SortExpression="CompletedUserId">
                            <EditItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlCompletedUserId" runat="server" SelectedValue='<%# Bind("CompletedUserId") %>'>
                                                <asp:ListItem Text="Select User..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Bob Emslie" Value="36"></asp:ListItem>
                                                <asp:ListItem Text="Darren Reeves" Value="37"></asp:ListItem>
                                                <asp:ListItem Text="Dean Peters" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="Rick Noll" Value="22"></asp:ListItem>
                                                <asp:ListItem Text="Rosa Cuellar" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="Other" Value="38"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Completed On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("CompletedDate","{0:MM/dd/yyyy}") %>' ID="lblCompleted"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:DropDownList ID="ddlCompletedUserId" runat="server" SelectedValue='<%# Bind("CompletedUserId") %>'>
                                                <asp:ListItem Text="Select User..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Bob Emslie" Value="36"></asp:ListItem>
                                                <asp:ListItem Text="Darren Reeves" Value="37"></asp:ListItem>
                                                <asp:ListItem Text="Dean Peters" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="Rick Noll" Value="22"></asp:ListItem>
                                                <asp:ListItem Text="Rosa Cuellar" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="Other" Value="38"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="detail-c2">Completed On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("CompletedDate","{0:MM/dd/yyyy}") %>' ID="lblCompleted"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Bind("CompletedName") %>' ID="lblCompletedName"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Completed On:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("CompletedDate","{0:MM/dd/yyyy}") %>' ID="lblCompleted"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Cost Estimate:" SortExpression="CostEstimate">
                            <EditItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:TextBox runat="server" Text='<%# Bind("CostEstimate") %>' ID="txtEstimatedCost" Width="75px"></asp:TextBox>
                                        </td>
                                        <td class="detail-c2">Actual Cost:</td>
                                        <td class="detail-c3">
                                            <asp:TextBox runat="server" Text='<%# Bind("CostActual") %>' ID="txtActualCost" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:TextBox runat="server" Text='<%# Bind("CostEstimate") %>' ID="txtEstimatedCost" Width="75px"></asp:TextBox>
                                        </td>
                                        <td class="detail-c2">Actual Cost:</td>
                                        <td class="detail-c3">
                                            <asp:TextBox runat="server" Text='<%# Bind("CostActual") %>' ID="txtActualCost" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Bind("CostEstimate", "{0:c0}") %>' ID="lblEstCost"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Actual Cost:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("CostActual", "{0:c0}") %>' ID="lblActualCost"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Time Estimate:" SortExpression="ManHoursEstimate">
                            <EditItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:TextBox runat="server" Text='<%# Bind("ManHoursEstimate") %>' ID="txtEstimatedManHours" Width="75px"></asp:TextBox>
                                        </td>
                                        <td class="detail-c2">Actual Time:</td>
                                        <td class="detail-c3">
                                            <asp:TextBox runat="server" Text='<%# Bind("ManHoursActual") %>' ID="txtActualManHours" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:TextBox runat="server" Text='<%# Bind("ManHoursEstimate") %>' ID="txtEstimatedManHours" Width="75px"></asp:TextBox>
                                        </td>
                                        <td class="detail-c2">Actual Time:</td>
                                        <td class="detail-c3">
                                            <asp:TextBox runat="server" Text='<%# Bind("ManHoursActual") %>' ID="txtActualManHours" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td class="detail-c1">
                                            <asp:Label runat="server" Text='<%# Bind("ManHoursEstimate", "{0:N1}") %>' ID="lblEstManHours"></asp:Label>
                                        </td>
                                        <td class="detail-c2">Actual Time:</td>
                                        <td class="detail-c3">
                                            <asp:Label runat="server" Text='<%# Bind("ManHoursActual", "{0:N1}") %>' ID="lblActualManHours"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="W/O Note">
                            <EditItemTemplate>

                            </EditItemTemplate>
                            <InsertItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td style="width: 625px;">
                                            <asp:TextBox runat="server" Text='<%# Bind("LongDesc") %>' ID="txtLongDesc" Width="600px"
                                                TextMode="MultiLine" Wrap="true" Rows="14"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>

                                <table class="detail-table">
                                    <tr>
                                        <td style="width: 625px; padding:10px; word-wrap:break-word"><%# Eval("LongDesc") %></td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                        </asp:TemplateField>

                    </Fields>
                    <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                    <FieldHeaderStyle Width="125px" />

                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>
                    <RowStyle ForeColor="#000066"></RowStyle>
                </asp:DetailsView>

            </td>
            <td style="vertical-align:top;" rowspan="2" >
                <div style="height:565px;overflow-y:scroll;width:517px;border: 1px solid #CCCCCC;">
                <table class="note-table">
                    <tr>
                        <th colspan="2">Work Order Notes</th>
                    </tr>
                    <asp:Repeater ID="repNotes" runat="server" DataSourceID="dsWONotes">
                        <ItemTemplate>
                            <tr>
                                <td class="note-date"><%# Eval("CDT") %></td>
                                <td class="note-user"><%# Eval("DisplayName") %></td>
                            </tr>
                            <tr>
                                <td class="note-body" colspan="2"><%# Eval("Note") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <table class="detail-table" id="tableNote" runat="server" style="width:740px;">
                    <tr>
                        <td style="width: 740px;padding:10px 10px 0px 10px; background-color:#dfdfdf;">
                            <asp:TextBox runat="server" ID="txtNewNote" Width="724px"
                                TextMode="MultiLine" Wrap="true" Rows="9"></asp:TextBox>
                        </td>
                    </tr>
                    <%--<tr>
                        <td style="text-align:center; padding:3px 0px 10px 0px; background-color:#dfdfdf;vertical-align:top;">
                            <asp:Button ID="btnSaveNote" runat="server" OnClick="btnSaveNote_Click" Text="Add Note" />
                        </td>
                    </tr>--%>
                </table>
            </td>

        </tr>


    </table>

    <asp:HiddenField ID="varCurrentUserId" runat="server" />
    <asp:HiddenField ID="varCurrentuserName" runat="server" />

    <asp:SqlDataSource ID="dsWONotes" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' InsertCommand="ins_tblWONote" InsertCommandType="StoredProcedure" SelectCommand="get_tblWONotes" SelectCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="WorkOrderId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Note" Type="String"></asp:Parameter>
            <asp:Parameter Name="CB" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="woid" Name="WorkOrderId" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsEEList" runat="server" ConnectionString="<%$ ConnectionStrings:TBBF %>" SelectCommand="SELECT UserID, DisplayName FROM secUsers ORDER BY FirstName, LastName"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [StatusId], [ShortDesc], [SeqNum] FROM [tblWOStatus] ORDER BY [SeqNum]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [CategoryId], [ShortDesc], [SeqNum] FROM [tblWOCategory] ORDER BY [SeqNum]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsLocation" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [LocationId], [ShortDesc], [SeqNum] FROM [tblWOLocation] ORDER BY [SeqNum]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsPriority" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="SELECT [PriorityId], [SeqNum], [ShortDesc] FROM [tblWOPriority] ORDER BY [SeqNum]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsWO" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' 
        InsertCommand="ins_tblWorkOrder" InsertCommandType="StoredProcedure" 
        SelectCommand="get_tblWorkOrder" SelectCommandType="StoredProcedure" 
        UpdateCommand="upd_tblWorkOrder" UpdateCommandType="StoredProcedure" OnInserted="dsWO_Inserted" OnUpdating="dsWO_Updating">
        <InsertParameters>
            <asp:Parameter Name="ShortDesc" Type="String"></asp:Parameter>
            <asp:Parameter Name="LongDesc" Type="String"></asp:Parameter>
            <asp:Parameter Name="StatusId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="CategoryId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="LocationId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="PriorityId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="RequestBy" Type="string"></asp:Parameter>
            <asp:Parameter Name="ApprovalUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="AssignedUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="CompletedUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="RequestDT" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ApprovalDT" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="AssignedDT" Type="DateTime"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="TargetDate"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="DueDate"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="CompletedDate"></asp:Parameter>
            <asp:Parameter Name="CostEstimate" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="CostActual" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ManHoursEstimate" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ManHoursActual" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="SeqNum" Type="Int64"></asp:Parameter>
            <asp:SessionParameter Name="CB" Type="Int32" SessionField="CurrentUserId" />
            <asp:SessionParameter Name="MB" Type="Int32" SessionField="CurrentUserId" />
            <asp:Parameter Name="WorkOrderId" Type="Int32" Direction="Output"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="woid" DefaultValue="0" Name="WorkOrderId" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="WorkOrderId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ShortDesc" Type="String"></asp:Parameter>
            <asp:Parameter Name="LongDesc" Type="String"></asp:Parameter>
            <asp:Parameter Name="StatusId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="CategoryId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="LocationId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="PriorityId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="RequestBy" Type="string"></asp:Parameter>
            <asp:Parameter Name="ApprovalUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="AssignedUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="CompletedUserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="RequestDT" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ApprovalDT" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="AssignedDT" Type="DateTime"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="TargetDate"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="DueDate"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="CompletedDate"></asp:Parameter>
            <asp:Parameter Name="CostEstimate" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="CostActual" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ManHoursEstimate" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ManHoursActual" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="SeqNum" Type="Int64"></asp:Parameter>
            <asp:SessionParameter Name="MB" Type="Int32" SessionField="CurrentUserId" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

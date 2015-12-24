<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="VacationCalendar.aspx.cs" Inherits="TBOffice.Employee.VacationCalendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 950px;
            border: 1px solid #000000;
            margin:10px;
            border-collapse:collapse;
        }
        .auto-style1 td, th { border: 1px solid }
        .dayHeaderCell td{
            text-align:center;
            background-color:gray; color:white;
            width:135px;
        }
        .dayCell td{
            height:80px; vertical-align:top;
        }
        .dayCell td div{
            height:20px; background-color:#d6dbe9; color:black; text-align:center; 
        }
        .listCell{
            width:100%; height:100%;
        }
        .ulDiv {
            width:100%; height:69px; overflow:auto;
        }
        .ulContainer {
            margin:1px;
            padding:2px;
            width:130px; height:69px; overflow:auto;
        }
        .listItem {
            display:block;
            margin-left:3px;
            --background-color:#f3adad;
            margin-top:1px;
            height:20px;
            width:110px;
            font-size:13px;
            font-family:Tahoma;
            color:maroon;
        }
        .cellWhite{
            background-color:white;
        }
        .cellShade{
            background-color:#f5eded
        }
        .title{
            font-size:20px;
            font-weight:bold;
            color:maroon;
            margin-left:15px;
        }
        .calTitle{
            font-size:28px;
            font-weight:bold;
            color:navy;
            text-align:center;
            background-color:#d6d6ee
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <table class="auto-style1">
        <tr>
            <td colspan="7" class="calTitle">Employee Vacation Calendar</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="labTitle" runat="server" Text="" CssClass="title"></asp:Label>
            </td>
            <td colspan="4" style="text-align:right;">
                <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true">
                    <asp:ListItem Text="January" Value="1"></asp:ListItem>
                    <asp:ListItem Text="February" Value="2"></asp:ListItem>
                    <asp:ListItem Text="March" Value="3"></asp:ListItem>
                    <asp:ListItem Text="April" Value="4"></asp:ListItem>
                    <asp:ListItem Text="May" Value="5"></asp:ListItem>
                    <asp:ListItem Text="June" Value="6"></asp:ListItem>
                    <asp:ListItem Text="July" Value="7"></asp:ListItem>
                    <asp:ListItem Text="August" Value="8"></asp:ListItem>
                    <asp:ListItem Text="September" Value="9"></asp:ListItem>
                    <asp:ListItem Text="October" Value="10"></asp:ListItem>
                    <asp:ListItem Text="November" Value="11"></asp:ListItem>
                    <asp:ListItem Text="December" Value="12"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true">
                    <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                    <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                    <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                    <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                    <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                    <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                    <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                    <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                    <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                    <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                    <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
                    <asp:ListItem Text="2025" Value="2025"></asp:ListItem>
                    <asp:ListItem Text="2026" Value="2026"></asp:ListItem>
                    <asp:ListItem Text="2027" Value="2027"></asp:ListItem>
                    <asp:ListItem Text="2028" Value="2028"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnPrev" runat="server" Text="<<<" OnClick="btnPrev_Click" />
                <asp:Button ID="btnNext" runat="server" Text=">>>" OnClick="btnNext_Click" />
            </td>
        </tr>
        <tr class="dayHeaderCell">
            <td>Sunday</td>
            <td>Monday</td>
            <td>Tuesday</td>
            <td>Wednesday</td>
            <td>Thursday</td>
            <td>Friday</td>
            <td>Saturday</td>
        </tr>
        <tr class="dayCell">
            <td id="cell_1" runat="server" class="cellWhite">
                <div id="day_1" runat="server">1</div>
                <asp:ListView ID="list_1" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_2" runat="server" class="cellWhite">
                <div id="day_2" runat="server">1</div>
                <asp:ListView ID="list_2" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_3" runat="server" class="cellWhite">
                <div id="day_3" runat="server">1</div>
                <asp:ListView ID="list_3" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_4" runat="server" class="cellWhite">
                <div id="day_4" runat="server">1</div>
                <asp:ListView ID="list_4" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_5" runat="server" class="cellWhite">
                <div id="day_5" runat="server">1</div>
                <asp:ListView ID="list_5" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_6" runat="server" class="cellWhite">
                <div id="day_6" runat="server">1</div>
                <asp:ListView ID="list_6" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_7" runat="server" class="cellWhite">
                <div id="day_7" runat="server">1</div>
                <asp:ListView ID="list_7" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr class="dayCell">
            <td id="cell_8" runat="server" class="cellWhite">
                <div id="day_8" runat="server">1</div>
                <asp:ListView ID="list_8" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_9" runat="server" class="cellWhite">
                <div id="day_9" runat="server">1</div>
                <asp:ListView ID="list_9" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_10" runat="server" class="cellWhite">
                <div id="day_10" runat="server">1</div>
                <asp:ListView ID="list_10" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_11" runat="server" class="cellWhite">
                <div id="day_11" runat="server">1</div>
                <asp:ListView ID="list_11" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_12" runat="server" class="cellWhite">
                <div id="day_12" runat="server">1</div>
                <asp:ListView ID="list_12" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_13" runat="server" class="cellWhite">
                <div id="day_13" runat="server">1</div>
                <asp:ListView ID="list_13" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_14" runat="server" class="cellWhite">
                <div id="day_14" runat="server">1</div>
                <asp:ListView ID="list_14" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr class="dayCell">
            <td id="cell_15" runat="server" class="cellWhite">
                <div id="day_15" runat="server">1</div>
                <asp:ListView ID="list_15" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_16" runat="server" class="cellWhite">
                <div id="day_16" runat="server">1</div>
                <asp:ListView ID="list_16" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_17" runat="server" class="cellWhite">
                <div id="day_17" runat="server">1</div>
                <asp:ListView ID="list_17" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_18" runat="server" class="cellWhite">
                <div id="day_18" runat="server">1</div>
                <asp:ListView ID="list_18" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_19" runat="server" class="cellWhite">
                <div id="day_19" runat="server">1</div>
                <asp:ListView ID="list_19" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_20" runat="server" class="cellWhite">
                <div id="day_20" runat="server">1</div>
                <asp:ListView ID="list_20" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_21" runat="server" class="cellWhite">
                <div id="day_21" runat="server">1</div>
                <asp:ListView ID="list_21" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr class="dayCell">
            <td id="cell_22" runat="server" class="cellWhite">
                <div id="day_22" runat="server">1</div>
                <asp:ListView ID="list_22" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_23" runat="server" class="cellWhite">
                <div id="day_23" runat="server">1</div>
                <asp:ListView ID="list_23" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_24" runat="server" class="cellWhite">
                <div id="day_24" runat="server">1</div>
                <asp:ListView ID="list_24" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_25" runat="server" class="cellWhite">
                <div id="day_25" runat="server">1</div>
                <asp:ListView ID="list_25" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_26" runat="server" class="cellWhite">
                <div id="day_26" runat="server">1</div>
                <asp:ListView ID="list_26" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_27" runat="server" class="cellWhite">
                <div id="day_27" runat="server">1</div>
                <asp:ListView ID="list_27" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_28" runat="server" class="cellWhite">
                <div id="day_28" runat="server">1</div>
                <asp:ListView ID="list_28" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr class="dayCell">
            <td id="cell_29" runat="server" class="cellWhite">
                <div id="day_29" runat="server">1</div>
                <asp:ListView ID="list_29" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_30" runat="server" class="cellWhite">
                <div id="day_30" runat="server">1</div>
                <asp:ListView ID="list_30" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_31" runat="server" class="cellWhite">
                <div id="day_31" runat="server">1</div>
                <asp:ListView ID="list_31" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_32" runat="server" class="cellWhite">
                <div id="day_32" runat="server">1</div>
                <asp:ListView ID="list_32" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_33" runat="server" class="cellWhite">
                <div id="day_33" runat="server">1</div>
                <asp:ListView ID="list_33" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_34" runat="server" class="cellWhite">
                <div id="day_34" runat="server">1</div>
                <asp:ListView ID="list_34" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_35" runat="server" class="cellWhite">
                <div id="day_35" runat="server">1</div>
                <asp:ListView ID="list_35" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr class="dayCell">
            <td id="cell_36" runat="server" class="cellWhite">
                <div id="day_36" runat="server">1</div>
                <asp:ListView ID="list_36" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_37" runat="server" class="cellWhite">
                <div id="day_37" runat="server">1</div>
                <asp:ListView ID="list_37" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_38" runat="server" class="cellWhite">
                <div id="day_38" runat="server">1</div>
                <asp:ListView ID="list_38" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_39" runat="server" class="cellWhite">
                <div id="day_39" runat="server">1</div>
                <asp:ListView ID="list_39" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_40" runat="server" class="cellWhite">
                <div id="day_40" runat="server">1</div>
                <asp:ListView ID="list_40" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_41" runat="server" class="cellWhite">
                <div id="day_41" runat="server">1</div>
                <asp:ListView ID="list_41" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
            <td id="cell_42" runat="server" class="cellWhite">
                <div id="day_42" runat="server">1</div>
                <asp:ListView ID="list_42" runat="server">
                    <LayoutTemplate><ul class="ulContainer"><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></ul></LayoutTemplate>
                    <ItemTemplate><li class="listItem"><%#Eval("DisplayName")%></li></ItemTemplate>
                </asp:ListView>
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="dsTOCalEntry" runat="server" ConnectionString='<%$ ConnectionStrings:TBBF %>' SelectCommand="get_TO_Cal_Entries" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DbType="Date" Name="TODate" DefaultValue="08-04-2014"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

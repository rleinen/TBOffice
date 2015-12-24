<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Main.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TBOffice.Account.Login" %>

<asp:Content runat="server" ID="headcontent" ContentPlaceHolderID="head">

    <style type="text/css" media="screen">
        .loginPanel{
            width:300px;
            margin-left:100px;
            margin-top:60px;
            padding-bottom: 20px;
            padding-top:20px;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnLogin" CssClass="loginPanel" 
        HorizontalAlign="Center" BorderStyle="Solid" BorderColor="#0000CC" BorderWidth="1px">
          <table border="0" cellpadding="1" cellspacing="0" style="border-collapse:collapse; margin-left:20px;">
            <tr>
              <td>
                <table border="0" cellpadding="0">
                  <tr>
                    <td align="center" colspan="2">
                      Log In</td>
                  </tr>
                  <tr>
                    <td align="right">
                      <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtUserName">User Name:</asp:Label>
                    </td>
                    <td>
                      <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                        ControlToValidate="txtUserName" ErrorMessage="User Name is required." 
                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  <tr>
                    <td align="right">
                      <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
                    </td>
                    <td>
                      <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Password is required." 
                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      &nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center" colspan="2" style="color:Red;">
                      <asp:Literal ID="txtFailureText" runat="server" EnableViewState="False"></asp:Literal>
                    </td>
                  </tr>
                  <tr>
                    <td align="right" colspan="2">
                      <asp:Button ID="btnLogin" runat="server" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
    </asp:Panel>
</asp:Content>

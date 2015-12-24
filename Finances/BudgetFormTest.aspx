<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetFormTest.aspx.cs" Inherits="TBOffice.Finances.BudgetFormTest" %>

<%@ Register Src="~/Finances/BudgetForm.ascx" TagPrefix="uc1" TagName="BudgetForm" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:600px;">
        <uc1:BudgetForm runat="server" ID="BudgetForm" OnBudgetUpdated="BudgetForm_BudgetUpdated" />    
    </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>

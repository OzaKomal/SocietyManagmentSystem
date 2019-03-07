<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpenseIncomeData.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.ExpenseIncomeData" %>
 <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

 <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
 <h1><b>Expense/Income</b></h1><br />
     <asp:GridView ID="grdExpenseIncome" runat="server" AutoGenerateColumns="False" 
         DataSourceID="sdsExpInc" Width="755px" Font-Size="Large" ForeColor="#000099">
         <Columns>
             <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
             <asp:BoundField DataField="Expense_or_income" HeaderText="Expense_or_income" 
                 SortExpression="Expense_or_income" />
             <asp:BoundField DataField="Amount" HeaderText="Amount" 
                 SortExpression="Amount" />
             <asp:BoundField DataField="Total_liabilities" HeaderText="Total_liabilities" 
                 SortExpression="Total_liabilities" />
             <asp:BoundField DataField="Total_asset" HeaderText="Total_asset" 
                 SortExpression="Total_asset" />
         </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="sdsExpInc" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [Date], [Expense_or_income], [Amount], [Total_liabilities], [Total_asset] FROM [Expense_Income]">
     </asp:SqlDataSource>
  </asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintenanceInfo.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.MaintenanceInfo" %>

 <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>MaintenanceInfo</b></h1><br />
     <table style="color: #000099; font-size: large">
     <tr>
        <td>
            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>    
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
     </tr>
     </table>
         <asp:GridView ID="grdMaintenance" runat="server" DataSourceID="sdsMaintenance" 
             AutoGenerateColumns="False" Width="688px">
             <Columns>
                 <asp:BoundField DataField="Member_id" HeaderText="Member_id" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Member_id" />
                 <asp:BoundField DataField="Paid_amount" HeaderText="Paid_amount" 
                     SortExpression="Paid_amount" />
                 <asp:BoundField DataField="Remaining_amount" HeaderText="Remaining_amount" 
                     SortExpression="Remaining_amount" />
                 <asp:BoundField DataField="Actual_amount" HeaderText="Actual_amount" 
                     SortExpression="Actual_amount" />
                 <asp:BoundField DataField="Payment_type" HeaderText="Payment_type" 
                     SortExpression="Payment_type" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="sdsMaintenance" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             SelectCommand="SELECT [Member_id], [Paid_amount], [Remaining_amount], [Actual_amount], [Payment_type] FROM [Maintenance_Details]"></asp:SqlDataSource>
     </asp:Content>
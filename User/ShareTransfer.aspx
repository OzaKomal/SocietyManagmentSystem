<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareTransfer.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.ShareTransfer" %>


 <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Share Transfer</b></h1><br />
         <asp:GridView ID="grdShareTransfer" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="Document_id" DataSourceID="sdsShareTransfer" Width="133px" Font-Size="Large" ForeColor="#000099">
             <Columns>
                 <asp:BoundField DataField="Member_id" HeaderText="Member id" 
                     SortExpression="Member_id" /> 
                 <asp:BoundField DataField="Document_id" HeaderText="Document id" 
                     SortExpression="Document_id" InsertVisible="False" ReadOnly="True" />
                 <asp:BoundField DataField="Member_name" 
                     HeaderText="Member name" SortExpression="Member_name" />
                 <asp:BoundField DataField="Dt_of_transfer" HeaderText="Transfer Date" 
                     SortExpression="Dt_of_transfer" />
                 <asp:BoundField DataField="Transfered_no" 
                     HeaderText="Transfered no" SortExpression="Transfered_no" />
                 <asp:BoundField DataField="Number_of_share" HeaderText="Number of share" 
                     SortExpression="Number_of_share" />
                 <asp:BoundField DataField="Cash_book_pgno" HeaderText="Cash book pgno" 
                     SortExpression="Cash_book_pgno" />
                 <asp:BoundField DataField="Transferer_name" HeaderText="Transferer" 
                     SortExpression="Transferer_name" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="sdsShareTransfer" runat="server"  
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             
             SelectCommand="SELECT [Member_id], [Document_id], [Member_name], [Dt_of_transfer], [Transfered_no], [Number_of_share], [Cash_book_pgno], [Transferer_name] FROM [Transferring_doc]"></asp:SqlDataSource>
     </asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareAccountRegister.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.ShareAccountRegister" %>

 <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Share Account Register</b></h1><br />
         <asp:GridView ID="grdShareAccountReg" runat="server" 
             AutoGenerateColumns="False" DataKeyNames="Transfer_id" 
             DataSourceID="sdsShareAccountReg" Font-Size="Large" ForeColor="#000099">
             <Columns>
                 <asp:BoundField DataField="Transfer_id" HeaderText="Transfer_id" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Transfer_id" />
                 <asp:BoundField DataField="Member_id" HeaderText="Member_id" 
                     SortExpression="Member_id" />
                 <asp:BoundField DataField="No_of_sharecertificate" 
                     HeaderText="No_of_sharecertificate" SortExpression="No_of_sharecertificate" />
                 <asp:BoundField DataField="Crdate_of_share" HeaderText="Crdate_of_share" 
                     SortExpression="Crdate_of_share" />
                 <asp:BoundField DataField="Issuing_date_of_share" 
                     HeaderText="Issuing_date_of_share" SortExpression="Issuing_date_of_share" />
                 <asp:BoundField DataField="Nos_of_share" HeaderText="Nos_of_share" 
                     SortExpression="Nos_of_share" />
                 <asp:BoundField DataField="Price_of_share" HeaderText="Price_of_share" 
                     SortExpression="Price_of_share" />
                 <asp:BoundField DataField="Date_of_transfer" HeaderText="Date_of_transfer" 
                     SortExpression="Date_of_transfer" />
                 <asp:BoundField DataField="Transferee_name" HeaderText="Transferee_name" 
                     SortExpression="Transferee_name" />
                 <asp:BoundField DataField="Transferer_name" HeaderText="Transferer_name" 
                     SortExpression="Transferer_name" />
                 <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                     SortExpression="Remarks" />
                 <asp:BoundField DataField="Bank_name_address" HeaderText="Bank_name_address" 
                     SortExpression="Bank_name_address" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="sdsShareAccountReg" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             SelectCommand="SELECT * FROM [Share_transfer_doc]"></asp:SqlDataSource>
     </asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalShare.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.PersonalShare" %>

 <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Personal Share Accounts Details</b></h1><br />
         <asp:GridView ID="grdPersonalShare" runat="server" AllowPaging="True" 
             AutoGenerateColumns="False" DataKeyNames="Personal_id" 
             DataSourceID="sdsPersonalShare" Font-Size="Large" ForeColor="#000099">
             <Columns>
                 <asp:BoundField DataField="Personal_id" HeaderText="Personal_id" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Personal_id" />
                 <asp:BoundField DataField="Member_id" HeaderText="Member_id" 
                     SortExpression="Member_id" />
                 <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                 <asp:BoundField DataField="Cashbook_Number" HeaderText="Cashbook_Number" 
                     SortExpression="Cashbook_Number" />
                 <asp:BoundField DataField="Share_no" HeaderText="Share_no" 
                     SortExpression="Share_no" />
                 <asp:BoundField DataField="Nos_of_share" HeaderText="Nos_of_share" 
                     SortExpression="Nos_of_share" />
                 <asp:BoundField DataField="Amount_of_cr" HeaderText="Amount_of_cr" 
                     SortExpression="Amount_of_cr" />
                 <asp:BoundField DataField="Amount_of_dr" HeaderText="Amount_of_dr" 
                     SortExpression="Amount_of_dr" />
                 <asp:BoundField DataField="Balance" HeaderText="Balance" 
                     SortExpression="Balance" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="sdsPersonalShare" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             SelectCommand="SELECT * FROM [Personal_share_doc]"></asp:SqlDataSource>
     </asp:Content>



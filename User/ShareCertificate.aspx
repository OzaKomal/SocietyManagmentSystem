<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareCertificate.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.ShareCertificate" %>

         <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Share Certificate</b></h1><br />
        <asp:GridView ID="grdShareCerti" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Share_transfer_id" DataSourceID="sdsShareCerti" Font-Size="Large" ForeColor="#000099">
            <Columns>
                <asp:BoundField DataField="Share_transfer_id" HeaderText="Share_transfer_id" 
                    ReadOnly="True" SortExpression="Share_transfer_id" />
                <asp:BoundField DataField="Member_id" HeaderText="Member_id" 
                    SortExpression="Member_id" />
                <asp:BoundField DataField="Transfer_no" HeaderText="Transfer_no" 
                    SortExpression="Transfer_no" />
                <asp:BoundField DataField="Ledger_page_no" HeaderText="Ledger_page_no" 
                    SortExpression="Ledger_page_no" />
                <asp:BoundField DataField="Total_share" HeaderText="Total_share" 
                    SortExpression="Total_share" />
                <asp:BoundField DataField="Transferer_name" HeaderText="Transferer_name" 
                    SortExpression="Transferer_name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsShareCerti" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Share_certificate]"></asp:SqlDataSource>
    </asp:Content>
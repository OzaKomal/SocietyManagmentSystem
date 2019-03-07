<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberInformation.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.MemberInformation" %>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
<h1><b>Member</b></h1><br />
    <asp:GridView ID="grdMember" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Member_id,Member_name" DataSourceID="sdsFlat" Width="781px" Font-Size="Large" ForeColor="#000099">
        <Columns>
            <asp:BoundField DataField="Member_id" HeaderText="Member id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Member_id" />
            <asp:BoundField DataField="Member_name" HeaderText="Member Name" 
                ReadOnly="True" SortExpression="Member_name" />
            <asp:BoundField DataField="Contact_no" HeaderText="Contact" 
                SortExpression="Contact_no" />
            <asp:BoundField DataField="Email_id" HeaderText="Email" 
                SortExpression="Email_id" />
            <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" 
                SortExpression="Birthdate" />
            <asp:CheckBoxField DataField="isAdmin" HeaderText="isAdmin" 
                SortExpression="isAdmin" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" />
            <asp:BoundField DataField="Password" HeaderText="Password" 
                SortExpression="Password" />
            <asp:BoundField DataField="Flat_id" HeaderText="Flat id" 
                SortExpression="Flat_id" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsFlat" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Member_details]"></asp:SqlDataSource>
</asp:Content>


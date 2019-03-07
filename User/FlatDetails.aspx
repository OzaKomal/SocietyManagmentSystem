<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlatDetails.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.FlatDetails" %>


<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Flat Details</b></h1><br />
         <asp:GridView ID="grdFlat" runat="server" AutoGenerateColumns="False" 
             DataSourceID="sdsFlat" Width="762px" ForeColor="#000099" Font-Size="Large">
             <Columns>
                 <asp:BoundField DataField="Society_name" HeaderText="Society_name" 
                     SortExpression="Society_name" />
                 <asp:BoundField DataField="Block_name" HeaderText="Block_name" 
                     SortExpression="Block_name" />
                 <asp:BoundField DataField="Total_flats" HeaderText="Total_flats" 
                     SortExpression="Total_flats" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="sdsFlat" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             SelectCommand="SELECT [Society_name], [Block_name], [Total_flats] FROM [Flat_Block]">
         </asp:SqlDataSource>
     </asp:Content>

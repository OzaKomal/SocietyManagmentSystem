<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" MasterPageFile="~/User/GuestMaster.Master" Inherits="SocietyManagementSystem.User.ContactUs" %>


<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server" >
     <h1><b>Contact Us</b></h1><br />
     <asp:Label ID="lblContact" runat="server" Text="You can contact us via email or phone call.
     EMAIL:societymanagement@gmail.com
     
  " Font-Size="Large" ForeColor="#000099" Width="500"></asp:Label> 
        </asp:Content>

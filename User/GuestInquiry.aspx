<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestInquiry.aspx.cs" MasterPageFile="~/User/GuestMaster.Master" Inherits="SocietyManagementSystem.User.GuestInquiry" %>

<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server" >
     <h1><b>Inquiry</b></h1><br />
     <table style="width: 757px; font-size: large; color: #000099;">
    
    <tr>
    <td style="width: 178px">
        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtName" ErrorMessage="Please Enter Your Name"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td style="width: 178px">
        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </td>
    <td>  
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtEmail" ErrorMessage="Please Enter Email"></asp:RequiredFieldValidator>
    </td>
    <td>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtEmail" ErrorMessage="Enter Email Properly " 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td>
   
    <tr>
    <td style="width: 178px">
        <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
    </td>
    
    </tr>
    <tr>
    <td style="width: 178px">
    <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="txtMessage" runat="server"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="txtMessage" ErrorMessage="Enter Your Message"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
            onclick="btnSubmit_Click" />
    </td>
    </tr>  
    
     </table>
        <asp:GridView ID="grdInquiry" runat="server" AutoGenerateColumns="True" 
             Width="1000px" ForeColor="#000099" Font-Size="Large">
            
            </asp:GridView>
             
     
     </asp:Content>
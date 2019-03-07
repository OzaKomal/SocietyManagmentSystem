<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.Notification" %>

 <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
         .style2
         {
             width: 272px;
         }
         .style3
         {
             width: 112px;
         }
     </style>
    </asp:Content>
    

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Notification</b></h1><br />
     <table style="width: 758px; color: #000099; font-size: large;">
        <tr>
            <td class="style3">
                <asp:Label ID="lblType" runat="server" Text="Type Of Notification"></asp:Label> 
            </td>
            <td class="style2">
                <asp:RadioButton ID="rbNotice" runat="server" GroupName="Type" Text="Notice" 
                    AutoPostBack="True" oncheckedchanged="rbNotice_CheckedChanged" />
                <asp:RadioButton ID="rbInvitation" runat="server" GroupName="Type" 
                    Text="Invitation" AutoPostBack="True" 
                    oncheckedchanged="rbInvitation_CheckedChanged" />
                <asp:RadioButton ID="rbAdvertisement" runat="server" GroupName="Type" 
                    Text="Advertisement" AutoPostBack="True" 
                    oncheckedchanged="rbAdvertisement_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="lblNotificationType" runat="server" Text="Notification Type"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtType" runat="server" Rows="3"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="lblNotification" runat="server" Text="Notification"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtNotification" runat="server" Rows="3"></asp:TextBox>
            </td>
        </tr>

        
        <tr>
            <td class="style3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" />
            </td>
        </tr>
     </table>
         <asp:GridView ID="grdNotification" runat="server" Width="753px" Font-Size="Large" ForeColor="#000099">
         </asp:GridView>
     </asp:Content>

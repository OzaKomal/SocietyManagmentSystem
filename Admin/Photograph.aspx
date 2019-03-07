<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Photograph.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.Photograph" %>
    <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
            .style1
            {
                width: 209px;
            }
        </style>
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Photographs</h1></b></big><br />
    <table>
    <tr>
    <td class="style1">
        <asp:Label ID="lblevent" runat="server" Text="Event types"></asp:Label>
    </td>
    <td>
            <asp:DropDownList ID="eventdd" runat="server" CssClass="styledselect_form_1">
                <asp:ListItem>Party</asp:ListItem>
                <asp:ListItem>Uttrayan</asp:ListItem>
                <asp:ListItem>Holi</asp:ListItem>
                <asp:ListItem>Games</asp:ListItem>
                <asp:ListItem></asp:ListItem>

            </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td class="style1">
    <asp:FileUpload ID="fileupload1" runat="server"  />
    </td>
    
    <td>
    <asp:Button ID="btnUpload" Text="Upload" runat="server" Width="73px" onclick="btnUpload_Click" />
    </td>
    <td>                     
    <asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="#000099"></asp:Label>
    </td>
    </tr>
    </table>  
        <asp:GridView ID="GridView1" runat="server" Width="664px" >
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [Photo_name], [Photo] FROM [Photo_details]">
        </asp:SqlDataSource>
    
   </asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.Member" %>


     <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    
         
</asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Member</big></b></h1><br />
    <table>
        <tr>
        <td>
            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" CssClass="inp-form"></asp:TextBox>
        </td>
        
        </tr>
        <tr>
        <td>
            <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtContact" runat="server" CssClass="inp-form"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="inp-form"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td >
            <asp:Label ID="lblBirthdate" runat="server" Text="Birthdate" ></asp:Label>
        <td>
            <asp:TextBox ID="txtBirthdate" runat="server" CssClass="inp-form"></asp:TextBox>
	  	</td>
        </tr>
        <tr>
        <td>
             <asp:Label ID="lblAdmin" runat="server" Text="Is Admin" ></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAdmin" runat="server" CssClass="inp-form"></asp:TextBox>
	  	</td>
        </tr>
        <tr>
        <td>
             <asp:Label ID="lbluser" runat="server" Text="UserName" ></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtUser" runat="server" CssClass="inp-form"></asp:TextBox>
	  	</td>
        </tr>
        <tr>
        <td>
             <asp:Label ID="lblPass" runat="server" Text="Password" ></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPass" runat="server" CssClass="inp-form"></asp:TextBox>
	  	</td>
        </tr>
        <tr>
    <td>
        <asp:Button ID="btnInsert" runat="server" onclick="btnInsert_Click" 
            Text="Insert" />
    </td>
   
    <td>
        <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
            Text="Cancel" />
    </td>
     <td>
            <asp:HiddenField ID="UpdateID" runat="server" />
    </td>
    </tr>
     </table>
    
        <asp:GridView ID="grdMember" runat="server" AllowPaging="True" 
        DataKeyNames="Member_id"  onrowdeleting="grdMember_RowDeleting" 
         onpageindexchanging="grdMember_PageIndexChanging" 
         onselectedindexchanged="grdMember_SelectedIndexChanged" Width="658px">
         
        <Columns>
            <asp:CommandField ShowDeleteButton="True" 
                DeleteImageUrl="img/action_delete.gif" />
                
               
            <asp:ButtonField CommandName="Select" HeaderText="Edit" Text="Edit" ImageUrl="img/action_edit.gif" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
    
    </asp:GridView>  
    
   </asp:Content>
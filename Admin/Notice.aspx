<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.Notice" %>

<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Notice</big></b></h1<br />
    <table>
     <tr>
            <td>
                <asp:Label ID="lblid" runat="server" Text="Member id"></asp:Label>        
            </td>
            <td>
                <asp:TextBox ID="txtid" runat="server" CssClass="inp-form"></asp:TextBox>        
            </td>
            </tr>
     <tr>
                 
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Member Name"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtName" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
             <tr>
                 
                <td>
                    <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtDate" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblNotice" runat="server" Text="Notice"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtNotice" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnDone" runat="server" Text="Done" onclick="btnDone_Click"></asp:Button>        
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
   
    <asp:GridView ID="grdNotice" runat="server" AllowPaging="True" DataKeyNames="Notice_id" AllowSorting="true" CssClass="table" 
        onrowdeleting="grdNotice_RowDeleting" onpageindexchanging="grdNotice_PageIndexChanging" PageSize="10" onselectedindexchanged="grdNotice_SelectedIndexChanged">
        <HeaderStyle CssClass="table-header-repeat" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="ActionEdit" Text="Edit" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
        </asp:GridView>
    </asp:Content>

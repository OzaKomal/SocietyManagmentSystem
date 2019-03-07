<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meeting.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.Meeting" %>

<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Meeting</big></b></h1><br />
    <table>
             <tr>
                 
                <td>
                    <asp:Label ID="lblType" runat="server" Text="Meeting Type"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtType" runat="server" CssClass="inp-form"></asp:TextBox>        
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
                    <asp:Label ID="lblConclusion" runat="server" Text="Conclusion"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtConclusion" runat="server" CssClass="inp-form"></asp:TextBox>        
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
    
    <asp:GridView ID="grdMeeting" runat="server" AllowPaging="True" DataKeyNames="Meeting_id" CssClass="table" AllowSorting="true"
        onrowdeleting="grdMeeting_RowDeleting" onpageindexchanging="grdMeeting_PageIndexChanging" PageSize="10" onselectedindexchanged="grdMeeting_SelectedIndexChanged">
        <HeaderStyle CssClass="table-header-repeat" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="Edit" Text="Edit" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
        </asp:GridView>
    </asp:Content>
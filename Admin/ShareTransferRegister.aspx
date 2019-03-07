<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareTransferRegister.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.ShareTransferRegister" %>
    <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Share Transfer Register Document</h1></b></big><br />
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
                    <asp:Label ID="lblDateofTransfer" runat="server" Text="Date Of Transfer"></asp:Label>   -
                </td>
                <td>
                    <asp:TextBox ID="txtDateofTransfer" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTransferredNumber" runat="server" Text="Transferred Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTransferredNumber" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>  
                    <asp:Label ID="lblNumberOfShare" runat="server" Text="Number Of Share"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNumberOfShare" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCashbookPageNumber" runat="server" Text="Cashbook Page Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCashbookPageNumber" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTransferrerName" runat="server" Text="Transferrer Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTransferrerName" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSecretaryName" runat="server" Text="Secretary Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSecretaryName" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblChairmanNamr" runat="server" Text="Chairman Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtChairmanName" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Button ID="btnDone" runat="server" Text="Submit" onclick="btnDone_Click1" />
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
        <asp:GridView ID="grdTransfer" runat="server" AllowPaging="True" DataKeyNames="Document_id" CssClass="true" AllowSorting="true" 
        onrowdeleting="grdTransfer_RowDeleting" onpageindexchanging="grdTransfer_PageIndexChanging" PageSize="10" onselectedindexchanged="grdTransfer_SelectedIndexChanged">
        <HeaderStyle CssClass="table-header-repeat" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="ActionEdit" Text="Edit" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
        </asp:GridView>
   </asp:Content>

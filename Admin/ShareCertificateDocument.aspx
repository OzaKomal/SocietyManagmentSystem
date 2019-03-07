<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareCertificateDocument.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.ShareCertificateDocument" %>

 <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Share Certificate Document</h1></b></big><br />
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
                    <asp:Label ID="lblTransferNum" runat="server" Text="Transfer Number"></asp:Label>   -
                    
                   
                </td>
                <td>
                    <asp:TextBox ID="txtTransferNum" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLedger" runat="server" Text="Ledger Page Number"></asp:Label>   -
                    
                   
                </td>
                <td>
                    <asp:TextBox ID="txtLedger" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTransferer" runat="server" Text="Transferer Name"></asp:Label>   -
                    
                   
                </td>
                <td>
                    <asp:TextBox ID="txtTransferer" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTotalshare" runat="server" Text="Total Share"></asp:Label>   -
                    
                   
                </td>
                <td>
                    <asp:TextBox ID="txtTotalshare" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnDone" runat="server" Text="Submit" onclick="btnDone_Click" />
                </td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" Text="Cancel" />
                </td>
                <td>
                    <asp:HiddenField ID="UpdateID" runat="server" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="grdShareCerti" runat="server" AllowPaging="True" DataKeyNames="Share_transfer_id" CssClass="table" AllowSorting="true"
        onrowdeleting="grdShareCerti_RowDeleting" onpageindexchanging="grdShareCerti_PageIndexChanging" PageSize="10" onselectedindexchanged="grdShareCerti_SelectedIndexChanged">
        <HeaderStyle CssClass="table-header-repeat" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="ActionEdit" Text="Edit" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
        </asp:GridView>
    </asp:Content>

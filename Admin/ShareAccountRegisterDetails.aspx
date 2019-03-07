<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareAccountRegisterDetails.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.ShareAccountRegisterDetails" %>



<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Share Account Register Details</h1></b></big><br />
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
                    <asp:Label ID="lblShareCertificateNumber" runat="server" Text="Share Certificate Number"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtShareCertificateNumber" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblCRDateOfShare" runat="server" Text="CR Date Of Share"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtCRDateOfShare" runat="server" CssClass="inp-form"> </asp:TextBox>        
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="lblIssuingDateOfShare" runat="server" Text="Issuing Date Of Share"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtIssuingDateOfShare" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="lblNumberOfShares" runat="server" Text="Number Of Shares"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtNumberOfShares" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblPriceOfShare" runat="server" Text="Price Of Share"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtPriceOfShare" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDateOfTransfer" runat="server" Text="Date Of Transfer"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtDateOfTransfer" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTransfereeName" runat="server" Text="Transferee Name"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtTransfereeName" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTransfererName" runat="server" Text="Transferer Name"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtTransfererName" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRemarks" runat="server" Text="Remarks"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtRemarks" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBank" runat="server" Text="Bank Name & Address"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtBank" runat="server" CssClass="form-textarea"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnDone" runat="server" Text="Done" OnClick="btnDone_Click" ></asp:Button>        
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
        <asp:GridView ID="grdShareAccount" runat="server" AllowPaging="True" DataKeyNames="Transfer_id" CssClass="table" AllowSorting="true"
          onrowdeleting="grdShareAccount_RowDeleting" onpageindexchanging="grdShareAccount_PageIndexChanging" PageSize="10" onselectedindexchanged="grdShareAccount_SelectedIndexChanged">
        <HeaderStyle CssClass="table-header-repeat" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="ActionEdit" Text="Edit" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
        </asp:GridView>
   </asp:Content>

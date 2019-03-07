<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalShareAccountDetails.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.PersonalShareAccountDetails" %>

      <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Personal Share Account Details</h1></b></big><br />
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
                    <asp:Label ID="lblCashBookNumber" runat="server" Text="CashBook Number"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtCashBookNumber" runat="server" CssClass="inp-form" ></asp:TextBox>        
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="lblShareNumber" runat="server" Text="Share Number"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtShareNumber" runat="server" CssClass="inp-form"></asp:TextBox>        
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
                    <asp:Label ID="lblAmountOfCr" runat="server" Text="Amount Of CR"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtAmountOfCr" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAmountOfDr" runat="server" Text="Amount Of DR"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtAmountOfDr" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBalance" runat="server" Text="Balance"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtBalance" runat="server" CssClass="inp-form"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnDone" runat="server" Text="Submit" onclick="btnDone_Click"></asp:Button>        
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
         <asp:GridView ID="grdPersonalShare" runat="server" AllowPaging="True" 
             DataKeyNames="Personal_id" CssClass="table" AllowSorting="true"
        onrowdeleting="grdPersonalShare_RowDeleting" 
             onpageindexchanging="grdPersonalShare_PageIndexChanging" PageSize="10" 
             onselectedindexchanged="grdPersonalShare_SelectedIndexChanged" Width="679px">
       <HeaderStyle CssClass="table-header-repeat" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="Edit" Text="Edit" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
        </asp:GridView>

        </asp:Content>


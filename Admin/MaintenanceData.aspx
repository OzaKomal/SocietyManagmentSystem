<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintenanceData.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.MaintenanceData" %>

    <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Maintenance Data</big></b></h1><br />
         <table>
     <tr>
        <td>
            <asp:Label ID="lblFrom" runat="server" Text="From Date"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtFrom" runat="server" CssClass="inp-form"></asp:TextBox> 
        </td>
     </tr>
     <tr>
        <td>
            <asp:Label ID="lblTo" runat="server" Text="To"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTo" runat="server" CssClass="inp-form"></asp:TextBox> 
        </td>
     </tr>
     <tr>
        <td>
            <asp:Label ID="lblYearly" runat="server" Text="Yearly Amount"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtYearly" runat="server" CssClass="inp-form"></asp:TextBox> 
        </td>
     </tr>
     <tr>
        <td>
            <asp:Label ID="lblQuarterly" runat="server" Text="Quarterly Amount"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtQuarterly" runat="server" CssClass="inp-form"></asp:TextBox> 
        </td>
     </tr>
     <tr>
        <td>
            <asp:Label ID="lblMonthly" runat="server" Text="Monthly Amount"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtMonthly" runat="server" CssClass="inp-form"></asp:TextBox> 
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
         <asp:GridView ID="grdMaintenanceDetail" runat="server"  AllowPaging="True" DataKeyNames="MD_ID"
        onrowdeleting="grdMaintenanceDetail_RowDeleting" 
             onpageindexchanging="grdMaintenanceDetail_PageIndexChanging" 
             onselectedindexchanged="grdMaintenanceDetail_SelectedIndexChanged" 
             Width="668px">
        <Columns>
        <asp:ButtonField CommandName="Select" HeaderText="Edit" Text="Edit" />
           <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
            
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
         </asp:GridView>

         </asp:Content>



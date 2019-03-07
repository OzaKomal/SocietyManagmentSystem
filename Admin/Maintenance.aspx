<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.Maintenance" %>
        


    <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Maintenance</big></b></h1><br />
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
            <asp:Label ID="Lbltype" runat="server" Text="Type of payment"></asp:Label>
            
        </td>
        <td>
            <asp:DropDownList ID="Ddltype" runat="server" AutoPostBack="True" CssClass="styledselect_form_1">
                <asp:ListItem>Monthly</asp:ListItem>
                <asp:ListItem>Quaterly</asp:ListItem>
                <asp:ListItem>Yearly</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblMaintenanceof" runat="server" Text="Maintenance" ></asp:Label>
    </td>
    <td>
        <asp:Label ID="lblfrom" runat="server" Text="From"></asp:Label>
        <asp:TextBox ID="txtfrom" runat="server" CssClass="inp-form"></asp:TextBox>
    </td>
    <td>
        <asp:Label ID="lblto" runat="server" Text="To"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="txtto" runat="server" CssClass="inp-form"></asp:TextBox>
    </td>
    </tr>
    </table>

    <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged" ></asp:Calendar>
        
     
        <table>
         
         
        <tr>
        <td>
         <asp:Label ID="lblActualAmt" runat="server" Text="Actual Amount"></asp:Label>
         </td>
         <td>
             <asp:TextBox ID="txtActualAmt" runat="server" CssClass="inp-form"></asp:TextBox>
         </td>
         </tr>
        <tr>
        <td>
         <asp:Label ID="lblamtpaid" runat="server" Text="Amount Paid"></asp:Label>
         </td>
         <td>
             <asp:TextBox ID="txtamtpaid" runat="server" CssClass="inp-form"></asp:TextBox>
         </td>
         </tr>
         <tr>
        <td>
         <asp:Label ID="lblAmtRemaining" runat="server" Text="Remaining Amount"></asp:Label>
         </td>
         <td>
             <asp:TextBox ID="txtRemaining" runat="server" CssClass="inp-form"></asp:TextBox>
         </td>
         </tr>
         <tr>
         <td>
             <asp:Button ID="btnDone" runat="server" Text="Done" />
         </td>
         <td>
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
         </td>
          <td>
                    <asp:HiddenField ID="UpdateID" runat="server" />
                </td>
         </tr>
        </table>

         <asp:GridView ID="grdMaintenance" runat="server" Width="652px" AllowPaging="True" 
             DataKeyNames="M_id" CssClass="table" AllowSorting="True"
        onrowdeleting="grdMaintenance_RowDeleting" 
             onpageindexchanging="grdMaintenance_PageIndexChanging" 
             onselectedindexchanged="grdMaintenance_SelectedIndexChanged">
             <HeaderStyle CssClass="table-header-repeat" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="Edit" Text="Edit" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
         </asp:GridView>
       
       </asp:Content>
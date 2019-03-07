<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpenseIncome.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.ExpenseIncome" %>
    
    
    <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Expense/Income</big></b></h1><br />
    <table>
    <tr>
        <td>
            <asp:Label ID="lblExpInc" runat="server" Text="Expense/Income"></asp:Label> 
        </td>
        <td>
            <asp:DropDownList ID="ddlExpInc" runat="server" AutoPostBack="True" CssClass="styledselect_form_1">
                <asp:ListItem>Expense</asp:ListItem>
                <asp:ListItem>Income</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblExpIncType" runat="server" Text="Expense/Income Type"></asp:Label> 
        </td>
        <td>
            <asp:DropDownList ID="ddlExpIncType" runat="server" AutoPostBack="True" CssClass="styledselect_form_1">
                <asp:ListItem>Parking</asp:ListItem>
                <asp:ListItem>Function</asp:ListItem>
                <asp:ListItem>Tax</asp:ListItem>
                <asp:ListItem>Bills</asp:ListItem>
                <asp:ListItem>Maintenance</asp:ListItem>
             </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAmount" runat="server" CssClass="inp-form"></asp:TextBox>
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
            <asp:Label ID="lblTotalLiabilities" runat="server" Text="Total Liabilities"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTotalLiabilities" runat="server" CssClass="inp-form"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="lblTotalAssets" runat="server" Text="Total Assets"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTotalAssets" runat="server" CssClass="inp-form"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>
                <asp:Button ID="btnDone" runat="server" Text="Done" onclick="btnDone_Click" ></asp:Button>        
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
    <asp:GridView ID="grdExpInc" runat="server" AllowPaging="True" DataKeyNames="ID" AllowSorting="true" CssClass="table"  
        onrowdeleting="grdExpInc_RowDeleting" onpageindexchanging="grdExpInc_PageIndexChanging" PageSize="10" onselectedindexchanged="grdExpInc_SelectedIndexChanged">
         <HeaderStyle CssClass="table-header-repeat" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="ActionEdit" Text="Edit" />
        </Columns>
       <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
        </asp:GridView>
   </asp:Content>
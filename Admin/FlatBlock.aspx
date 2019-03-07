<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlatBlock.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.FlatDetails" %>

    <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Flat Details</big></b></h1><br />
    <table>
        <tr>
            <td>
                <asp:Label ID="lblSocName" runat="server" Text="Society Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSocName" runat="server" CssClass="inp-form"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblBlockName" runat="server" Text="Block Name"></asp:Label>
            </td>
           <td>
                <asp:TextBox ID="txtBlockName" runat="server" CssClass="inp-form"></asp:TextBox>
            <td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTotalFlat" runat="server" Text="Total Flats"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTotalFlat" runat="server" CssClass="inp-form"></asp:TextBox>
            </td>
        </tr>
         
        <tr>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" onclick="btnSubmit_Click"/> 
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
        <asp:GridView ID="grdFlat" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
              AllowSorting="True" CssClass="table"
        onrowdeleting="grdFlat_RowDeleting" 
             onpageindexchanging="grdFlat_PageIndexChanging" 
             onselectedindexchanged="grdFlat_SelectedIndexChanged"
             DataSourceID="sdsFlat" Width="640px">
            <HeaderStyle CssClass="table-header-repeat" />
            <Columns>
            
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ButtonField CommandName="Select" HeaderText="Edit" Text="Edit" />
                <asp:BoundField DataField="Society_name" HeaderText="Society Name" 
                    SortExpression="Society_name" />
                <asp:BoundField DataField="Block_name" HeaderText="Block Name" 
                    SortExpression="Block_name" />
                <asp:BoundField DataField="Total_flats" HeaderText="Total Flats" 
                    SortExpression="Total_flats" />
            </Columns>
            <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PageButtonCount="10" PreviousPageText="Previous" /> 
        </asp:GridView>
         <asp:SqlDataSource ID="sdsFlat" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             SelectCommand="SELECT [Society_name], [Block_name], [Total_flats] FROM [Flat_Block]">
         </asp:SqlDataSource>
    </asp:Content>
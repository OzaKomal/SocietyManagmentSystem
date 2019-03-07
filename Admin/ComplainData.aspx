<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplainData.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.ComplainData" %>

<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
    <h1><b><big>Complains</big></b></h1><br />
    
     <asp:GridView ID="grdComplaints" runat="server" 
             onselectedindexchanged="grdNotice_SelectedIndexChanged" AllowSorting="True" 
             CssClass="table" DataKeyNames="Complain_id" Width="662px">
         <Columns>
             <asp:ButtonField CommandName="Select" HeaderText="Edit" Text="Edit" />
         </Columns>
         <HeaderStyle CssClass="table-header-repeat" />
        </asp:GridView>
     <table>
     <tr>
                <td>
                    <asp:Label ID="lblSolution" runat="server" Text="Solution"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSolution" runat="server" CssClass="inp-form"></asp:TextBox>
                </td>
            </tr>
     <tr>
                <td>
                    <asp:Button ID="btnDone" runat="server" Text="Update" onclick="btnDone_Click"></asp:Button>        
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
    
    </asp:Content>
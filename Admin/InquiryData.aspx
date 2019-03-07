<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InquiryData.aspx.cs" MasterPageFile="~/Admin/AdMaster.Master" Inherits="SocietyManagementSystem.Admin.InquiryData" %>


     <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b><big>Inquiry Data</big></b></h1><br />
    
     <asp:GridView ID="grdInquiry" runat="server" AllowSorting="True" CssClass="table">
         <HeaderStyle CssClass="table-header-repeat" />
        </asp:GridView>

    
    </asp:Content>
        
   
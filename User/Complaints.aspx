<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.Complaints" %>

<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 123px;
        }
    </style>
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Complaints</b></h1><br />
        <table style="width: 671px; color: #000099; font-size: large;">
             <tr>
                <td>
                    <asp:Label ID="lblMemberName" runat="server" Text="Member Name"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtMemberName" runat="server"></asp:TextBox>        
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="lblComplain" runat="server" Text="Complain"></asp:Label>        
                </td>
                <td>
                     <asp:TextBox ID="txtComplain" runat="server"></asp:TextBox>        
                </td>
            </tr>
            
            <tr>
                <td >
                    <asp:Label ID="lblComplainDate" runat="server" Text="Complain Date"></asp:Label>        
                </td>
                <td> 
                    <asp:TextBox ID="txtComplainDate" runat="server"></asp:TextBox> 
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" />    
                </td>
                
            </tr>
        </table>
         <asp:GridView ID="grdComplaint" runat="server" AutoGenerateColumns="False" 
             DataSourceID="sdsComplaint" Width="666px" Font-Size="Large" ForeColor="#000099">
             <Columns>
                 <asp:BoundField DataField="Member_name" HeaderText="Member_name" 
                     SortExpression="Member_name" />
                 <asp:BoundField DataField="Complain" HeaderText="Complain" 
                     SortExpression="Complain" />
                 <asp:BoundField DataField="Complain_Date" HeaderText="Complain_Date" 
                     SortExpression="Complain_Date" />
                 <asp:BoundField DataField="Solution" HeaderText="Solution" 
                     SortExpression="Solution" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="sdsComplaint" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             SelectCommand="SELECT [Member_name], [Complain], [Complain_Date], [Solution] FROM [Complain]">
         </asp:SqlDataSource>
    </asp:Content>
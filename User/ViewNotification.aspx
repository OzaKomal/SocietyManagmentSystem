<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewNotification.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.ViewNotification" %>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 475px;
        }
        .style3
        {
            width: 293px;
        }
    </style>
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Notification</b></h1><br />
     <table style="color: #000099; font-size: large">
     <tr>
        <td>
            <asp:RadioButton ID="rbNotice" runat="server" GroupName="Type" Text="notice" 
                AutoPostBack="True" oncheckedchanged="rbNotice_CheckedChanged" />  
        </td>
        <td>
            <asp:RadioButton ID="rbAdvertisment" runat="server" GroupName="Type" 
                Text="advertisement" AutoPostBack="True" oncheckedchanged="rbAdvertisment_CheckedChanged"/>  
        </td>
        <td>
            <asp:RadioButton ID="rbInvitation" runat="server" GroupName="Type" 
                Text="invitation" AutoPostBack="True" 
                oncheckedchanged="rbInvitation_CheckedChanged" />  
        </td>
        <td>
            <asp:HiddenField ID="hfType" runat="server"  />
        </td>
     </tr>
     </table>
     <table style="color: #000099; font-size: large">
     <tr>
        <td class="style2">
            <asp:GridView ID="grdNotice" runat="server" DataSourceID="sdsNotice" 
                AutoGenerateColumns="False" Width="671px">
                <Columns>
                    <asp:BoundField DataField="Notice_type" HeaderText="Notice_type" 
                        SortExpression="Notice_type" />
                    <asp:BoundField DataField="Date_of_notice" HeaderText="Date_of_notice" 
                        SortExpression="Date_of_notice" />
                    <asp:BoundField DataField="Notice" HeaderText="Notice" 
                        SortExpression="Notice" />
                </Columns>
            </asp:GridView>
        </td>
        <td>
        
            <asp:GridView ID="grdAdvertisements" runat="server" AutoGenerateColumns="False" 
                DataSourceID="sdsAdvetisement" Width="517px" Font-Size="Large" ForeColor="#000099">
                <Columns>
                    <asp:BoundField DataField="Notice_type" HeaderText="Notice_type" 
                        SortExpression="Notice_type" />
                    <asp:BoundField DataField="Date_of_notice" HeaderText="Date_of_notice" 
                        SortExpression="Date_of_notice" />
                    <asp:BoundField DataField="Notice" HeaderText="Notice" 
                        SortExpression="Notice" />
                </Columns>
            </asp:GridView>
         </td>
         <td class="style3">
            <asp:GridView ID="grdInvitations" runat="server" AutoGenerateColumns="False" 
                 DataSourceID="sdsInvitation" Width="495px">
                <Columns>
                    <asp:BoundField DataField="Notice_type" HeaderText="Notice_type" 
                        SortExpression="Notice_type" />
                    <asp:BoundField DataField="Date_of_notice" HeaderText="Date_of_notice" 
                        SortExpression="Date_of_notice" />
                    <asp:BoundField DataField="Notice" HeaderText="Notice" 
                        SortExpression="Notice" />
                </Columns>
            </asp:GridView>
         </td>
     </tr>
     <tr>
        <td>
            <asp:SqlDataSource ID="sdsNotice" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Notice_type], [Date_of_notice], [Notice] FROM [Notice_Details] WHERE ([Notice_type] = @Notice_type)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfType" Name="Notice_type" 
                        PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td>
            <asp:SqlDataSource ID="sdsAdvetisement" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT [Notice_type], [Date_of_notice], [Notice] FROM [Notice_Details] WHERE ([Notice_type] = @Notice_type)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfType" Name="Notice_type" 
                        PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td class="style3">
            <asp:SqlDataSource ID="sdsInvitation" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Notice_type], [Date_of_notice], [Notice] FROM [Notice_Details] WHERE ([Notice_type] = @Notice_type)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfType" Name="Notice_type" 
                        PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
     </tr>
     </table>
     </asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeetingData.aspx.cs" MasterPageFile="~/User/MemberMaster.Master" Inherits="SocietyManagementSystem.User.MeetingData" %>

     <asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Meetings</b></h1><br />
     <asp:GridView ID="grdMeeting" runat="server" AutoGenerateColumns="False" 
            DataSourceID="sdsMeetingData" Width="733px" Font-Size="Large" ForeColor="#000099">
         <Columns>
             <asp:BoundField DataField="Meeting_type" HeaderText="Meeting Type" 
                 SortExpression="Meeting_type" />
             <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
             <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                 SortExpression="Remarks" />
         </Columns>
                </asp:GridView>

        <asp:SqlDataSource ID="sdsMeetingData" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [Meeting_type], [Date], [Remarks] FROM [Meeting]">
        </asp:SqlDataSource>

    </asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentData.aspx.cs" MasterPageFile="~/User/GuestMaster.Master" Inherits="SocietyManagementSystem.User.DocumentData" %>

<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 242px;
        }
        .style2
        {
            width: 38px;
        }
    </style>
    </asp:Content>

     <asp:Content ID="maincontent" ContentPlaceHolderID="main" runat="server">
     <h1><b>Documents</b></h1><br />
        <table frame="box" border="bold" style="width: 835px; margin-right: 3px; font-size: large; color: #000099;">
        <tr>
            <th >
                DOCUMENT
            </th>
            <th >
                DESCRIPTION
            </th>
        </tr>
        <tr>
            <td >
                Personal Share Account
            </td>
            <td >
                It contains the information about the owners share account related to the flat.
            </td>
        </tr>
        <tr>
            <td >
                Share Account Register
            </td>
            <td >
                Contains information of all the members of the society owning a flat regarding their shares.
            </td>
        </tr>
        <tr>
            <td >
                Share Transfer Register
            </td>
            <td >
                It maintains the transfer details of society’s share from one owner to another.
            </td>
        </tr>
        <tr>
            <td >
                Share Certificate
            </td>
            <td >
                It states that the person is the member of the society.<br />
                Contains the information about owner of the flat.<br />
                On share certificate, there is a table which shows the transfer of ownership from one person to another.<br />
                It has information regarding the number of shares of the society which are owned by the owner.<br />
                It also mentions that each and every rule of the society is required to be followed by the owner.<br />
                If anyone wants to transfer the ownership of the flat it has to be mentioned in the share certificate.<br />
                It also maintains the hierarchy of the owners of a particular flat.

            </td>
        </tr>
        </table>
     </asp:Content>

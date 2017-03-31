<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RapportList.aspx.cs" Inherits="DX_DAHERCMS.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div>Etape 2 : Selection du Rapport</div>

            <div>
                <h1>Report Catalog </h1>
                <p>Use the form below to manage reports in the catalog.</p>
            </div>
            <div>
                <asp:ListBox ID="reportsList" runat="server" Width="600px" Height="150px"></asp:ListBox>
            </div>
            <div>
                <%--            <asp:Button CssClass="catalogButton" ID="Button1" runat="server" Text="Open"
                OnClick="Button1_Click" />--%>
                <asp:Button CssClass="catalogButton" ID="editButton" runat="server" Text="Edit"
                    OnClick="EditButton_Click"/>
                <asp:Button CssClass="catalogButton" ID="deleteButton" runat="server" Text="Delete"
                    OnClick="DeleteButton_Click" />
            </div>
            <div>
                <asp:Button CssClass="catalogButton" ID="newReportButton" runat="server"
                    Text="New Report" OnClick="NewReportButton_Click" />
            </div>

</asp:Content>

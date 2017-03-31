<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VBSP_DEPART.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.VBSP.VBSP_DEPART" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Common" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Diagnostics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Scan Part Number"></dx:ASPxLabel>
    <dx:ASPxTextBox ID="txt_pn" runat="server" Width="170px" AutoPostBack="True" OnTextChanged="txt_pn_TextChanged"/>
     
    <dx:ASPxTextBox ID="txt_date" runat="server" Width="170px" Enabled="false" ReadOnly="true" Visible="false"></dx:ASPxTextBox>
    <dx:ASPxLabel runat="server" ID="ASPxLabel" Text="ASPxLabel" Visible="false"></dx:ASPxLabel>

        
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="PN" Theme="Default" EnableTheming="True">
        <Settings ShowGroupPanel="True" ShowFilterRow="True" />
        <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="True" AllowSelectByRowClick="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="PN" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EMPL" GroupIndex="0" SortIndex="0" SortOrder="Ascending" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LOADPLAN" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="STATUS" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="COMMENT" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PRIORITE" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DateDepart" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        
        SelectCommand="SELECT * FROM [VBSP_Import]" 
        UpdateCommand="UPDATE [VBSP_Import] SET [DateDepart] = @DateDepart WHERE RTRIM(LTRIM([PN])) = @original_PN" 
        OnUpdating="SqlDataSource1_Updating" OnUpdated="SqlDataSource1_Updated">      
        
        <UpdateParameters>
           <asp:ControlParameter Name="DateDepart" ControlID="txt_date" PropertyName="Text" />
            <asp:ControlParameter Name="original_PN" ControlID="txt_pn" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
    
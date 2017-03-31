<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_EDITION_MAGASIN.aspx.cs" Inherits="DX_DAHERCMS.Ordo_Tools.ORDO_EDITION_MAGASIN" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>Edition Perimetre Magasin</div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:laboConnectionString %>" 
        DeleteCommand="DELETE FROM [T_Ordo_PerimetreMagasin] WHERE [Id_Magasin] = @original_Id_Magasin AND [ID] = @original_ID AND (([Societe] = @original_Societe) OR ([Societe] IS NULL AND @original_Societe IS NULL)) AND (([VOIR] = @original_VOIR) OR ([VOIR] IS NULL AND @original_VOIR IS NULL))" 
        InsertCommand="INSERT INTO [T_Ordo_PerimetreMagasin] ([Id_Magasin], [Societe], [VOIR]) VALUES (@Id_Magasin, @Societe, @VOIR)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [T_Ordo_PerimetreMagasin]" 
        UpdateCommand="UPDATE [T_Ordo_PerimetreMagasin] SET  [Societe] = @Societe, [VOIR] = @VOIR WHERE [Id_Magasin] = @original_Id_Magasin AND [ID] = @original_ID AND (([Societe] = @original_Societe) OR ([Societe] IS NULL AND @original_Societe IS NULL)) AND (([VOIR] = @original_VOIR) OR ([VOIR] IS NULL AND @original_VOIR IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id_Magasin" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Societe" Type="String" />
            <asp:Parameter Name="original_VOIR" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id_Magasin" Type="String" />
            <asp:Parameter Name="Societe" Type="String" />
            <asp:Parameter Name="VOIR" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="Societe" Type="String" />
            <asp:Parameter Name="VOIR" Type="String" />
            <asp:Parameter Name="original_Id_Magasin" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Societe" Type="String" />
            <asp:Parameter Name="original_VOIR" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id_Magasin">
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ID"  VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Id_Magasin"  VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Societe" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="VOIR" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowCancelButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButton="True" ShowUpdateButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_EDITION_GARE.aspx.cs" Inherits="DX_DAHERCMS.Ordo_Tools.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:laboConnectionString %>" DeleteCommand="DELETE FROM [T_Ordo_TypeOrdo] WHERE [Id_Gare] = @original_Id_Gare AND (([Cle_Gare] = @original_Cle_Gare) OR ([Cle_Gare] IS NULL AND @original_Cle_Gare IS NULL)) AND (([Designation_Gare] = @original_Designation_Gare) OR ([Designation_Gare] IS NULL AND @original_Designation_Gare IS NULL)) AND (([Type_Ordo] = @original_Type_Ordo) OR ([Type_Ordo] IS NULL AND @original_Type_Ordo IS NULL)) AND (([Libelle_Gare] = @original_Libelle_Gare) OR ([Libelle_Gare] IS NULL AND @original_Libelle_Gare IS NULL)) AND (([Priorite] = @original_Priorite) OR ([Priorite] IS NULL AND @original_Priorite IS NULL)) AND (([Bras_Sortie] = @original_Bras_Sortie) OR ([Bras_Sortie] IS NULL AND @original_Bras_Sortie IS NULL)) AND (([Type_Flux] = @original_Type_Flux) OR ([Type_Flux] IS NULL AND @original_Type_Flux IS NULL))" InsertCommand="INSERT INTO [T_Ordo_TypeOrdo] ([Cle_Gare], [Designation_Gare], [Type_Ordo], [Libelle_Gare], [Priorite], [Bras_Sortie], [Type_Flux]) VALUES (@Cle_Gare, @Designation_Gare, @Type_Ordo, @Libelle_Gare, @Priorite, @Bras_Sortie, @Type_Flux)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_Ordo_TypeOrdo]" UpdateCommand="UPDATE [T_Ordo_TypeOrdo] SET [Cle_Gare] = @Cle_Gare, [Designation_Gare] = @Designation_Gare, [Type_Ordo] = @Type_Ordo, [Libelle_Gare] = @Libelle_Gare, [Priorite] = @Priorite, [Bras_Sortie] = @Bras_Sortie, [Type_Flux] = @Type_Flux WHERE [Id_Gare] = @original_Id_Gare AND (([Cle_Gare] = @original_Cle_Gare) OR ([Cle_Gare] IS NULL AND @original_Cle_Gare IS NULL)) AND (([Designation_Gare] = @original_Designation_Gare) OR ([Designation_Gare] IS NULL AND @original_Designation_Gare IS NULL)) AND (([Type_Ordo] = @original_Type_Ordo) OR ([Type_Ordo] IS NULL AND @original_Type_Ordo IS NULL)) AND (([Libelle_Gare] = @original_Libelle_Gare) OR ([Libelle_Gare] IS NULL AND @original_Libelle_Gare IS NULL)) AND (([Priorite] = @original_Priorite) OR ([Priorite] IS NULL AND @original_Priorite IS NULL)) AND (([Bras_Sortie] = @original_Bras_Sortie) OR ([Bras_Sortie] IS NULL AND @original_Bras_Sortie IS NULL)) AND (([Type_Flux] = @original_Type_Flux) OR ([Type_Flux] IS NULL AND @original_Type_Flux IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id_Gare" Type="Int32" />
            <asp:Parameter Name="original_Cle_Gare" Type="String" />
            <asp:Parameter Name="original_Designation_Gare" Type="String" />
            <asp:Parameter Name="original_Type_Ordo" Type="String" />
            <asp:Parameter Name="original_Libelle_Gare" Type="String" />
            <asp:Parameter Name="original_Priorite" Type="Int32" />
            <asp:Parameter Name="original_Bras_Sortie" Type="String" />
            <asp:Parameter Name="original_Type_Flux" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Cle_Gare" Type="String" />
            <asp:Parameter Name="Designation_Gare" Type="String" />
            <asp:Parameter Name="Type_Ordo" Type="String" />
            <asp:Parameter Name="Libelle_Gare" Type="String" />
            <asp:Parameter Name="Priorite" Type="Int32" />
            <asp:Parameter Name="Bras_Sortie" Type="String" />
            <asp:Parameter Name="Type_Flux" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Cle_Gare" Type="String" />
            <asp:Parameter Name="Designation_Gare" Type="String" />
            <asp:Parameter Name="Type_Ordo" Type="String" />
            <asp:Parameter Name="Libelle_Gare" Type="String" />
            <asp:Parameter Name="Priorite" Type="Int32" />
            <asp:Parameter Name="Bras_Sortie" Type="String" />
            <asp:Parameter Name="Type_Flux" Type="String" />
            <asp:Parameter Name="original_Id_Gare" Type="Int32" />
            <asp:Parameter Name="original_Cle_Gare" Type="String" />
            <asp:Parameter Name="original_Designation_Gare" Type="String" />
            <asp:Parameter Name="original_Type_Ordo" Type="String" />
            <asp:Parameter Name="original_Libelle_Gare" Type="String" />
            <asp:Parameter Name="original_Priorite" Type="Int32" />
            <asp:Parameter Name="original_Bras_Sortie" Type="String" />
            <asp:Parameter Name="original_Type_Flux" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Id_Gare" >
        <Settings ShowFilterRow="True" />
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Cle_Gare" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Designation_Gare" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Type_Ordo" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Libelle_Gare" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Priorite" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Bras_Sortie" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Type_Flux" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Id_Gare" ReadOnly="True" VisibleIndex="8">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowCancelButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButton="True" ShowUpdateButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>

</asp:Content>

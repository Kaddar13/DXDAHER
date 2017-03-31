<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_EDITION_MP.aspx.cs" Inherits="DX_DAHERCMS.ORDO_EDITION_MP" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>Edition Ordo</div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID">
        <SettingsDataSecurity AllowDelete="False" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cle_Gare" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Type_Flux" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Priorite" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Bras_Sortie" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:laboConnectionString %>" 
        DeleteCommand="DELETE FROM [T_ORDO_Typologie_Market] WHERE [ID] = @original_ID AND (([Market_Place] = @original_Market_Place) OR ([Market_Place] IS NULL AND @original_Market_Place IS NULL)) AND (([Type_Flux] = @original_Type_Flux) OR ([Type_Flux] IS NULL AND @original_Type_Flux IS NULL)) AND (([Priorite] = @original_Priorite) OR ([Priorite] IS NULL AND @original_Priorite IS NULL)) AND (([Bras_Sortie] = @original_Bras_Sortie) OR ([Bras_Sortie] IS NULL AND @original_Bras_Sortie IS NULL))" 
        InsertCommand="INSERT INTO [T_ORDO_Typologie_Market] ([Market_Place], [Type_Flux], [Priorite], [Bras_Sortie]) VALUES (@Market_Place, @Type_Flux, @Priorite, @Bras_Sortie)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_ORDO_Typologie_Market]" 
        UpdateCommand="UPDATE [T_ORDO_Typologie_Market] SET [Market_Place] = @Market_Place, [Type_Flux] = @Type_Flux, [Priorite] = @Priorite, [Bras_Sortie] = @Bras_Sortie WHERE [ID] = @original_ID AND (([Market_Place] = @original_Market_Place) OR ([Market_Place] IS NULL AND @original_Market_Place IS NULL)) AND (([Type_Flux] = @original_Type_Flux) OR ([Type_Flux] IS NULL AND @original_Type_Flux IS NULL)) AND (([Priorite] = @original_Priorite) OR ([Priorite] IS NULL AND @original_Priorite IS NULL)) AND (([Bras_Sortie] = @original_Bras_Sortie) OR ([Bras_Sortie] IS NULL AND @original_Bras_Sortie IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Market_Place" Type="String" />
            <asp:Parameter Name="original_Type_Flux" Type="String" />
            <asp:Parameter Name="original_Priorite" Type="String" />
            <asp:Parameter Name="original_Bras_Sortie" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Market_Place" Type="String" />
            <asp:Parameter Name="Type_Flux" Type="String" />
            <asp:Parameter Name="Priorite" Type="String" />
            <asp:Parameter Name="Bras_Sortie" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Market_Place" Type="String" />
            <asp:Parameter Name="Type_Flux" Type="String" />
            <asp:Parameter Name="Priorite" Type="String" />
            <asp:Parameter Name="Bras_Sortie" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Market_Place" Type="String" />
            <asp:Parameter Name="original_Type_Flux" Type="String" />
            <asp:Parameter Name="original_Priorite" Type="String" />
            <asp:Parameter Name="original_Bras_Sortie" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

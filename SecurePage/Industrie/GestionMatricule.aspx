<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionMatricule.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.GestionMatricule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView runat="server" ID="GridMatricule" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="XA">
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
        <SettingsSearchPanel Visible="True" />
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="XA">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Nom">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Prénom">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Périmètre">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Activité">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Actif">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="XA" VisibleIndex="1">
                <PropertiesTextEdit>
                     <ValidationSettings>
          <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
     </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nom" VisibleIndex="2">
                <PropertiesTextEdit>
                     <ValidationSettings>
          <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
     </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Prénom" VisibleIndex="3">
                <PropertiesTextEdit>
                     <ValidationSettings>
          <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
     </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Activité" VisibleIndex="5">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="a2" Value="a2" />
                        <dx:ListEditItem Text="a1" Value="a1" />
                    </Items>
                     <ValidationSettings>
          <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
     </ValidationSettings>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Actif" VisibleIndex="6">
                <PropertiesComboBox AllowNull="False">
                     <ValidationSettings>
          <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
     </ValidationSettings>
                    <Items>
                        <dx:ListEditItem Text="OUI" Value="OUI" />
                        <dx:ListEditItem Text="NON" Value="NON" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Périmètre" VisibleIndex="4">
                <PropertiesComboBox AllowNull="False">
                     <ValidationSettings>
          <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
     </ValidationSettings>
                    <Items>
                        <dx:ListEditItem Text="Rechange" Value="Rechange" />
                        <dx:ListEditItem Text="Industrie" Value="Industrie" />
                        <dx:ListEditItem Text="Donauwörth" Value="Donauwörth" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
</dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:IndustrieMagasin_ConnectionString %>" DeleteCommand="DELETE FROM [T_user] WHERE [XA] = @original_XA AND [Nom] = @original_Nom AND [Prénom] = @original_Prénom AND [Périmètre] = @original_Périmètre AND [Activité] = @original_Activité AND [Actif] = @original_Actif" InsertCommand="INSERT INTO [T_user] ([XA], [Nom], [Prénom], [Périmètre], [Activité], [Actif]) VALUES (@XA, @Nom, @Prénom, @Périmètre, @Activité, @Actif)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_user]" UpdateCommand="UPDATE [T_user] SET [Nom] = @Nom, [Prénom] = @Prénom, [Périmètre] = @Périmètre, [Activité] = @Activité, [Actif] = @Actif WHERE [XA] = @original_XA AND [Nom] = @original_Nom AND [Prénom] = @original_Prénom AND [Périmètre] = @original_Périmètre AND [Activité] = @original_Activité AND [Actif] = @original_Actif">
        <DeleteParameters>
            <asp:Parameter Name="original_XA" Type="String" />
            <asp:Parameter Name="original_Nom" Type="String" />
            <asp:Parameter Name="original_Prénom" Type="String" />
            <asp:Parameter Name="original_Périmètre" Type="String" />
            <asp:Parameter Name="original_Activité" Type="String" />
            <asp:Parameter Name="original_Actif" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="XA" Type="String" />
            <asp:Parameter Name="Nom" Type="String" />
            <asp:Parameter Name="Prénom" Type="String" />
            <asp:Parameter Name="Périmètre" Type="String" />
            <asp:Parameter Name="Activité" Type="String" />
            <asp:Parameter Name="Actif" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nom" Type="String" />
            <asp:Parameter Name="Prénom" Type="String" />
            <asp:Parameter Name="Périmètre" Type="String" />
            <asp:Parameter Name="Activité" Type="String" />
            <asp:Parameter Name="Actif" Type="String" />
            <asp:Parameter Name="original_XA" Type="String" />
            <asp:Parameter Name="original_Nom" Type="String" />
            <asp:Parameter Name="original_Prénom" Type="String" />
            <asp:Parameter Name="original_Périmètre" Type="String" />
            <asp:Parameter Name="original_Activité" Type="String" />
            <asp:Parameter Name="original_Actif" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

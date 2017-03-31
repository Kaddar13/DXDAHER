<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_GESTION_MP_CONFNONPOINTE.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion.ORDO_GESTION_MP_CONFNONPOINTE" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function LanguageComboBox_SelectedIndexChanged(s, e) {
            ASPxClientUtils.SetCookie("DXCurrentLanguage", s.GetValue());
        }
</script>
    <dx:ASPxComboBox ID="LanguageComboBox" runat="server" AutoPostBack="True" ShowImageInEditBox="True" Caption="Language :" meta:resourcekey="ASPxComboBoxResource1" AllowNull="False">
             <ItemImage Height="24px" Width="23px" />
        <Items>
            <dx:ListEditItem Text="English" Value="en" meta:resourcekey="ListEditItemResource1" ImageUrl="~/img/UK-icon.png"/>
            <dx:ListEditItem Text="Francais" Value="fr" meta:resourcekey="ListEditItemResource2" ImageUrl="~/img/France-icon.png" />
            <dx:ListEditItem Text="Deutsch" Value="de" meta:resourcekey="ListEditItemResource3" ImageUrl="~/img/Germany-icon.png" />
        </Items>
        <ClientSideEvents SelectedIndexChanged="LanguageComboBox_SelectedIndexChanged" />

<ClearButton Visibility="Auto"></ClearButton>
    </dx:ASPxComboBox>

    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Export" OnClick="ASPxButton1_Click"></dx:ASPxButton>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="Export_NonConf" GridViewID="ASPxGridView1"></dx:ASPxGridViewExporter>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [T_Ordo_confnonpointe]" 
        UpdateCommand="UPDATE [T_Ordo_confnonpointe] SET  [Typologie] = @Typologie, [MagCedant] = @MagCedant, [Commentaires] = @Commentaires WHERE [OTPOSTE] = @original_OTPOSTE">
    
        <DeleteParameters>
            <asp:Parameter Name="original_OTPOSTE" Type="String" />
            <asp:Parameter Name="original_MarketPlace" Type="String" />
            <asp:Parameter Name="original_Appareil" Type="String" />
            <asp:Parameter Name="original_PosApp" Type="String" />
            <asp:Parameter Name="original_Ty" Type="String" />
            <asp:Parameter Name="original_column1" Type="String" />
            <asp:Parameter Name="original_NumeroOT" Type="String" />
            <asp:Parameter Name="original_PosOT" Type="String" />
            <asp:Parameter Name="original_Clegare" Type="String" />
            <asp:Parameter Name="original_DateimpO" Type="String" />
            <asp:Parameter Name="original_DateImpression" Type="String" />
            <asp:Parameter Name="original_Dconf" Type="String" />
            <asp:Parameter Name="original_Daterecep" Type="String" />
            <asp:Parameter Name="original_DateLivra" Type="String" />
            <asp:Parameter Name="original_MPXP_Statut" Type="String" />
            <asp:Parameter Name="original_start" Type="String" />
            <asp:Parameter Name="original_OtSupprime" Type="String" />
            <asp:Parameter Name="original_Typologie" Type="String" />
            <asp:Parameter Name="original_MagCedant" Type="String" />
            <asp:Parameter Name="original_Commentaires" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OTPOSTE" Type="String" />
            <asp:Parameter Name="MarketPlace" Type="String" />
            <asp:Parameter Name="Appareil" Type="String" />
            <asp:Parameter Name="PosApp" Type="String" />
            <asp:Parameter Name="Ty" Type="String" />
            <asp:Parameter Name="column1" Type="String" />
            <asp:Parameter Name="NumeroOT" Type="String" />
            <asp:Parameter Name="PosOT" Type="String" />
            <asp:Parameter Name="Clegare" Type="String" />
            <asp:Parameter Name="DateimpO" Type="String" />
            <asp:Parameter Name="DateImpression" Type="String" />
            <asp:Parameter Name="Dconf" Type="String" />
            <asp:Parameter Name="Daterecep" Type="String" />
            <asp:Parameter Name="DateLivra" Type="String" />
            <asp:Parameter Name="MPXP_Statut" Type="String" />
            <asp:Parameter Name="start" Type="String" />
            <asp:Parameter Name="OtSupprime" Type="String" />
            <asp:Parameter Name="Typologie" Type="String" />
            <asp:Parameter Name="MagCedant" Type="String" />
            <asp:Parameter Name="Commentaires" Type="String" />
        </InsertParameters>
    
        <UpdateParameters>
            <asp:Parameter Name="MarketPlace" Type="String" />
            <asp:Parameter Name="Appareil" Type="String" />
            <asp:Parameter Name="PosApp" Type="String" />
            <asp:Parameter Name="Ty" Type="String" />
            <asp:Parameter Name="column1" Type="String" />
            <asp:Parameter Name="NumeroOT" Type="String" />
            <asp:Parameter Name="PosOT" Type="String" />
            <asp:Parameter Name="Clegare" Type="String" />
            <asp:Parameter Name="DateimpO" Type="String" />
            <asp:Parameter Name="DateImpression" Type="String" />
            <asp:Parameter Name="Dconf" Type="String" />
            <asp:Parameter Name="Daterecep" Type="String" />
            <asp:Parameter Name="DateLivra" Type="String" />
            <asp:Parameter Name="MPXP_Statut" Type="String" />
            <asp:Parameter Name="start" Type="String" />
            <asp:Parameter Name="OtSupprime" Type="String" />
            <asp:Parameter Name="Typologie" Type="String" />
            <asp:Parameter Name="MagCedant" Type="String" />
            <asp:Parameter Name="Commentaires" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="original_OTPOSTE" Type="String" />
            <asp:Parameter Name="original_MarketPlace" Type="String" />
            <asp:Parameter Name="original_Appareil" Type="String" />
            <asp:Parameter Name="original_PosApp" Type="String" />
            <asp:Parameter Name="original_Ty" Type="String" />
            <asp:Parameter Name="original_column1" Type="String" />
            <asp:Parameter Name="original_NumeroOT" Type="String" />
            <asp:Parameter Name="original_PosOT" Type="String" />
            <asp:Parameter Name="original_Clegare" Type="String" />
            <asp:Parameter Name="original_DateimpO" Type="String" />
            <asp:Parameter Name="original_DateImpression" Type="String" />
            <asp:Parameter Name="original_Dconf" Type="String" />
            <asp:Parameter Name="original_Daterecep" Type="String" />
            <asp:Parameter Name="original_DateLivra" Type="String" />
            <asp:Parameter Name="original_MPXP_Statut" Type="String" />
            <asp:Parameter Name="original_start" Type="String" />
            <asp:Parameter Name="original_OtSupprime" Type="String" />
            <asp:Parameter Name="original_Typologie" Type="String" />
            <asp:Parameter Name="original_MagCedant" Type="String" />
            <asp:Parameter Name="original_Commentaires" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="OTPOSTE">
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="Typologie">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="MagCedant">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Commentaires">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="OTPOSTE" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MarketPlace" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Appareil" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PosApp" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Ty" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="N°Ordre" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OtSupprime" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MagCedant" VisibleIndex="19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="21" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Typologie" VisibleIndex="18">
                <PropertiesComboBox AllowNull="False" DataSourceID="DS_TYPO" TextField="TYPOLOGIE" ValueField="ID">
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataMemoColumn FieldName="Commentaires" VisibleIndex="20">
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataDateColumn FieldName="DateImpression" VisibleIndex="14">
                <PropertiesDateEdit DisplayFormatString="&quot;d/m/y&quot;" DisplayFormatInEditMode="True" EditFormat="Custom" EditFormatString="&quot;d/m/y&quot;" >
                    <TimeSectionProperties>
                        <TimeEditProperties>
                            <ClearButton Visibility="Auto">
                            </ClearButton>
                        </TimeEditProperties>
                    </TimeSectionProperties>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesDateEdit>
                <SettingsHeaderFilter>
                    <DateRangePickerSettings DisplayFormatString="m/d/yyy" />
                </SettingsHeaderFilter>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Date de Planif" FieldName="start" VisibleIndex="16">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yy">
<TimeSectionProperties>
<TimeEditProperties>
<ClearButton Visibility="Auto"></ClearButton>
</TimeEditProperties>
</TimeSectionProperties>

                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>

   <asp:SqlDataSource ID="DS_TYPO" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT * FROM [T_Ordo_Confnonpointe_Typologie]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [T_Ordo_Confnonpointe_Typologie] WHERE [ID] = @original_ID AND (([TYPOLOGIE] = @original_TYPOLOGIE) OR ([TYPOLOGIE] IS NULL AND @original_TYPOLOGIE IS NULL))" InsertCommand="INSERT INTO [T_Ordo_Confnonpointe_Typologie] ([TYPOLOGIE]) VALUES (@TYPOLOGIE)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [T_Ordo_Confnonpointe_Typologie] SET [TYPOLOGIE] = @TYPOLOGIE WHERE [ID] = @original_ID AND (([TYPOLOGIE] = @original_TYPOLOGIE) OR ([TYPOLOGIE] IS NULL AND @original_TYPOLOGIE IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_TYPOLOGIE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TYPOLOGIE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TYPOLOGIE" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_TYPOLOGIE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

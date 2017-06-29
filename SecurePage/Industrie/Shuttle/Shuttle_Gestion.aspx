<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shuttle_Gestion.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Shuttle.Shuttle_Gestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function OnDepartChanged(cmbDepart) {
            grid.GetEditor('Arrivee').PerformCallback(cmbDepart.GetValue().toString());
        }
        function OnArriveeChanged(cmbArrivee) {

            grid.GetEditor('Type').PerformCallback(cmbArrivee.GetValue().toString());
            //alert(cmbArrivee.GetValue().toString());
        }
        function OnTypeChanged(cmbType) {

            grid.GetEditor('Tranporteur').PerformCallback(cmbType.GetValue().toString());


        }
        function OnTransporteurChanged(cmbType) {

            grid.GetEditor('Metre_Lineaire').PerformCallback(cmbType.GetValue().toString());


        }
        function OnMetreChanged(cmbType) {

            grid.GetEditor('Vente').PerformCallback(cmbType.GetValue().toString());
            grid.GetEditor('Achat').PerformCallback(cmbType.GetValue().toString());

        }
        function OnFluxChanged(s, e) {
            var selectedValue = s.GetValue();
            alert(selectedValue);

            if (selectedValue == 'Navette')
            {
                grid.GetEditor('CT_Taux_reel').SetText("0");
                grid.GetEditor('Metre_Lineaire').SetText("0");
                grid.GetEditor('CT_Taux_reel').isVisible = false;
                grid.GetEditor('Metre_Lineaire').isVisible=false;
                
            } 


           


        }
    </script>


    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="DS_Grid" KeyFieldName="ID" Theme="MetropolisBlue" 
        OnCellEditorInitialize="grid_CellEditorInitialize" Caption="Hello" OnInitNewRow="grid_InitNewRow">
   
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsSearchPanel Visible="True" />

        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
        <SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />
        <SettingsDetail ShowDetailRow="true" />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="Statut" ColSpan="2">
                </dx:GridViewColumnLayoutItem>
                <%--Group Transport--%>
                <dx:GridViewLayoutGroup Caption="Definition du transport" ColSpan="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="Flux">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Depart">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Arrivee">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Type">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Tranporteur">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Metre_Lineaire">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Taux Cible" ColumnName="CT_Taux_Cible">                            
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Achat">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Vente">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <%--Group Planification--%>
                <dx:GridViewLayoutGroup Caption="Planification" ColSpan="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem Caption="Date Besoin" ColumnName="Date_Besoin">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Date Depart" ColumnName="Date_Depart">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Date Chargement" ColumnName="Date_Chargement">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <%--Group Facturation--%>
                <dx:GridViewLayoutGroup Caption="Elements de facturation" ColSpan="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem Caption="Num_Prefa_Trpt" ColumnName="Num_Prefa_Trpt">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Num SpeedUp" ColumnName="Spec_SPEEDUP">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="OETP" Caption="OETP / CC">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Tx Reel" ColumnName="CT_Taux_reel">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:GridViewColumnLayoutItem ColumnName="Commentaire">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="CT_ID_Navette">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
                
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <%--ID--%>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <%--Navette--%>
            <dx:GridViewDataTextColumn FieldName="Navette" VisibleIndex="19">
            </dx:GridViewDataTextColumn>

            <%--DateBesoin--%>
            <dx:GridViewDataDateColumn FieldName="Date_Besoin" VisibleIndex="8">
                <PropertiesDateEdit>
                    <TimeSectionProperties>
                        <TimeEditProperties>
                            <ClearButton Visibility="Auto">
                            </ClearButton>
                        </TimeEditProperties>
                    </TimeSectionProperties>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <%--DateChargement--%>
            <dx:GridViewDataDateColumn FieldName="Date_Chargement" VisibleIndex="9">
                <PropertiesDateEdit>
                    <TimeSectionProperties>
                        <TimeEditProperties>
                            <ClearButton Visibility="Auto">
                            </ClearButton>
                        </TimeEditProperties>
                    </TimeSectionProperties>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="CT_ID_Navette" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Spec_SPEEDUP" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <%--NUmDevis--%>
            <dx:GridViewDataTextColumn FieldName="Spec_Devis_AH" VisibleIndex="12">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <%--OETP--%>
            <dx:GridViewDataTextColumn FieldName="OETP" VisibleIndex="13">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <%--DateDepart--%>
            <dx:GridViewDataDateColumn FieldName="Date_Depart" VisibleIndex="7">
                <PropertiesDateEdit>
                    <TimeSectionProperties>
                        <TimeEditProperties>
                            <ClearButton Visibility="Auto">
                            </ClearButton>
                        </TimeEditProperties>
                    </TimeSectionProperties>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="ID_Presta" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <%--Achat--%>
            <dx:GridViewDataComboBoxColumn FieldName="Achat" VisibleIndex="20" Visible="False" PropertiesComboBox-DropDownStyle="DropDown">
                <PropertiesComboBox AllowNull="False" DataSourceID="DS_Achat" TextField="Achat" ValueField="Achat" >
                    <ClearButton Visibility="Auto">
                    </ClearButton>                  
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <%--Vente--%>
            <dx:GridViewDataComboBoxColumn FieldName="Vente" VisibleIndex="21" Visible="False" PropertiesComboBox-DropDownStyle="DropDown">
                <PropertiesComboBox AllowNull="False" DataSourceID="DS_Vente" TextField="Vente" ValueField="Vente" >
                    <ClearButton Visibility="Auto">
                    </ClearButton>                  
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True">
            </dx:GridViewCommandColumn>
            <%--Transporteur--%>
            <dx:GridViewDataComboBoxColumn FieldName="Tranporteur" VisibleIndex="6">
                <PropertiesComboBox AllowNull="False" DataSourceID="DS_Transporteur" TextField="Transporteur" ValueField="Transporteur">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnTransporteurChanged(s); }"></ClientSideEvents>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <%--Type--%>
            <dx:GridViewDataComboBoxColumn FieldName="Type" VisibleIndex="5">
                <PropertiesComboBox AllowNull="False" EnableCallbackMode="true" DataSourceID="DS_Type" TextField="Type" ValueField="Type">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnTypeChanged(s); }"></ClientSideEvents>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <%--Metre--%>
            <dx:GridViewDataComboBoxColumn FieldName="Metre_Lineaire" Visible="True" VisibleIndex="22">
             
                <PropertiesComboBox AllowNull="False" DataSourceID="DS_Metre" TextField="Qte" ValueField="Qte" ClientInstanceName="cbo_metre">
                         <ClientSideEvents SelectedIndexChanged="function(s, e) { OnMetreChanged(s); }"></ClientSideEvents>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                     <ValidationSettings SetFocusOnError="True" ErrorText="" EnableCustomValidation="true">
                                                <RequiredField IsRequired="True" ErrorText="" />
                                            </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Commentaire" Visible="False" VisibleIndex="23">
            </dx:GridViewDataTextColumn>
            <%--Taux cible--%>
            <dx:GridViewDataTextColumn FieldName="CT_Taux_Cible" Visible="False" VisibleIndex="24" >
                <PropertiesTextEdit >
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <%--TauxReel--%>
            <dx:GridViewDataTextColumn FieldName="CT_Taux_reel" VisibleIndex="25" >
                <PropertiesTextEdit ClientInstanceName="txt_txReel">
                     <ValidationSettings SetFocusOnError="True" ErrorText="" EnableCustomValidation="true">
                                                <RequiredField IsRequired="True" ErrorText="" />
                                            </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <%--Depart--%>
            <dx:GridViewDataComboBoxColumn FieldName="Depart" VisibleIndex="3" PropertiesComboBox-DropDownStyle="DropDown">
                <PropertiesComboBox AllowNull="False" EnableCallbackMode="true" DataSourceID="DS_Depart" TextField="Depart" ValueField="Depart" >
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnDepartChanged(s); }"></ClientSideEvents>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                    <ValidationSettings CausesValidation="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <%--Arrivee--%>
            <dx:GridViewDataComboBoxColumn FieldName="Arrivee" VisibleIndex="4" PropertiesComboBox-DropDownStyle="DropDown">
                <PropertiesComboBox AllowNull="False" EnableCallbackMode="true" DataSourceID="Ds_Arrivee" TextField="Arrivee" ValueField="Arrivee">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnArriveeChanged(s); }"></ClientSideEvents>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                    <ValidationSettings CausesValidation="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <%--Flux--%>
            <dx:GridViewDataComboBoxColumn FieldName="Flux" VisibleIndex="2">
                <PropertiesComboBox AllowNull="False" ClientInstanceName="cbo_flux" >
                    <ClientSideEvents SelectedIndexChanged="OnFluxChanged" />
                    <Items>
                        <dx:ListEditItem Text="Specifique" Value="Specifique" />
                        <dx:ListEditItem Text="Navette" Value="Navette" />
                        <dx:ListEditItem Text="SpeedUp" Value="SpeedUp" />
                        <dx:ListEditItem Text="Projet" Value="Projet" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                    <ValidationSettings CausesValidation="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <%--Statut--%>
            <dx:GridViewDataComboBoxColumn FieldName="Statut" VisibleIndex="17">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="Encours" Value="Encours" />
                        <dx:ListEditItem Text="Annulé" Value="Annulé" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <%--Num_Prefac--%>
            <dx:GridViewDataTextColumn FieldName="Num_Prefa_Trpt" VisibleIndex="26">
            </dx:GridViewDataTextColumn>
<%--            <dx:GridViewDataTextColumn Caption="txt_achat" Name="txt_achat"  FieldName="Achat" VisibleIndex ="27">                
            </dx:GridViewDataTextColumn>--%>
        </Columns>
        <Templates>
            <DetailRow>
                <dx:ASPxPageControl runat="server" ID="pagecontrol" EnableCallBacks="true" Theme="MetropolisBlue">

                    <TabPages>
                        <dx:TabPage Text="Control Tower">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView ID="ControlTower_Detail" DataSourceID="DS_Detail" runat="server" AutoGenerateColumns="False" KeyFieldName="ID" OnBeforePerformDataSelect="Grid_DataSelect">
                                        <SettingsEditing Mode="Inline">
                                        </SettingsEditing>
                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Commentaire" VisibleIndex="11">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CT_Taux_Cible" VisibleIndex="15">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CT_Taux_reel" VisibleIndex="16">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Speed UP" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>

                                    <dx:ASPxGridView ID="SpeedUp_Detail" DataSourceID="DS_Detail" runat="server" AutoGenerateColumns="False" KeyFieldName="ID" OnBeforePerformDataSelect="Grid_DataSelect">
                                        <SettingsEditing Mode="Inline">
                                        </SettingsEditing>
                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Commentaire" VisibleIndex="11">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Spec_SPEEDUP" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Spec_Devis_AH" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Spec_Cotation_Initiale" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Spec_Cotation_modifie" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <%--       <dx:GridViewDataTextColumn FieldName="Spec_Transporteur" VisibleIndex="6">
                      </dx:GridViewDataTextColumn>--%>
                                            <dx:GridViewDataTextColumn FieldName="Spec_Num_Commande" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>

                        </dx:TabPage>
                    </TabPages>



                </dx:ASPxPageControl>
            </DetailRow>


        </Templates>
        <Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="DS_Grid" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        DeleteCommand="DELETE FROM [T_Shuttle] WHERE [ID] = @original_ID AND (([Depart] = @original_Depart) OR ([Depart] IS NULL AND @original_Depart IS NULL)) AND (([Arrivee] = @original_Arrivee) OR ([Arrivee] IS NULL AND @original_Arrivee IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Navette] = @original_Navette) OR ([Navette] IS NULL AND @original_Navette IS NULL)) AND (([Tranporteur] = @original_Tranporteur) OR ([Tranporteur] IS NULL AND @original_Tranporteur IS NULL)) AND (([Date_Besoin] = @original_Date_Besoin) OR ([Date_Besoin] IS NULL AND @original_Date_Besoin IS NULL)) AND (([Date_Chargement] = @original_Date_Chargement) OR ([Date_Chargement] IS NULL AND @original_Date_Chargement IS NULL)) AND (([CT_ID_Navette] = @original_CT_ID_Navette) OR ([CT_ID_Navette] IS NULL AND @original_CT_ID_Navette IS NULL)) AND (([Spec_SPEEDUP] = @original_Spec_SPEEDUP) OR ([Spec_SPEEDUP] IS NULL AND @original_Spec_SPEEDUP IS NULL)) AND (([Spec_Devis_AH] = @original_Spec_Devis_AH) OR ([Spec_Devis_AH] IS NULL AND @original_Spec_Devis_AH IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([Spec_Cotation_Initiale] = @original_Spec_Cotation_Initiale) OR ([Spec_Cotation_Initiale] IS NULL AND @original_Spec_Cotation_Initiale IS NULL)) AND (([Spec_Cotation_modifie] = @original_Spec_Cotation_modifie) OR ([Spec_Cotation_modifie] IS NULL AND @original_Spec_Cotation_modifie IS NULL)) AND (([OETP] = @original_OETP) OR ([OETP] IS NULL AND @original_OETP IS NULL)) AND (([CT_Taux_Cible] = @original_CT_Taux_Cible) OR ([CT_Taux_Cible] IS NULL AND @original_CT_Taux_Cible IS NULL)) AND (([CT_Taux_reel] = @original_CT_Taux_reel) OR ([CT_Taux_reel] IS NULL AND @original_CT_Taux_reel IS NULL)) AND (([CT_Jour] = @original_CT_Jour) OR ([CT_Jour] IS NULL AND @original_CT_Jour IS NULL)) AND (([Flux] = @original_Flux) OR ([Flux] IS NULL AND @original_Flux IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Spec_Transporteur] = @original_Spec_Transporteur) OR ([Spec_Transporteur] IS NULL AND @original_Spec_Transporteur IS NULL)) AND (([Spec_Num_Commande] = @original_Spec_Num_Commande) OR ([Spec_Num_Commande] IS NULL AND @original_Spec_Num_Commande IS NULL)) AND (([Num_Prefa_Trpt] = @original_Num_Prefa_Trpt) OR ([Num_Prefa_Trpt] IS NULL AND @original_Num_Prefa_Trpt IS NULL)) AND (([Date_Depart] = @original_Date_Depart) OR ([Date_Depart] IS NULL AND @original_Date_Depart IS NULL)) AND (([ID_Presta] = @original_ID_Presta) OR ([ID_Presta] IS NULL AND @original_ID_Presta IS NULL)) AND (([Vente] = @original_Vente) OR ([Vente] IS NULL AND @original_Vente IS NULL)) AND (([Metre_Lineaire] = @original_Metre_Lineaire) OR ([Metre_Lineaire] IS NULL AND @original_Metre_Lineaire IS NULL))"
        InsertCommand="INSERT INTO [T_Shuttle] 
        ([Depart], [Arrivee], [Type], [Navette], [Tranporteur], [Date_Besoin], [Date_Chargement], [CT_ID_Navette], 
        [Spec_SPEEDUP], [Spec_Devis_AH], [Commentaire], [Spec_Cotation_Initiale], [Spec_Cotation_modifie], [OETP], 
        [CT_Taux_Cible], [CT_Taux_reel], [CT_Jour], [Flux], [Statut], [Spec_Transporteur], [Spec_Num_Commande], 
        [Num_Prefa_Trpt], [Date_Depart], [ID_Presta], [Vente], [Metre_Lineaire],[Achat])
         VALUES (@Depart, @Arrivee, @Type, @Navette, @Tranporteur, @Date_Besoin, @Date_Chargement, @CT_ID_Navette,
         @Spec_SPEEDUP, @Spec_Devis_AH, @Commentaire, @Spec_Cotation_Initiale, @Spec_Cotation_modifie, @OETP,
         @CT_Taux_Cible, @CT_Taux_reel, @CT_Jour, @Flux, @Statut, @Spec_Transporteur, @Spec_Num_Commande, 
        @Num_Prefa_Trpt, @Date_Depart, @ID_Presta, @Vente, @Metre_Lineaire,@Achat)"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [T_Shuttle]"
        UpdateCommand="UPDATE [T_Shuttle] 
        SET [Depart] = @Depart, [Arrivee] = @Arrivee, [Type] = @Type, [Navette] = @Navette, [Tranporteur] = @Tranporteur, 
        [Date_Besoin] = @Date_Besoin, [Date_Chargement] = @Date_Chargement, [CT_ID_Navette] = @CT_ID_Navette, 
        [Spec_SPEEDUP] = @Spec_SPEEDUP, [Spec_Devis_AH] = @Spec_Devis_AH, [Commentaire] = @Commentaire, 
        [Spec_Cotation_Initiale] = @Spec_Cotation_Initiale, [Spec_Cotation_modifie] = @Spec_Cotation_modifie,
         [OETP] = @OETP, [CT_Taux_Cible] = @CT_Taux_Cible, [CT_Taux_reel] = @CT_Taux_reel, [CT_Jour] = @CT_Jour, [Flux] = @Flux, 
        [Statut] = @Statut, [Spec_Transporteur] = @Spec_Transporteur, [Spec_Num_Commande] = @Spec_Num_Commande, [Num_Prefa_Trpt] = @Num_Prefa_Trpt, 
        [Date_Depart] = @Date_Depart, [ID_Presta] = @ID_Presta, [Vente] = @Vente, [Metre_Lineaire] = @Metre_Lineaire ,[Achat]=@Achat
        WHERE [ID] = @original_ID">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Depart" Type="String" />
            <asp:Parameter Name="original_Arrivee" Type="String" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_Navette" Type="String" />
            <asp:Parameter Name="original_Tranporteur" Type="String" />
            <asp:Parameter Name="original_Date_Besoin" Type="DateTime" />
            <asp:Parameter Name="original_Date_Chargement" Type="DateTime" />
            <asp:Parameter Name="original_CT_ID_Navette" Type="String" />
            <asp:Parameter Name="original_Spec_SPEEDUP" Type="Int32" />
            <asp:Parameter Name="original_Spec_Devis_AH" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_Spec_Cotation_Initiale" Type="Decimal" />
            <asp:Parameter Name="original_Spec_Cotation_modifie" Type="Decimal" />
            <asp:Parameter Name="original_OETP" Type="String" />
            <asp:Parameter Name="original_CT_Taux_Cible" Type="Int32" />
            <asp:Parameter Name="original_CT_Taux_reel" Type="Int32" />
            <asp:Parameter Name="original_CT_Jour" Type="String" />
            <asp:Parameter Name="original_Flux" Type="String" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Spec_Transporteur" Type="String" />
            <asp:Parameter Name="original_Spec_Num_Commande" Type="String" />
            <asp:Parameter Name="original_Num_Prefa_Trpt" Type="String" />
            <asp:Parameter Name="original_Date_Depart" Type="DateTime" />
            <asp:Parameter Name="original_ID_Presta" Type="Int32" />
            <asp:Parameter Name="original_Vente" Type="Decimal" />
            <asp:Parameter Name="original_Metre_Lineaire" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Depart" Type="String" />
            <asp:Parameter Name="Arrivee" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Navette" Type="String" />
            <asp:Parameter Name="Tranporteur" Type="String" />
            <asp:Parameter Name="Date_Besoin" Type="DateTime" />
            <asp:Parameter Name="Date_Chargement" Type="DateTime" />
            <asp:Parameter Name="CT_ID_Navette" Type="String" />
            <asp:Parameter Name="Spec_SPEEDUP" Type="Int32" />
            <asp:Parameter Name="Spec_Devis_AH" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="Spec_Cotation_Initiale" Type="Decimal" />
            <asp:Parameter Name="Spec_Cotation_modifie" Type="Decimal" />
            <asp:Parameter Name="OETP" Type="String" />
            <asp:Parameter Name="CT_Taux_Cible" Type="Int32" />
            <asp:Parameter Name="CT_Taux_reel" Type="Int32" />
            <asp:Parameter Name="CT_Jour" Type="String" />
            <asp:Parameter Name="Flux" Type="String" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Spec_Transporteur" Type="String" />
            <asp:Parameter Name="Spec_Num_Commande" Type="String" />
            <asp:Parameter Name="Num_Prefa_Trpt" Type="String" />
            <asp:Parameter Name="Date_Depart" Type="DateTime" />
            <asp:Parameter Name="ID_Presta" Type="Int32" />
            <asp:Parameter Name="Vente" Type="Decimal" />
            <asp:Parameter Name="Metre_Lineaire" Type="Int32" />
            <asp:Parameter Name="Achat" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Depart" Type="String" />
            <asp:Parameter Name="Arrivee" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Navette" Type="String" />
            <asp:Parameter Name="Tranporteur" Type="String" />
            <asp:Parameter Name="Date_Besoin" Type="DateTime" />
            <asp:Parameter Name="Date_Chargement" Type="DateTime" />
            <asp:Parameter Name="CT_ID_Navette" Type="String" />
            <asp:Parameter Name="Spec_SPEEDUP" Type="Int32" />
            <asp:Parameter Name="Spec_Devis_AH" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="Spec_Cotation_Initiale" Type="Decimal" />
            <asp:Parameter Name="Spec_Cotation_modifie" Type="Decimal" />
            <asp:Parameter Name="OETP" Type="String" />
            <asp:Parameter Name="CT_Taux_Cible" Type="Int32" />
            <asp:Parameter Name="CT_Taux_reel" Type="Int32" />
            <asp:Parameter Name="CT_Jour" Type="String" />
            <asp:Parameter Name="Flux" Type="String" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Spec_Transporteur" Type="String" />
            <asp:Parameter Name="Spec_Num_Commande" Type="String" />
            <asp:Parameter Name="Num_Prefa_Trpt" Type="String" />
            <asp:Parameter Name="Date_Depart" Type="DateTime" />
            <asp:Parameter Name="ID_Presta" Type="Int32" />
            <asp:Parameter Name="Vente" Type="Decimal" />
            <asp:Parameter Name="Metre_Lineaire" Type="Int32" />
             <asp:Parameter Name="Achat" Type="Decimal" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Detail" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_Shuttle] WHERE ID = @ID"
        DeleteCommand="DELETE FROM [T_Shuttle] WHERE [ID] = @original_ID AND (([Depart] = @original_Depart) OR ([Depart] IS NULL AND @original_Depart IS NULL)) AND (([Arrivee] = @original_Arrivee) OR ([Arrivee] IS NULL AND @original_Arrivee IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Navette] = @original_Navette) OR ([Navette] IS NULL AND @original_Navette IS NULL)) AND (([Tranporteur] = @original_Tranporteur) OR ([Tranporteur] IS NULL AND @original_Tranporteur IS NULL)) AND (([Date_Besoin] = @original_Date_Besoin) OR ([Date_Besoin] IS NULL AND @original_Date_Besoin IS NULL)) AND (([Date_Chargement] = @original_Date_Chargement) OR ([Date_Chargement] IS NULL AND @original_Date_Chargement IS NULL)) AND (([CT_ID_Navette] = @original_CT_ID_Navette) OR ([CT_ID_Navette] IS NULL AND @original_CT_ID_Navette IS NULL)) AND (([Spec_SPEEDUP] = @original_Spec_SPEEDUP) OR ([Spec_SPEEDUP] IS NULL AND @original_Spec_SPEEDUP IS NULL)) AND (([Spec_Devis_AH] = @original_Spec_Devis_AH) OR ([Spec_Devis_AH] IS NULL AND @original_Spec_Devis_AH IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([Spec_Cotation_Initiale] = @original_Spec_Cotation_Initiale) OR ([Spec_Cotation_Initiale] IS NULL AND @original_Spec_Cotation_Initiale IS NULL)) AND (([Spec_Cotation_modifie] = @original_Spec_Cotation_modifie) OR ([Spec_Cotation_modifie] IS NULL AND @original_Spec_Cotation_modifie IS NULL)) AND (([OETP] = @original_OETP) OR ([OETP] IS NULL AND @original_OETP IS NULL)) AND (([CT_Taux_Cible] = @original_CT_Taux_Cible) OR ([CT_Taux_Cible] IS NULL AND @original_CT_Taux_Cible IS NULL)) AND (([CT_Taux_reel] = @original_CT_Taux_reel) OR ([CT_Taux_reel] IS NULL AND @original_CT_Taux_reel IS NULL)) AND (([CT_Jour] = @original_CT_Jour) OR ([CT_Jour] IS NULL AND @original_CT_Jour IS NULL)) AND (([Flux] = @original_Flux) OR ([Flux] IS NULL AND @original_Flux IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Spec_Transporteur] = @original_Spec_Transporteur) OR ([Spec_Transporteur] IS NULL AND @original_Spec_Transporteur IS NULL)) AND (([Spec_Num_Commande] = @original_Spec_Num_Commande) OR ([Spec_Num_Commande] IS NULL AND @original_Spec_Num_Commande IS NULL))" InsertCommand="INSERT INTO [T_Shuttle] ([Depart], [Arrivee], [Type], [Navette], [Tranporteur], [Date_Besoin], [Date_Chargement], [CT_ID_Navette], [Spec_SPEEDUP], [Spec_Devis_AH], [Commentaire], [Spec_Cotation_Initiale], [Spec_Cotation_modifie], [OETP], [CT_Taux_Cible], [CT_Taux_reel], [CT_Jour], [Flux], [Statut], [Spec_Transporteur], [Spec_Num_Commande]) VALUES (@Depart, @Arrivee, @Type, @Navette, @Tranporteur, @Date_Besoin, @Date_Chargement, @CT_ID_Navette, @Spec_SPEEDUP, @Spec_Devis_AH, @Commentaire, @Spec_Cotation_Initiale, @Spec_Cotation_modifie, @OETP, @CT_Taux_Cible, @CT_Taux_reel, @CT_Jour, @Flux, @Statut, @Spec_Transporteur, @Spec_Num_Commande)"
        OldValuesParameterFormatString="original_{0}"
        UpdateCommand="UPDATE [T_Shuttle] SET [Depart] = @Depart, [Arrivee] = @Arrivee, [Type] = @Type, [Navette] = @Navette, [Tranporteur] = @Tranporteur, [Date_Besoin] = @Date_Besoin, [Date_Chargement] = @Date_Chargement, [CT_ID_Navette] = @CT_ID_Navette, [Spec_SPEEDUP] = @Spec_SPEEDUP, [Spec_Devis_AH] = @Spec_Devis_AH, [Commentaire] = @Commentaire, [Spec_Cotation_Initiale] = @Spec_Cotation_Initiale, [Spec_Cotation_modifie] = @Spec_Cotation_modifie, [OETP] = @OETP, [CT_Taux_Cible] = @CT_Taux_Cible, [CT_Taux_reel] = @CT_Taux_reel, [CT_Jour] = @CT_Jour, [Flux] = @Flux, [Statut] = @Statut, [Spec_Transporteur] = @Spec_Transporteur, [Spec_Num_Commande] = @Spec_Num_Commande WHERE [ID] = @original_ID AND (([Depart] = @original_Depart) OR ([Depart] IS NULL AND @original_Depart IS NULL)) AND (([Arrivee] = @original_Arrivee) OR ([Arrivee] IS NULL AND @original_Arrivee IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Navette] = @original_Navette) OR ([Navette] IS NULL AND @original_Navette IS NULL)) AND (([Tranporteur] = @original_Tranporteur) OR ([Tranporteur] IS NULL AND @original_Tranporteur IS NULL)) AND (([Date_Besoin] = @original_Date_Besoin) OR ([Date_Besoin] IS NULL AND @original_Date_Besoin IS NULL)) AND (([Date_Chargement] = @original_Date_Chargement) OR ([Date_Chargement] IS NULL AND @original_Date_Chargement IS NULL)) AND (([CT_ID_Navette] = @original_CT_ID_Navette) OR ([CT_ID_Navette] IS NULL AND @original_CT_ID_Navette IS NULL)) AND (([Spec_SPEEDUP] = @original_Spec_SPEEDUP) OR ([Spec_SPEEDUP] IS NULL AND @original_Spec_SPEEDUP IS NULL)) AND (([Spec_Devis_AH] = @original_Spec_Devis_AH) OR ([Spec_Devis_AH] IS NULL AND @original_Spec_Devis_AH IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([Spec_Cotation_Initiale] = @original_Spec_Cotation_Initiale) OR ([Spec_Cotation_Initiale] IS NULL AND @original_Spec_Cotation_Initiale IS NULL)) AND (([Spec_Cotation_modifie] = @original_Spec_Cotation_modifie) OR ([Spec_Cotation_modifie] IS NULL AND @original_Spec_Cotation_modifie IS NULL)) AND (([OETP] = @original_OETP) OR ([OETP] IS NULL AND @original_OETP IS NULL)) AND (([CT_Taux_Cible] = @original_CT_Taux_Cible) OR ([CT_Taux_Cible] IS NULL AND @original_CT_Taux_Cible IS NULL)) AND (([CT_Taux_reel] = @original_CT_Taux_reel) OR ([CT_Taux_reel] IS NULL AND @original_CT_Taux_reel IS NULL)) AND (([CT_Jour] = @original_CT_Jour) OR ([CT_Jour] IS NULL AND @original_CT_Jour IS NULL)) AND (([Flux] = @original_Flux) OR ([Flux] IS NULL AND @original_Flux IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Spec_Transporteur] = @original_Spec_Transporteur) OR ([Spec_Transporteur] IS NULL AND @original_Spec_Transporteur IS NULL)) AND (([Spec_Num_Commande] = @original_Spec_Num_Commande) OR ([Spec_Num_Commande] IS NULL AND @original_Spec_Num_Commande IS NULL))">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="ID" Type="Int32" />

        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Depart" Type="String" />
            <asp:Parameter Name="original_Arrivee" Type="String" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_Navette" Type="String" />
            <asp:Parameter Name="original_Tranporteur" Type="String" />
            <asp:Parameter Name="original_Date_Besoin" Type="DateTime" />
            <asp:Parameter Name="original_Date_Chargement" Type="DateTime" />
            <asp:Parameter Name="original_CT_ID_Navette" Type="String" />
            <asp:Parameter Name="original_Spec_SPEEDUP" Type="Int32" />
            <asp:Parameter Name="original_Spec_Devis_AH" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_Spec_Cotation_Initiale" Type="Decimal" />
            <asp:Parameter Name="original_Spec_Cotation_modifie" Type="Decimal" />
            <asp:Parameter Name="original_OETP" Type="String" />
            <asp:Parameter Name="original_CT_Taux_Cible" Type="Int32" />
            <asp:Parameter Name="original_CT_Taux_reel" Type="Int32" />
            <asp:Parameter Name="original_CT_Jour" Type="String" />
            <asp:Parameter Name="original_Flux" Type="String" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Spec_Transporteur" Type="String" />
            <asp:Parameter Name="original_Spec_Num_Commande" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Depart" Type="String" />
            <asp:Parameter Name="Arrivee" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Navette" Type="String" />
            <asp:Parameter Name="Tranporteur" Type="String" />
            <asp:Parameter Name="Date_Besoin" Type="DateTime" />
            <asp:Parameter Name="Date_Chargement" Type="DateTime" />
            <asp:Parameter Name="CT_ID_Navette" Type="String" />
            <asp:Parameter Name="Spec_SPEEDUP" Type="Int32" />
            <asp:Parameter Name="Spec_Devis_AH" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="Spec_Cotation_Initiale" Type="Decimal" />
            <asp:Parameter Name="Spec_Cotation_modifie" Type="Decimal" />
            <asp:Parameter Name="OETP" Type="String" />
            <asp:Parameter Name="CT_Taux_Cible" Type="Int32" />
            <asp:Parameter Name="CT_Taux_reel" Type="Int32" />
            <asp:Parameter Name="CT_Jour" Type="String" />
            <asp:Parameter Name="Flux" Type="String" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Spec_Transporteur" Type="String" />
            <asp:Parameter Name="Spec_Num_Commande" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Depart" Type="String" />
            <asp:Parameter Name="Arrivee" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Navette" Type="String" />
            <asp:Parameter Name="Tranporteur" Type="String" />
            <asp:Parameter Name="Date_Besoin" Type="DateTime" />
            <asp:Parameter Name="Date_Chargement" Type="DateTime" />
            <asp:Parameter Name="CT_ID_Navette" Type="String" />
            <asp:Parameter Name="Spec_SPEEDUP" Type="Int32" />
            <asp:Parameter Name="Spec_Devis_AH" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="Spec_Cotation_Initiale" Type="Decimal" />
            <asp:Parameter Name="Spec_Cotation_modifie" Type="Decimal" />
            <asp:Parameter Name="OETP" Type="String" />
            <asp:Parameter Name="CT_Taux_Cible" Type="Int32" />
            <asp:Parameter Name="CT_Taux_reel" Type="Int32" />
            <asp:Parameter Name="CT_Jour" Type="String" />
            <asp:Parameter Name="Flux" Type="String" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Spec_Transporteur" Type="String" />
            <asp:Parameter Name="Spec_Num_Commande" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Depart" Type="String" />
            <asp:Parameter Name="original_Arrivee" Type="String" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_Navette" Type="String" />
            <asp:Parameter Name="original_Tranporteur" Type="String" />
            <asp:Parameter Name="original_Date_Besoin" Type="DateTime" />
            <asp:Parameter Name="original_Date_Chargement" Type="DateTime" />
            <asp:Parameter Name="original_CT_ID_Navette" Type="String" />
            <asp:Parameter Name="original_Spec_SPEEDUP" Type="Int32" />
            <asp:Parameter Name="original_Spec_Devis_AH" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_Spec_Cotation_Initiale" Type="Decimal" />
            <asp:Parameter Name="original_Spec_Cotation_modifie" Type="Decimal" />
            <asp:Parameter Name="original_OETP" Type="String" />
            <asp:Parameter Name="original_CT_Taux_Cible" Type="Int32" />
            <asp:Parameter Name="original_CT_Taux_reel" Type="Int32" />
            <asp:Parameter Name="original_CT_Jour" Type="String" />
            <asp:Parameter Name="original_Flux" Type="String" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Spec_Transporteur" Type="String" />
            <asp:Parameter Name="original_Spec_Num_Commande" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="DS_Transporteur" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT RTRIM(Transporteur) as Transporteur FROM T_Shuttle_Tarif Where Depart=@param_depart and Arrivee=@param_arrivee and Type=@param_type">
        <SelectParameters>
            <asp:SessionParameter Name="param_depart" DefaultValue="%" SessionField="param_depart" />
            <asp:SessionParameter Name="param_arrivee" DefaultValue="%" SessionField="param_arrivee" />
            <asp:SessionParameter Name="param_type" DefaultValue="%" SessionField="param_type" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Type" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT RTRIM(Type) As Type FROM T_Shuttle_Tarif where Type is not null and Depart=@param_depart and Arrivee=@param_arrivee">
        <SelectParameters>
            <asp:SessionParameter Name="param_depart" DefaultValue="%" SessionField="param_depart" />
            <asp:SessionParameter Name="param_arrivee" DefaultValue="%" SessionField="param_arrivee" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Metre" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT Qte FROM T_Shuttle_Tarif Where Depart=@param_depart and Arrivee=@param_arrivee and Type=@param_type">
        <SelectParameters>
            <asp:SessionParameter Name="param_depart" DefaultValue="%" SessionField="param_depart" />
            <asp:SessionParameter Name="param_arrivee" DefaultValue="%" SessionField="param_arrivee" />
            <asp:SessionParameter Name="param_type" DefaultValue="%" SessionField="param_type" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="Ds_Arrivee" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT RTRIM(Arrivee) as Arrivee FROM T_Shuttle_Tarif where Depart=@param_depart">
        <SelectParameters>
            <asp:SessionParameter Name="param_depart" DefaultValue="%" SessionField="param_depart" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Depart" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT RTRIM(Depart) as Depart FROM T_Shuttle_Tarif">

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Vente" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT Vente FROM T_Shuttle_Tarif Where Depart=@param_depart and Arrivee=@param_arrivee and Type=@param_type and Qte= @param_metre and Transporteur=@param_trpt ">
        <SelectParameters>
            <asp:SessionParameter Name="param_depart" DefaultValue="%" SessionField="param_depart" />
            <asp:SessionParameter Name="param_arrivee" DefaultValue="%" SessionField="param_arrivee" />
            <asp:SessionParameter Name="param_type" DefaultValue="%" SessionField="param_type" />
            <asp:SessionParameter Name="param_metre" SessionField="param_metre" />
            <asp:SessionParameter Name="param_trpt" SessionField="param_trpt" />
        </SelectParameters>
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="DS_Achat" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT Achat FROM T_Shuttle_Tarif Where Depart=@param_depart and Arrivee=@param_arrivee and Type=@param_type and Qte= @param_metre and Transporteur=@param_trpt">
        <SelectParameters>
            <asp:SessionParameter Name="param_depart" DefaultValue="%" SessionField="param_depart" />
            <asp:SessionParameter Name="param_arrivee" DefaultValue="%" SessionField="param_arrivee" />
            <asp:SessionParameter Name="param_type" DefaultValue="%" SessionField="param_type" />
            <asp:SessionParameter Name="param_metre" SessionField="param_metre" />
             <asp:SessionParameter Name="param_trpt" SessionField="param_trpt" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>


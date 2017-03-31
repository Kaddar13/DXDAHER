<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_MAG_5AU.aspx.cs" Inherits="DX_DAHERCMS.ORDO_MAGASIN" %>

<%@ Register Assembly="DevExpress.XtraCharts.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .leftZone,
        .rightZone {
            float: left;
        }

        .leftZone {
            /*margin-right: 1px;*/
        }
    </style>
    <script type="text/javascript">
        var postponedCallbackRequired = false;
        function ShowLoginWindow() {
            ASPxPopupControl1.Show();
        }
        function OnCheckedChange(s, e) {
            if (CallbackPanel.InCallback())
                postponedCallbackRequired = true;
            else
                CallbackPanel.PerformCallback();
        }
        function OnEndCallback(s, e) {
            if (postponedCallbackRequired) {
                CallbackPanel.PerformCallback();
                postponedCallbackRequired = false;
            }

        }






    </script>
    <div>

        <dx:ASPxDockZone runat="server" ID="ASPxDockZone1" ZoneUID="LeftZone" Width="50%" PanelSpacing="3" Height="100%" CssClass="leftZone" BackColor="YellowGreen" >
        </dx:ASPxDockZone>
        <dx:ASPxDockZone runat="server" ID="ASPxDockZone2" ZoneUID="RightZone" Width="50%" PanelSpacing="3" CssClass="rightZone">
        </dx:ASPxDockZone>
    </div>
    <dx:ASPxDockPanel Theme="Moderno" runat="server" ID="Panel_Graph" PanelUID="Graph5AU"
        OwnerZoneUID="LeftZone" HeaderText="Graph"
        ShowCloseButton="false"
        ShowCollapseButton="true"
        ShowMaximizeButton="True"
        ShowSizeGrip="True"
        AllowResize="True"
        Height="600px">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div>
                    <dxchartsui:WebChartControl ID="WebChartControlPie" EnableCallBacks="False" runat="server" CrosshairEnabled="True"
                        ClientInstanceName="chart" OnObjectSelected="WebChartControlPie_ObjectSelected" DataSourceID="DS_Chart"
                        SelectionMode="Single" SeriesSelectionMode="Point" OnSelectedItemsChanged="WebChartControlPie_SelectedItemsChanged" Width="673px" Height="600px"  PaletteName="Metro" SideBySideBarDistanceFixed="2" SideBySideBarDistanceVariable="2" AutoLayout="True">
                        <padding bottom="1" left="1" right="1" top="1" />
                        <borderoptions visibility="False" />
                        <diagramserializable>
                    <cc1:XYDiagram PaneLayoutDirection="Horizontal" Rotated="True" PaneDistance="2" >
                        <axisx visibleinpanesserializable="-1" visibility="True">
                     
                            <autoscalebreaks enabled="True" />
                     
                            <tickmarks minorvisible="False" />
                            <label maxlinecount="1">
                            </label>
                            <range scrollingrange-sidemarginsenabled="False" />
                            <visualrange auto="False" autosidemargins="False" maxvalueserializable="1" minvalueserializable="0" sidemarginsvalue="1" />
                            <wholerange autosidemargins="False" sidemarginsvalue="1" />
                            
                        </axisx>
                        <axisy visibleinpanesserializable="-1" visibility="True">
                            
                                                       <tickmarks minorvisible="False" />
                            
                        </axisy>
                    </cc1:XYDiagram>
                </diagramserializable>
                        <legend visibility="True" alignmenthorizontal="Left" alignmentvertical="TopOutside"></legend>
                        <seriesserializable>
                    <cc1:Series Name="Plannifié" SummaryFunction="SUM([Demande])" ArgumentDataMember="Gare" LabelsVisibility="True">
                        <datafilters>
                            
                        <cc1:DataFilter ColumnName="Statut" DataType="System.Int32" InvariantValueSerializable="1" /></datafilters>
                        <viewserializable>
                            
                        <cc1:StackedBarSeriesView BarWidth="0.4" Color="198, 217, 240">
                            
                            <fillstyle fillmode="Solid">
                            </fillstyle></cc1:StackedBarSeriesView></viewserializable>
                    </cc1:Series>
                            <cc1:Series ArgumentDataMember="Gare" Name="Actif" SummaryFunction="SUM([Demande])" LabelsVisibility="True">
                                <datafilters>
                                    
                                <cc1:DataFilter ColumnName="Statut" DataType="System.Int32" InvariantValueSerializable="3" /></datafilters>
                                <viewserializable>
                                    
                                <cc1:StackedBarSeriesView BarWidth="0.4" Color="Gold"><fillstyle fillmode="Solid"></fillstyle></cc1:StackedBarSeriesView></viewserializable>
                            </cc1:Series>
                            <cc1:Series Name="Verrouillé" SummaryFunction="SUM([Demande])" ArgumentDataMember="Gare" LabelsVisibility="True">
                                <datafilters>
                                    
                                <cc1:DataFilter ColumnName="Statut" DataType="System.Int32" InvariantValueSerializable="2" /></datafilters>
                                <viewserializable>
                                    
                                <cc1:StackedBarSeriesView BarWidth="0.4" Color="247, 150, 70">
                                        
                                    <fillstyle fillmode="Solid">
                                        </fillstyle></cc1:StackedBarSeriesView></viewserializable>
                            </cc1:Series>
                 <cc1:Series 
                        labelsvisibility="True" 
                        ValueDataMembersSerializable="Demande" 
                        SummaryFunction = "SUM([Demande])" 
                        Name="Traite" ArgumentDataMember="Gare">
                     <datafilters>
                         <cc1:DataFilter ColumnName="Statut" InvariantValueSerializable="4" DataType="System.Int32" />
                     </datafilters>
                     <viewserializable>
                         <cc1:StackedBarSeriesView BarWidth="0.4" Color="155, 187, 89">
                             <fillstyle fillmode="Solid">
                             </fillstyle>
                         </cc1:StackedBarSeriesView>
                     </viewserializable>
                     <labelserializable>
                         <cc1:StackedBarSeriesLabel ResolveOverlappingMode="Default">
                         </cc1:StackedBarSeriesLabel>
                     </labelserializable>
                    </cc1:Series>
                </seriesserializable>
                        <titles>
                    <cc1:ChartTitle Text="Avancement 5AU" Indent="0"></cc1:ChartTitle>
                </titles>
                        <palettewrappers>
                        <dxchartsui:PaletteWrapper Name="Mimo" ScaleMode="Repeat">
                            <palette>
                                <cc1:PaletteEntry Color="21, 180, 255" Color2="21, 180, 255" />
                                <cc1:PaletteEntry Color="255, 128, 128" Color2="255, 128, 128" />
                            </palette>
                        </dxchartsui:PaletteWrapper>
                    </palettewrappers>
                    </dxchartsui:WebChartControl>
                </div>

                <asp:SqlDataSource ID="DS_Chart" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
                    SelectCommand="SELECT 
CASE 
WHEN T_Ordo_TypeOrdo.Libelle_Gare = 'AUTRES GARES' THEN 'AUTRES GARES'
WHEN T_Ordo_TypeOrdo.Libelle_Gare &lt;&gt; 'AUTRES GARES' THEN T_Ordo_TypeOrdo.Cle_Gare + ' ' + RTRIM(T_Ordo_TypeOrdo.Libelle_Gare)
END as Gare,

T_Ordo_TypeOrdo.Bras_Sortie, T_Ordo_TypeOrdo.Priorite, T_Ordo_TypeOrdo.Libelle_Gare, COUNT(T_Ordo.[Numéro de l'ordre de transfert]) AS Demande, T_Ordo.Statut, T_Ordo_Appointments_DragAndDrop.Start, T_Ordo_TypeOrdo.Type_Flux, T_Ordo_PerimetreMagasin.VOIR, T_Ordo_TypeOrdo.Type_Ordo FROM T_Ordo LEFT OUTER JOIN T_Ordo_PerimetreMagasin ON T_Ordo.[Type magasin cédant] = T_Ordo_PerimetreMagasin.Id_Magasin LEFT OUTER JOIN T_Ordo_TypeOrdo ON T_Ordo.[Clé gare] = T_Ordo_TypeOrdo.Cle_Gare RIGHT OUTER JOIN T_Ordo_Appointments_DragAndDrop ON T_Ordo.AppointmentID = T_Ordo_Appointments_DragAndDrop.AppointmentID WHERE (T_Ordo.[Type magasin cédant] = N'5AU') GROUP BY T_Ordo_TypeOrdo.Cle_Gare + ' ' + RTRIM(T_Ordo_TypeOrdo.Libelle_Gare), T_Ordo.Statut, T_Ordo_Appointments_DragAndDrop.Start, T_Ordo_TypeOrdo.Libelle_Gare, T_Ordo_TypeOrdo.Priorite, T_Ordo_TypeOrdo.Type_Flux, T_Ordo_PerimetreMagasin.VOIR, T_Ordo_TypeOrdo.Type_Ordo, T_Ordo_TypeOrdo.Bras_Sortie HAVING (T_Ordo_Appointments_DragAndDrop.Start &lt;= CONVERT (varchar(10), GETDATE(), 103)) AND (T_Ordo_PerimetreMagasin.VOIR = 'oui') ORDER BY T_Ordo_TypeOrdo.Bras_Sortie, T_Ordo_TypeOrdo.Priorite"></asp:SqlDataSource>

            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxDockPanel>
    <dx:ASPxDockPanel Theme="Moderno" runat="server" ID="Panel_Grid" OwnerZoneUID="RightZone" HeaderText="Donnees" ShowCloseButton="false" Collapsed="true" ShowCollapseButton="true" ShowMaximizeButton="True" ShowSizeGrip="True" AllowResize="True">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <dx:ASPxGridView runat="server" ID="Grid_Data" DataSourceID="DS_Grid" AutoGenerateColumns="False">
                    <Settings ShowFooter="True" ShowFilterRow="True" />
                    <SettingsBehavior AllowSelectByRowClick="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <SettingsSearchPanel Visible="True" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Libelle_Gare" ShowInCustomizationForm="True" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Groupe" ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Demande" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Nb_Traite" ShowInCustomizationForm="True" VisibleIndex="3" ReadOnly="True">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Statut" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Start" ShowInCustomizationForm="True" VisibleIndex="5">
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
                        <dx:GridViewDataDateColumn FieldName="Date de création" ShowInCustomizationForm="True" VisibleIndex="6">
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
                        <dx:GridViewDataTextColumn FieldName="Clé gare" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AppointmentID" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                    </Columns>

                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="Demande" ShowInColumn="Demande" SummaryType="Sum" Tag="TotalDemande" />
                    </TotalSummary>

                    <Styles AdaptiveDetailButtonWidth="22"></Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="DS_Grid" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
                    SelectCommand="SELECT T_Ordo_TypeOrdo.Libelle_Gare, T_Ordo.Groupe, COUNT(T_Ordo.[Numéro de l'ordre de transfert]) AS Demande, COUNT(T_Ordo_Appointments_DragAndDrop.Nb_Traite) AS Nb_Traite, T_Ordo.Statut, T_Ordo_Appointments_DragAndDrop.Start, T_Ordo.[Date de création], T_Ordo.[Clé gare], T_Ordo.AppointmentID FROM T_Ordo LEFT OUTER JOIN T_Ordo_TypeOrdo ON T_Ordo.[Clé gare] = T_Ordo_TypeOrdo.Cle_Gare RIGHT OUTER JOIN T_Ordo_Appointments_DragAndDrop ON T_Ordo.AppointmentID = T_Ordo_Appointments_DragAndDrop.AppointmentID GROUP BY T_Ordo.[Type magasin cédant], T_Ordo.Statut, T_Ordo.Groupe, T_Ordo_Appointments_DragAndDrop.Start, T_Ordo_TypeOrdo.Libelle_Gare, T_Ordo.[Date de création], T_Ordo.[Clé gare], T_Ordo.AppointmentID HAVING (T_Ordo.[Type magasin cédant] = N'5AU') AND (T_Ordo.Statut = 1) AND (T_Ordo_Appointments_DragAndDrop.Start &lt;= GETDATE()) OR (T_Ordo.[Type magasin cédant] = N'5AU') AND (T_Ordo.Statut = 2)"></asp:SqlDataSource>

            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxDockPanel>
    
    <dx:ASPxDockPanel Theme="Moderno" runat="server" ID="PressePapier" OwnerZoneUID="RightZone" HeaderText="Presse Papier" ShowCloseButton="false" ShowCollapseButton="true" Collapsed="true" Width="749px">
        <ContentCollection>
           
            <dx:PopupControlContentControl>
                 <div>
                <div>
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server"></dx:ASPxGridView>
                </div>
                <div>
                    <dx:ASPxButton runat="server" ID="Btn_copy" Text="Copier" OnClick="Btn_copy_Click"/>             
                </div>
                <div style="float:right">
                    <dx:ASPxMemo runat="server" ID="ASPxMemo1" ClientInstanceName="ASPxMemo1" Height="182px" Width="471px" Enabled="false" ReadOnly="true" Visible="false" />
                </div>      
                </div>          
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxDockPanel>

    <dx:ASPxDockPanel ID="DP_MagicMix" HeaderText="MagicMix !" Theme="Moderno" runat="server" OwnerZoneUID="RightZone" ShowCollapseButton="true" ShowCloseButton="false" Collapsed="true">
        <ContentCollection>
            <dx:PopupControlContentControl>
                                <div>
                    <dx:ASPxButton ID="btShowModal" runat="server" Text="Figer la demande" AutoPostBack="False" UseSubmitBehavior="false" Theme="Moderno">
                        <ClientSideEvents Click="function(s, e) { ShowLoginWindow(); }" />
                    </dx:ASPxButton>

                </div>
                <div>
                    <dx:ASPxLabel runat="server" Text="Nom Gare :" />
                    <dx:ASPxTextBox ID="Txt_NomGare" runat="server" Width="170px" Enabled="false">
                        <ValidationSettings ErrorText="Text">
                            <RequiredField IsRequired="true" ErrorText="Selectionner une gare !" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                    <dx:ASPxLabel runat="server" Text="Total Ligne :" />
                    <dx:ASPxTextBox ID="Txt_SUM" runat="server" Width="170px" Enabled="false" Visible="false"></dx:ASPxTextBox>

                    <dx:ASPxCheckBox runat="server" ID="cb_ligne" Text="Ligne" OnCheckedChanged="cb_ligne_CheckedChanged">
                        <ClientSideEvents CheckedChanged="OnCheckedChange" />
                    </dx:ASPxCheckBox>

                    <dx:ASPxCheckBox runat="server" ID="cb_app" Text="Appareil/Poste" OnCheckedChanged="cb_app_CheckedChanged">
                        <ClientSideEvents CheckedChanged="OnCheckedChange" />
                    </dx:ASPxCheckBox>
                </div>
                <dx:ASPxLabel runat="server" ID="step" Text=""></dx:ASPxLabel>
                <dx:ASPxLabel runat="server" ID="cdt1"></dx:ASPxLabel>
                <dx:ASPxLabel runat="server" ID="cdt2"></dx:ASPxLabel>
                <div>
                    <div>
                        <dx:ASPxLabel runat="server" Text="Nb de Ligne à Generer:" />

                    </div>
                    <div style="float: left">
                        <dx:ASPxLabel runat="server" Text="Listes des Appareils Postes :" />
                        <%--<dx:ASPxGridView ID="Grid_Liste_AppPoste" runat="server" ClientInstanceName="Grid_app" Visible="false">
                            <SettingsBehavior AllowSelectByRowClick="True" />
                            <Styles AdaptiveDetailButtonWidth="22"></Styles>
                        </dx:ASPxGridView>--%>
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="CallbackPanel" runat="server" Width="200px">
                            <ClientSideEvents EndCallback="OnEndCallback" />
                            <PanelCollection>
                                <dx:PanelContent>
                                    <dx:ASPxTextBox ID="Txt_NbGeneration" runat="server" Width="170px" Visible="false">
                                        <ValidationSettings ErrorText="Text">
                                            <RequiredField IsRequired="true" ErrorText="Obligatoire !" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    <dx:ASPxGridLookup ID="ASPxGridLookup1" SelectionMode="Single" Visible="false" runat="server"
                                        DataSourceID="DS_LISTE_APPOSTE"
                                        AutoGenerateColumns="False" TextFormatString="{1};{2}" KeyFieldName="Appareil">
                                        <GridViewProperties>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Libelle_Gare" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Appareil" ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="poste" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nb_Ligne" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Statut" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <GridViewStyles AdaptiveDetailButtonWidth="22"></GridViewStyles>
                                        <ClearButton Visibility="Auto"></ClearButton>
                                    </dx:ASPxGridLookup>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </div>
                </div>

                <asp:SqlDataSource ID="DS_LISTE_APPOSTE" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
                    SelectCommand="SELECT RTRIM(LTRIM(T_Ordo_TypeOrdo.Libelle_Gare)) AS Libelle_Gare, T_Ordo.Appareil, T_Ordo.poste, COUNT(T_Ordo.[Numéro de l'ordre de transfert]) AS Nb_Ligne, T_Ordo.Statut FROM T_Ordo INNER JOIN T_Ordo_TypeOrdo ON T_Ordo.[Clé gare] = T_Ordo_TypeOrdo.Cle_Gare INNER JOIN T_Ordo_Appointments_DragAndDrop ON T_Ordo.AppointmentID = T_Ordo_Appointments_DragAndDrop.AppointmentID GROUP BY T_Ordo.Appareil, T_Ordo.poste, T_Ordo_TypeOrdo.Libelle_Gare, T_Ordo.Statut, T_Ordo.[Type magasin cédant] HAVING (T_Ordo_TypeOrdo.Libelle_Gare = @Param1) AND (T_Ordo.Statut = 2) AND (T_Ordo.[Type magasin cédant] = N'5AU')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Txt_NomGare" DefaultValue="AUTRES GARES" Name="Param1" PropertyName="Value" Type="string" />
                    </SelectParameters>

                </asp:SqlDataSource>
                <dx:ASPxButton runat="server" ID="btn_Generateur" Text="Ajouter Groupes" OnClick="btn_Generateur_Click"></dx:ASPxButton>

            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxDockPanel>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="ASPxPopupControl1"
        HeaderText="Figer les Demandes" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" Width="300px" Height="100px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Etes vous sur de vouloir figer les demandes ? : 
                <div style="margin-top: 20px">

                    <div style="float: left; margin-right: 10px">
                        <dx:ASPxButton runat="server" ID="bnt_Lock" OnClick="bnt_Lock_Click" Text="Oui" Theme="Moderno">
                            <ClientSideEvents Click="function(s, e) { ASPxPopupControl1.Hide(); }" />
                        </dx:ASPxButton>
                    </div>
                    <div style="float: left">
                        <dx:ASPxButton runat="server" ID="btn_Cancel" Text="Annuler" Theme="Moderno">
                            <ClientSideEvents Click="function(s, e) { ASPxPopupControl1.Hide(); }" />
                        </dx:ASPxButton>
                    </div>
                </div>

            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>



</asp:Content>

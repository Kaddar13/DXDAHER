<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SU_Gestion.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.SPEEDUP.SU_Gestion" %>

<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .categoryTable {
            width: 100%;
        }

            .categoryTable .imageCell {
                padding: 2px;
            }

            .categoryTable .textCell {
                padding-left: 20px;
                width: 100%;
            }

        .textCell .label {
            color: #969696;
        }

        .textCell .description {
            font-size: 13px;
            width: 230px;
        }
    </style>

    <script type="text/javascript">

        document.addEventListener('DOMContentLoaded', function () {
            if (Notification.permission !== "granted")
                Notification.requestPermission();
        });
        var varcomment;
        function notifyMe() {
<%--            var txt = document.getElementById('<%=myID.ClientID%>').innerText;
            console.log(txt);--%>
            if (myID.GetText() == "Ca bouge") {


                if (!Notification) {
                    alert('Attention Nouveau Speed Up.');
                    return;
                }

                if (Notification.permission !== "granted")
                    Notification.requestPermission();
                else {
                    var notification = new Notification('ALERTE : SPEED UP', {
                        icon: 'http://xfls-daher002/IMG/icondaher2.png',
                        body: "Merci de consulter votre outil de gestion.",
                    });

                }
                myID.SetText("");
            }

        }

        function OnGetRowValues(values) {


            if (cbo_statut.GetValue() == "Prise en compte") {
                var link = "mailto:" + values[0]
                        + "&subject=" + escape("Votre SpeedUp N") + values[1]
                        + "&body=Bonjour,%0A%0A Votre SpeedUp N°" + values[1] + " Reference : " + values[5] + " a été pris en compte sous le numero : " + values[1]
                        + "%0A Vous pouvez consulter son tracing à l'adresse suivante :" + escape("http://xfls-daher002/ToolBox/SPEEDUP/SU_CONSULTATION.aspx?IDSPEEDUP=" + values[1]) + " %0A Cordialement";

                window.location.href = link;

            }
            else if (cbo_statut.GetValue() == "Litige") {
                var link = "mailto:" + values[0]
                        + "&subject=" + escape("Votre SpeedUp N") + values[1]
                        + "&body=Bonjour,%0A%0A Votre SpeedUp N°" + values[1] + " Reference : " + values[5]
                        + " a été clôturé en litige pour le motif ci-dessous :  : " + window.varcomment + " %0A Cordialement";
                window.location.href = link;
            }
            else if (cbo_statut.GetValue() == "Exclusion") {

                var link = "mailto:" + values[0]
                        + "&subject=" + escape("Votre SpeedUp N") + values[1]
                        + "&body=Bonjour,%0A%0A Votre SpeedUp N°" + values[1] + " Reference : " + values[5]
                        + " a été clôturé sans traitement pour le motif ci-dessous : " + window.varcomment + " %0A Cordialement";

                window.location.href = link;
            }
            else if (cbo_statut.GetValue() == "Blocage") {

                var link = "mailto:" + values[0]
                        + "&subject=" + escape("Votre SpeedUp N") + values[1]
                        + "&body=Bonjour,%0A%0A Votre SpeedUp N°" + values[1] + " Reference : " + values[5]
                        + " a été bloqué sans traitement pour le motif ci-dessous : " + cbo_blocage.GetValue() + "Commentaire :" + window.varcomment + " %0A Cordialement";

                window.location.href = link;
            }

            //location.reload();


        }

        function OnUpdateClick(s, e) {
            if (s.cpInfo != 'undefined') {

                grid.GetRowValues(grid.GetFocusedRowIndex(), 'UserDemande;IDSPEEDUP;Fn_Statut;Exclusion;Exlusion_Commentaires;Reference', OnGetRowValues);

            }




        }
        function OnBlocageChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            if (selectedIndex == '3')
                FormEdit.GetItemByName("cbo_blocage").SetVisible(true);
            else {
                FormEdit.GetItemByName("cbo_blocage").SetVisible(false);
            }
        }

        function FilterOn(s, e) {
            var filterCondition = "[Fn_Statut]='Encours' Or [Fn_Statut]='Creation'";
            grid.ApplyFilter(filterCondition);
            isFiltered = true;
        }

        function OnSaveClick(s, e) {

            //
            //
            if (ASPxClientEdit.ValidateGroup('group1')) {
                grid.UpdateEdit();
                grid.GetRowValues(grid.GetFocusedRowIndex(), 'UserDemande;IDSPEEDUP;Fn_Statut;Exclusion;Exlusion_Commentaires;Reference', OnGetRowValues);
            } else {
                //return alert('oops');
            }



        }
        function OnGetAffectation(values) {



            if (values[0].trim() == 'Reception') {
                imgProcdedure.SetImageUrl('/img/SU_PROC/su_pro_reception.jpg');
            }
            else if (values[0].trim() == 'Expeditions Florides') {
                imgProcdedure.SetImageUrl('/img/SU_PROC/SU_pro_ExpFl.jpg');
            }
            else if (values[0].trim() == 'Expeditions R7') {
                imgProcdedure.SetImageUrl('/img/SU_PROC/SU_pro_ExpR7.jpg');
            }
            else if (values[0].trim() == 'Distribution') {
                imgProcdedure.SetImageUrl('/img/SU_PROC/SU_pro_Distri.jpg');
            }
            else if (values[0].trim() == 'Magasin') {
                imgProcdedure.SetImageUrl('/img/SU_PROC/SU_pro_Magasin.jpg');
            }
            else if (values[0].trim() == 'Market Place') {
                imgProcdedure.SetImageUrl('/img/SU_PROC/SU_pro_MP.jpg');
            }


        }

        function Image(s, e) {

            grid.GetRowValues(grid.GetFocusedRowIndex(), 'Fn_Affectation;Fn_Statut', OnGetAffectation);
        }

        function Memo(s, e) {
            window.varcomment = s.GetText();
        }
    </script>

    <asp:Literal ID="mail" runat="server" Text=""></asp:Literal>
    <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to XLSX" UseSubmitBehavior="False" OnClick="btnXlsExport_Click" />
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" ExportEmptyDetailGrid="True" GridViewID="grid"></dx:ASPxGridViewExporter>
    <dx:ASPxTimer ID="timer" runat="server" Interval="1200000" OnTick="timer_Tick" ClientSideEvents-Tick="notifyMe">
    </dx:ASPxTimer>
    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Gestion SpeedUp " />
    <dx:ASPxTextBox runat="server" ID="myID" ClientInstanceName="myID" ClientVisible="False"></dx:ASPxTextBox>
    <%--<dx:ASPxTextBox ID="ASPxLabel2" runat="server" Text="" ClientInstanceName="DetailNotes"/>--%>

    <dx:ASPxGridView ID="grid" runat="server"
        ClientInstanceName="grid" AutoGenerateColumns="False" DataSourceID="DS_Grid" KeyFieldName="IDSPEEDUP" Theme="MetropolisBlue"
        OnStartRowEditing="grid_StartRowEditing"
        OnRowUpdated="grid_RowUpdated"        
        OnCellEditorInitialize="grid_CellEditorInitialize"
        >
        <ClientSideEvents/>
        <SettingsDetail ShowDetailRow="true" />
		<SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
        <SettingsPager>
            <PageSizeItemSettings Visible="True">
            </PageSizeItemSettings>
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowGroupPanel="True" ShowFooter="True" ShowFilterBar="Visible" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="True" AllowInsert="False" />





        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem Caption="Exclusion" ColumnName="Exclusion" Name="cbo_exclusion" >

                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem Caption="Commentaire Exclu." ColumnName="Exlusion_Commentaires">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>


        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowDeleteButton="False" VisibleIndex="0" ShowClearFilterButton="True" ButtonType="Button">
            </dx:GridViewCommandColumn>
       <dx:GridViewDataColumn FieldName="Fn_Statut" VisibleIndex="2" Caption="Statut">
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataColumn>
            
            <dx:GridViewDataColumn FieldName="Fn_Affectation" VisibleIndex="2" Caption="Affectation">
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataColumn>

            <dx:GridViewDataTextColumn FieldName="IDSPEEDUP" VisibleIndex="3" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SU_EOTP" VisibleIndex="22" Caption="EOTP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AOG" VisibleIndex="23">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SU_Localisation" VisibleIndex="24" Caption="Localisation">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Stock_Mag" VisibleIndex="39" Caption="Magasin">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SU_Site" VisibleIndex="25" Caption="Site">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SU_Type" VisibleIndex="26" Caption="Type">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DateDemande" VisibleIndex="30">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
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
            <dx:GridViewDataTextColumn FieldName="UserDemande" VisibleIndex="31">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Dagedim_Gare" VisibleIndex="36" Visible="False">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="SPEED-UP RECEPTION" Value="MAR09ZGA4" />
                        <dx:ListEditItem Text="SPEED-UP EXPEDITION" Value="MAT10ZGA3" />
                        <dx:ListEditItem Text="SPEED-UP DISTRIBUTION" Value="MAT10ZGA4" />
                        <dx:ListEditItem Text="SPEED-UP MAGASIN" Value="MAT10ZGA5" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn VisibleIndex="6" Caption="Print">
                <DataItemTemplate>
                    <dx:ASPxButton runat="server" ID="btn_print" OnClick="ASPxButton1_Click" Text="" Image-IconID="print_print_16x16" Height="16" Width="16" Theme="MetropolisBlue"></dx:ASPxButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Exclusion" VisibleIndex="4">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="Exclusion" Value="Exclusion" />
                        <dx:ListEditItem Text="Litige" Value="Litige" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                    <ValidationSettings ValidationGroup="gr1">
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataMemoColumn FieldName="Exlusion_Commentaires" VisibleIndex="37" Visible="False">
                <PropertiesMemoEdit>
                    <ValidationSettings ValidationGroup="gr1">
                    </ValidationSettings>
                </PropertiesMemoEdit>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataTextColumn FieldName="Reference" VisibleIndex="38" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="SU_Affectation" VisibleIndex="5" Visible="false">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="En Reception" Value="En Reception" />
                        <dx:ListEditItem Text="En Magasin" Value="En Magasin" />
                        <dx:ListEditItem Text="En Expedition" Value="En Expedition" />
                        <dx:ListEditItem Text="En Distribution" Value="En Distribution" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="SU_Destinataire" VisibleIndex="27" Caption="Destinataire">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="SU_TrpDediee" VisibleIndex="29" Caption="Transport Dediee">
            </dx:GridViewDataTextColumn>
            <%--            <dx:GridViewDataComboBoxColumn Caption="Statut" VisibleIndex="40">
                <PropertiesComboBox AllowNull="False" DataSourceID="SqlDataSource3" TextField="MVT_Statut">
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>--%>
			<dx:GridViewDataTextColumn FieldName="Chrono" VisibleIndex="39">
            </dx:GridViewDataTextColumn>
            	<dx:GridViewDataTextColumn FieldName="Expedition_Flux" VisibleIndex="40">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Expedition_BL" VisibleIndex="41">
            </dx:GridViewDataTextColumn>

        </Columns>
        <Templates>
            <DetailRow>
                <dx:ASPxPageControl runat="server" ID="pagecontrol" EnableCallBacks="true" Theme="MetropolisBlue">
                    <TabPages>
                        <dx:TabPage Text="Mouvement">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView ID="GridMouvement" runat="server" DataSourceID="DS_Mouvement" OnBeforePerformDataSelect="Grid_DataSelect" AutoGenerateColumns="False" Theme="Moderno">
                                        <Columns>
                                            <dx:GridViewDataDateColumn FieldName="DateMouvement" ReadOnly="True" VisibleIndex="0">
                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
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
                                            <dx:GridViewDataTextColumn FieldName="Statut" VisibleIndex="1" ReadOnly="True">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Gare de destination" VisibleIndex="2" ReadOnly="True">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="LC" VisibleIndex="3" ReadOnly="True">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="IDSPEEDUP" VisibleIndex="4" ReadOnly="True">
                                            </dx:GridViewDataTextColumn>
											<dx:GridViewDataTextColumn FieldName="Utilisateur" VisibleIndex="4" ReadOnly="True">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>

                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>

                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="En Reception" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView runat="server" ID="GridReception" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect" Theme="MetropolisBlue">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Reception_BR" VisibleIndex="18">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reception_Commande" VisibleIndex="19">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn FieldName="Reception_DateLivraison" VisibleIndex="17">
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
                                            <dx:GridViewDataTextColumn FieldName="Reception_Fournisseur" VisibleIndex="15">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reception_Origine" VisibleIndex="22">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reception_Track" VisibleIndex="14">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reception_Transporteur" VisibleIndex="16">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reception_ZLECI" VisibleIndex="21">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reception_PosteCommande" VisibleIndex="20">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reference" VisibleIndex="23">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Quantite" VisibleIndex="25">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="24">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>

                        </dx:TabPage>
                    </TabPages>
                    <TabPages>
                        <dx:TabPage Text="En Distribution" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView runat="server" ID="Distribution" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect" Theme="MetropolisBlue">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Distribtuion_GareArrivee" VisibleIndex="16">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Distribtuion_GareDepart" VisibleIndex="14">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="DocLibre" VisibleIndex="17">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>

                        </dx:TabPage>
                    </TabPages>
                    <TabPages>
                        <dx:TabPage Text="En Magasin" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView runat="server" ID="ASPxGridView2" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect" Theme="MetropolisBlue">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Stock_Mag" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="OT" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="OT_Poste" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reference" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>

                        </dx:TabPage>
                    </TabPages>
                    <TabPages>
                        <dx:TabPage Text="Entree sur Dossier" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView runat="server" ID="ASPxGridView3" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect" Theme="MetropolisBlue">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Dossier_Demandeur" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Dossier_OF" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>

                        </dx:TabPage>
                    </TabPages>
                    <TabPages>
                        <dx:TabPage Text="En Expedition" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView runat="server" ID="ASPxGridView4" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect" Theme="MetropolisBlue">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="OT" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="OT_Poste" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Expedition_Appareil" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Expedition_BE" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Expedition_FAL" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="DocLibre" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Reference" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Quantite" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>

                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>

                        </dx:TabPage>

                        <dx:TabPage Text="Guichet MACS" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView runat="server" ID="ASPxGridView6" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect" Theme="MetropolisBlue">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="BL" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>

                          <dx:TabPage Text="Divers" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView runat="server" ID="ASPxGridView5" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect" Theme="MetropolisBlue">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="SU_Commentaire" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="SU_Telephone" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Guichet R7" FieldName="Autre_Litige" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Autre Commentaire" FieldName="Autre_Commentaire" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Autre_PVL" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>


                        <dx:TabPage Text="Exclusion" Visible="true">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView runat="server" ID="ASPxGridView1" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect" Theme="MetropolisBlue">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Exclusion" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Exlusion_Commentaires" VisibleIndex="1">
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
            <EditForm>
             
                <dx:ASPxPageControl runat="server" ID="pageEdit" ClientInstanceName="pageEdit" Theme="Moderno" >
                    
                    <TabPages>
                        <dx:TabPage Text="Statut">
                            <ContentCollection>
                                <dx:ContentControl>                                    
                                    <dx:ASPxFormLayout runat="server" ID="FormEdit" ClientInstanceName="FormEdit" Theme="Moderno" ClientSideEvents-Init="Image" Width="800px">
                                        <Items>
                                            <dx:LayoutGroup ColCount="2">
                                                <Items>
                                        
                                            <dx:LayoutGroup GroupBoxDecoration="None">
                                                <Items>                                                   

                                                    <%--AfFectation--%>
                                                    <dx:LayoutItem Caption="Affectation" FieldName="MVT_Affectation">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>                                                                
 
                                                                <dx:ASPxComboBox runat="server" ID="cbo_mvtAffectation" Theme="MetropolisBlue" DataSourceID="DS_AFFECTATION" TextField="MVT_Affecation" ValueField="MVT_Affecation">
                                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){ cbo_statut.PerformCallback() ;}" />
                                                                   <ValidationSettings  CausesValidation="true" Display="Dynamic" ValidateOnLeave="true" ValidationGroup="group1">
                                            <RequiredField IsRequired="true" ErrorText="*" />
                                        </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                       <%--Statut--%>
                                                     <dx:LayoutItem Caption="Statut" FieldName="mvt_Statut">
                                                         <LayoutItemNestedControlCollection>
                                                             <dx:LayoutItemNestedControlContainer>
                                                                 <dx:ASPxComboBox runat="server" ID="cbo_mvtStatut" ValueType="System.String" Theme="MetropolisBlue" Name="cbo_statut" ClientInstanceName="cbo_statut" OnCallback="cbo_mvtStatut_Callback" 
                                                                     ValueField="MVT_Statut" TextField="MVT_Statut">
                                                                     <ClientSideEvents 
                                                                         SelectedIndexChanged="OnBlocageChanged" 
                                                                          />
                                                                     <ValidationSettings CausesValidation="true" Display="Dynamic" ValidationGroup="group1" ValidateOnLeave="true">
                                                                         <RequiredField IsRequired="true" ErrorText="*" />
                                                                     </ValidationSettings>
                                                                 </dx:ASPxComboBox>
                                                                 <asp:SqlDataSource ID="DS_Statut" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
                                                                     SelectCommand="SELECT MVT_STatut FROM [T_Speedup_MvtStatut] WHERE MVT_Affecation LIKE @MVT_Affecation">
                                                                     <SelectParameters>
                                                                         <asp:ControlParameter ControlID="cbo_mvtAffectation" Name="MVT_Affecation" DefaultValue="Réception" PropertyName="Value" />
                                                                     </SelectParameters>
                                                                 </asp:SqlDataSource>
                                                             </dx:LayoutItemNestedControlContainer>
                                                         </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <%--Blocage--%>
                                                    <dx:LayoutItem Caption="Type Blocage" ClientVisible="false" Name="cbo_blocage">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>
                                                                <dx:ASPxComboBox runat="server" ID="cbo_blocage" Theme="MetropolisBlue" ClientInstanceName="cbo_blocage">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Douane Import" Value="Douane Import"/>
                                                                        <dx:ListEditItem Text="Control Export" Value="Control Export"/>
                                                                        <dx:ListEditItem Text="Douane Export" Value="Douane Export"/>
                                                                         <dx:ListEditItem Text="Attente Cotation" Value="Attente Cotation" />
                                                                    </Items>
                                                                </dx:ASPxComboBox>

                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>

                                                    <%--Expedition_Flux--%>
                                                    <dx:LayoutItem Caption="Expedition Flux">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>
                                                                <dx:ASPxComboBox runat="server" ID="cbo_expeFLux"  Theme="MetropolisBlue">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Mono-Colis" Value="Mono-Colis"/>
                                                                        <dx:ListEditItem Text="Programme" Value="Programme"/>                                         
                                                                    </Items>
                                                                </dx:ASPxComboBox>

                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>

                                                    <%--Expedition_BL--%>
                                                    <dx:LayoutItem Caption="Expedition Num BL">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>
                                                                <dx:ASPxTextBox runat="server" ID="expe_BL" Theme="MetropolisBlue">															
																</dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <%--Cmmentaire--%>
                                                    <dx:LayoutItem Caption="Commentaire">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>
                                                                <dx:ASPxMemo runat="server" ID="memo_Commentaire" Theme="MetropolisBlue" ClientInstanceName="memo_Commentaire">
																<ClientSideEvents TextChanged="Memo"/>
																</dx:ASPxMemo>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>
                                                               <dx:ASPxButton ID="btnUpdate" runat="server"  Text="Sauvegarder" ClientSideEvents-Click="OnSaveClick"  
                                                                   Theme="MetropolisBlue" AutoPostBack="false"/>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
</dx:LayoutGroup>
                                            <dx:LayoutGroup ColCount="2" Caption="Procedure">
                                                <Items>

                                                    <dx:LayoutItem ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>
                                                                <dx:ASPxImage runat="server" ImageUrl="~/img/daher_logo.png" ClientInstanceName="imgProcdedure" Width="800">

                                                                </dx:ASPxImage>
                                                                
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>


                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
											  </Items>
                                            </dx:LayoutGroup>



                                        </Items>
                                    </dx:ASPxFormLayout>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>

                        <dx:TabPage Text="Exclusion" ClientVisible="False" >
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                  <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server" />
                                     <dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormUpdateButton" runat="server"/>
                                                           

    <asp:SqlDataSource ID="DS_AFFECTATION" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT MVT_Affecation FROM [T_Speedup_MvtStatut] ">
    </asp:SqlDataSource>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>

                                         
                    </TabPages>
                </dx:ASPxPageControl>
                <div style="margin-top: 30px">                  

                     <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server" />
  
                </div>

            </EditForm>
        </Templates>

        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="IDSPEEDUP" SummaryType="Count" />
        </GroupSummary>
<FormatConditions>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" FieldName="Chrono" Expression="Chrono>=120" Format="Custom">
                    <RowStyle BackColor="Green" ForeColor="White" />
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" FieldName="Chrono" Expression="Chrono>60 and Chrono<120" Format="Custom">
                    <RowStyle BackColor="#ffe680" ForeColor="Black" />
                </dx:GridViewFormatConditionHighlight>
				       <dx:GridViewFormatConditionHighlight ApplyToRow="True" FieldName="Chrono" Expression="Chrono>=0 and Chrono<60" Format="Custom">
                    <RowStyle BackColor="#ffbf80" ForeColor="Black" />
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" FieldName="Chrono" Expression="Chrono<0" Format="Custom">
                    <RowStyle BackColor="#ff8080" ForeColor="White" />
                </dx:GridViewFormatConditionHighlight>
                
        
            </FormatConditions>
        <Styles AdaptiveDetailButtonWidth="22"></Styles>

    </dx:ASPxGridView>

    <asp:SqlDataSource ID="DS_Grid" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        DeleteCommand="DELETE FROM [T_SPEEDUP] WHERE [IDSPEEDUP] = @original_IDSPEEDUP"
        InsertCommand="INSERT INTO [T_SPEEDUP] ([Autre_Litige], [Autre_Commentaire], [Autre_PVL], [Designation], [Distribtuion_GareArrivee], [Distribtuion_GareDepart], [DocLibre], [Dossier_Demandeur], [Dossier_OF], [Expedition_Appareil], [Expedition_BE], [Expedition_FAL], [OT], [OT_Poste], [Quantite], [Reception_BR], [Reception_Commande], [Reception_DateLivraison], [Reception_Fournisseur], [Reception_Origine], [Reception_Track], [Reception_Transporteur], [Reception_ZLECI], [Reception_PosteCommande], [Reference], [Stock_Mag], [SU_Destinataire], [SU_EOTP], [SU_Localisation], [SU_Site], [SU_SiteDepart], [SU_Type], [DateDemande], [UserDemande], [Dagedim_LCS], [Dagedim_DateLCS]) VALUES (@Autre_Litige, @Autre_Commentaire, @Autre_PVL, @Designation, @Distribtuion_GareArrivee, @Distribtuion_GareDepart, @DocLibre, @Dossier_Demandeur, @Dossier_OF, @Expedition_Appareil, @Expedition_BE, @Expedition_FAL, @OT, @OT_Poste, @Quantite, @Reception_BR, @Reception_Commande, @Reception_DateLivraison, @Reception_Fournisseur, @Reception_Origine, @Reception_Track, @Reception_Transporteur, @Reception_ZLECI, @Reception_PosteCommande, @Reference, @Stock_Mag, @SU_Destinataire, @SU_EOTP, @SU_Localisation, @SU_Site, @SU_SiteDepart, @SU_Type, @DateDemande, @UserDemande, @Dagedim_LCS, @Dagedim_DateLCS)" OldValuesParameterFormatString="original_{0}"
        SelectCommand=" SELECT TOP 5000 *, DATEDIFF(minute,GETDATE(),DATEADD(hour,4,DateDemande)) as Chrono
		FROM T_SPEEDUP
		WHERE 
		(RTRIM(Fn_Affectation) LIKE @SU_Affectation OR Fn_Affectation IS NULL) and ([Stock_Mag] LIKE @SU_Magasin  or [Stock_Mag] IS NULL)
		and Type_Demande = 'SPEEDUP' AND DateDemande > '30/10/2016' 
		AND (fn_Statut = 'Encours' or fn_Statut='Creation' or fn_statut is  null or fn_Statut = 'En attente' Or fn_Statut = 'En Blocage')
		ORDER BY DateDemande desc"
		
        UpdateCommand="
        UPDATE [T_SPEEDUP] 
        SET 
        [Expedition_Flux]=@expe_Flux,
        [Expedition_BL]=@expe_BL
        WHERE [IDSPEEDUP] = @IDSPEEDUP">
        <DeleteParameters>
            <asp:Parameter Name="original_IDSPEEDUP" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Autre_Litige" Type="String" />
            <asp:Parameter Name="Autre_Commentaire" Type="String" />
            <asp:Parameter Name="Autre_PVL" Type="Int32" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="Distribtuion_GareArrivee" Type="String" />
            <asp:Parameter Name="Distribtuion_GareDepart" Type="String" />
            <asp:Parameter Name="DocLibre" Type="String" />
            <asp:Parameter Name="Dossier_Demandeur" Type="String" />
            <asp:Parameter Name="Dossier_OF" Type="String" />
            <asp:Parameter Name="Expedition_Appareil" Type="String" />
            <asp:Parameter Name="Expedition_BE" Type="String" />
            <asp:Parameter Name="Expedition_FAL" Type="String" />
            <asp:Parameter Name="OT" Type="String" />
            <asp:Parameter Name="OT_Poste" Type="String" />
            <asp:Parameter Name="Quantite" Type="String" />
            <asp:Parameter Name="Reception_BR" Type="String" />
            <asp:Parameter Name="Reception_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="Reception_DateLivraison" />
            <asp:Parameter Name="Reception_Fournisseur" Type="String" />
            <asp:Parameter Name="Reception_Origine" Type="String" />
            <asp:Parameter Name="Reception_Track" Type="String" />
            <asp:Parameter Name="Reception_Transporteur" Type="String" />
            <asp:Parameter Name="Reception_ZLECI" Type="String" />
            <asp:Parameter Name="Reception_PosteCommande" Type="String" />
            <asp:Parameter Name="Reference" Type="String" />
            <asp:Parameter Name="Stock_Mag" Type="String" />
            <asp:Parameter Name="SU_Destinataire" Type="String" />
            <asp:Parameter Name="SU_EOTP" Type="String" />
            <asp:Parameter Name="SU_Localisation" Type="String" />
            <asp:Parameter Name="SU_Site" Type="String" />
            <asp:Parameter Name="SU_SiteDepart" Type="String" />
            <asp:Parameter Name="SU_Type" Type="Int32" />
            <asp:Parameter Name="DateDemande" Type="DateTime" />
            <asp:Parameter Name="UserDemande" Type="String" />
            <asp:Parameter Name="Dagedim_LCS" Type="String" />
            <asp:Parameter DbType="Date" Name="Dagedim_DateLCS" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="expe_Flux" Type="String" />
            <asp:Parameter Name="expe_BL" Type="String" />
            <asp:Parameter Name="IDSPEEDUP" Type="Int32" />

        </UpdateParameters>
		<SelectParameters>
            <asp:QueryStringParameter Name="SU_Affectation" Direction="Input" QueryStringField="SU_Affectation" DefaultValue="%" ConvertEmptyStringToNull="True"/>
			<asp:QueryStringParameter Name="SU_Magasin" Direction="Input" QueryStringField="SU_Magasin" DefaultValue="%" ConvertEmptyStringToNull="True"/>
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="DS_Detail" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_SPEEDUP] WHERE IDSPEEDUP = @IDSPEEDUP">
        <SelectParameters>
            <asp:SessionParameter Name="IDSPEEDUP" SessionField="IDSPEEDUP" Type="Int32" />
            <asp:QueryStringParameter Name="@SULOCALISATION" Direction="Input" QueryStringField="ID" ConvertEmptyStringToNull="True" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="DS_Mouvement" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        InsertCommand="INSERT INTO 
        [T_SpeedUp_Mouvement] 
        (
        [Statut], 
        [Affectation],
        [IDSPEEDUP] ,
        [Commentaire],
		[USER]
       ) 
        VALUES 
        (
        @Statut, 
        @Affectation,
        @IDSPEEDUP,
        @Commentaire,
		@USER
        )"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * 
FROM(
SELECT TRY_CAST([Date de création] as Datetime) As DateMouvement,'Creation LC' as Statut,[Gare de destination],[Référenceélémentdistribué] as LC,fl3 as IDSPEEDUP,'' as Utilisateur
FROM T_OD2_SPEEDUP
UNION
SELECT try_CAST([Date clôture] as DATETIME),'Cloture LC' ,[Gare de destination],Référenceélémentdistribué,FL3,''
FROM T_OD2_SPEEDUP
UNION
SELECT try_CAST([Date de 1ère prise] as DATETIME),'Prise LC',[Gare de destination],Référenceélémentdistribué,fl3,''
FROM T_OD2_SPEEDUP
UNION
SELECT try_CAST([Date de remise] as DATETIME),'Remise LC',[Gare de destination],Référenceélémentdistribué,fl3,''
FROM T_OD2_SPEEDUP

UNION

SELECT 
      [Date_Mouvement]
      ,[T_SpeedUp_Mouvement].[Statut]
      ,[Affectation]
      ,[Commentaire]
      ,CAST([IDSPEEDUP] as VARCHAR(10)) 
	  ,[User]
  FROM [Dashboard].[dbo].[T_SpeedUp_Mouvement]
  ) as t
 WHERE t.[IDSPEEDUP] LIKE @IDSPEEDUP AND Statut is Not null and DateMouvement <> '1900-01-01 00:00:00.000' AND DateMouvement <>''" >
        <SelectParameters>
            <asp:SessionParameter Name="IDSPEEDUP" SessionField="IDSPEEDUP" Type="Int32" />
            <asp:QueryStringParameter Name="@SULOCALISATION" Direction="Input" QueryStringField="ID" ConvertEmptyStringToNull="True" DefaultValue="%" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="IDSPEEDUP" Type="Int32" />
            <asp:Parameter Name="Affectation" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
			<asp:Parameter Name="USER" Type="String"/>
        </InsertParameters>



    </asp:SqlDataSource>


    <asp:SqlDataSource ID="DS_Statut" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT MVT_STatut FROM [T_Speedup_MvtStatut] GROUP BY MVT_STatut"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_BLOCAGE" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT Type_Blocage FROM [T_Speedup_MvtStatut] GROUP BY Type_Blocage"></asp:SqlDataSource>

    <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" Theme="MetropolisBlue"
        PopupElementID="popupArea" CloseAction="CloseButton"
        AllowDragging="true" CloseOnEscape="True" Modal="True" ShowCollapseButton="True" ShowMaximizeButton="True">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div>
                    <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server">
                    </dx:ASPxWebDocumentViewer>
                </div>

            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel">
    </dx:ASPxLabel>

    <dx:ASPxTextBox ID="IdReport" runat="server" Width="170px" Text="1057" ClientVisible="false"></dx:ASPxTextBox>


</asp:Content>


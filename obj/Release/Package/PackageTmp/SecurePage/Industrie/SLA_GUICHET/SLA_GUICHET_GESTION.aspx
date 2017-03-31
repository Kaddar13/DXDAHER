<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SLA_GUICHET_GESTION.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.SLA_GUICHET.SLA_GUICHET_GESTION" %>
<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <script>
           window.onload = function () {

               hidden_actvity.SetValue($_GET('id'));
           }
           document.addEventListener('DOMContentLoaded', function () {
               if (Notification.permission !== "granted")
                   Notification.requestPermission();
           });

           function $_GET(param) {
               var vars = {};
               window.location.href.replace(location.hash, '').replace(
                   /[?&]+([^=&]+)=?([^&]*)?/gi, // regexp
                   function (m, key, value) { // callback
                       vars[key] = value !== undefined ? value : '';
                   }
               );

               if (param) {
                   return vars[param] ? vars[param] : null;
               }
               return vars;

           }

           function notifyMe() {
               if (myID.GetText() == "Ca bouge") {


                   if (!Notification) {
                       alert('Attention Nouvelle Resa.');
                       return;
                   }

                   if (Notification.permission !== "granted")
                       Notification.requestPermission();
                   else {
                       var notification = new Notification('ALERTE : GUICHET', {
                           icon: 'http://xfls-daher002/IMG/icondaher2.png',
                           body: "Merci de consulter votre outil de gestion.",
                       });

                   }
                   myID.SetText("");
               }

           }

           function OnGetRowValues(values) {


               if (values[2] == "REFUSEE") {
                   var link = "mailto:" + values[0]
                           + "&subject=" + escape("REFUS de votre Reservation Guichet N°") + values[1]
                           + "&body=Bonjour,%0A%0A Votre Reservation Guichet N°" + values[1]
                           + " a ete refusée pour le Motif : " + ValeurNull(values[3]) + ValeurNull(values[14])
                           + " %0A Cordialement";

                   window.location.href = link;

               }
               else if (values[2] == "ACCEPTEE") {
                   var link = "mailto:" + values[0]
                           + "&subject=" + escape("Votre Reservation Guichet N°") + values[1]
                           + "&body=Bonjour,%0A%0A Votre  Reservation Guichet N°" + values[1]
                           + " a bien été prise en compte , elle sera disponible dans un delai de 1 heure ."
                           + " %0A Cordialement";
                   window.location.href = link;
               }

               else if (values[2] == "PARTIELLE") {
                   var link = "mailto:" + values[0]
                                         + "&subject=" + escape("Votre Reservation Guichet N°") + values[1]
                                         + "&body=Bonjour,%0A%0A Votre  Reservation Guichet N°" + values[1]
                                         + " a ete traite de mainiere partielle :" + "%0A%0A"
                                         + " Reference1 :" + ValeurNull(values[4]) + " OT1 :" + ValeurNull(values[5]) + "%0A%0A"
                                         + " Reference2 :" + ValeurNull(values[6]) + " OT2 :" + ValeurNull(values[7]) + "%0A%0A"
                                         + " Reference3 :" + ValeurNull(values[8]) + " OT3 :" + ValeurNull(values[9]) + "%0A%0A"
                                         + " Reference4 :" + ValeurNull(values[10]) + " OT4 :" + ValeurNull(values[11]) + "%0A%0A"
                                         + " Reference5 :" + ValeurNull(values[12]) + " OT5 :" + ValeurNull(values[13]) + "%0A%0A"
                                         + " %0A Cordialement";
                   window.location.href = link;
               }

           }

           function ValeurNull(FieldE) {
               if (FieldE == null) {
                   return ""
               } else {
                   return FieldE
               }

           }

           function OnUpdateClick(s, e) {


               if (typeof (s.cpInfo) != 'undefined') {
                   //alert(s.cpInfo);
                   grid.customCallbackExecuted = true;
                   grid.GetRowValues(grid.GetFocusedRowIndex(), 'UserDemande;IDGUICHET;Exclusion;Exlusion_Commentaires;Reference;OT;Reference2;OT2;Reference3;OT3;Reference4;OT4;Reference5;OT5;Guichet_ExclusionMagasin', OnGetRowValues);
                   //setTimeout(function () {
                   //    location.reload()
                   //}, 10);
               }

               s.cpInfo = undefined;
               //alert("cp : " + s.cpInfo + "/" + "cb : " + grid.customCallbackExecuted);

               //if (s.cpInfo && !grid.customCallbackExecuted) {
               //    grid.customCallbackExecuted = true;
               //    grid.GetRowValues(grid.GetFocusedRowIndex(), 'UserDemande;IDGUICHET;Dagedim_LCS;Exclusion;Dagedim_Gare;Exlusion_Commentaires', OnGetRowValues);
               //    //setTimeout(function () {
               //    //    location.reload()
               //    //}, 10);

               //   ;
               //}

           }


    </script>
    <div>

        <dx:ASPxTextBox ID="hidden_actvity" runat="server" ClientInstanceName="hidden_actvity" Width="170px" ClientVisible="false"></dx:ASPxTextBox>


        <dx:ASPxTextBox runat="server" ID="myID" ClientInstanceName="myID" ClientVisible="False"></dx:ASPxTextBox>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Gestion Resa. Guichet " />
        <dx:ASPxTimer ID="timer" runat="server" Interval="500000" OnTick="timer_Tick" ClientSideEvents-Tick="notifyMe">
        </dx:ASPxTimer>

        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="IDGUICHET" Theme="MetropolisBlue" OnCellEditorInitialize="grid_CellEditorInitialize" OnRowUpdated="grid_RowUpdated" ClientInstanceName="grid">
            <ClientSideEvents EndCallback="OnUpdateClick" />
            <SettingsDetail ShowDetailRow="false" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowHeaderFilterButton="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <EditFormLayoutProperties ColCount="2">
                <Items>
                    <dx:GridViewColumnLayoutItem ColumnName="Exclusion">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Exlusion_Commentaires">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Exclusion Magasin">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Guichet_RemiseClient" ColSpan="2">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Guichet_Distri" ClientVisible="False" ColSpan="2">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Guichet_Depose" ColSpan="2">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewLayoutGroup ColCount="3" Caption="Reference :" ColSpan="2" HorizontalAlign="Center" UseDefaultPaddings="False" Visible="false">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="Reference" Caption="Reference1">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Quantite" Caption="Qte 1">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="OT" Caption="OT1">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Reference2">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Qte2">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="OT2">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Reference3">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Qte3">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="OT3">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Reference4">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Qte4">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="OT4">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Reference5">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Qte5">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="OT5">
                            </dx:GridViewColumnLayoutItem>
                        </Items>
                    </dx:GridViewLayoutGroup>
                    <dx:GridViewColumnLayoutItem ColumnName="SU_Commentaire" Caption="Commentaire :" ColSpan="2">
                    </dx:GridViewColumnLayoutItem>
                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                    </dx:EditModeCommandLayoutItem>
                </Items>
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="TargetDate" ReadOnly="True" VisibleIndex="1" Caption="Cible">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IDGUICHET" ReadOnly="True" VisibleIndex="2" Caption="ID Resa">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DateDemande" VisibleIndex="5">
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
                <dx:GridViewDataTextColumn VisibleIndex="9" Caption="Print">
                    <DataItemTemplate>
                        <dx:ASPxButton runat="server" ID="btn_printPlaquette" OnClick="btn_print_Click" Text="" Image-IconID="print_print_32x32office2013" Height="16" Width="16" Theme="MetropolisBlue" VisibleIndex="14"></dx:ASPxButton>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserDemande" VisibleIndex="6" Caption="Demandeur">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SU_EOTP" VisibleIndex="18" Caption="Sigle" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Stock_Mag" VisibleIndex="7" Caption="Magasin">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Num_Resa" VisibleIndex="4" Caption="Resa / OT">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Type_Demande" VisibleIndex="20" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Guichet_RemiseClient" VisibleIndex="8" Caption="Date remise client">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">

                        <TimeSectionProperties>
                            <TimeEditProperties>
                                <ClearButton Visibility="Auto"></ClearButton>
                            </TimeEditProperties>
                        </TimeSectionProperties>

                        <ClientSideEvents ButtonClick="function(s, e) {
       var date = new Date();
   s.SetDate(date);
}" />

                        <ClearButton Visibility="Auto">
                        </ClearButton>
                        <Buttons>
                            <dx:EditButton Text="Maintenant">
                            </dx:EditButton>
                        </Buttons>

                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Exclusion" VisibleIndex="14">
                    <PropertiesComboBox AllowNull="False">
                        <Items>
                            <dx:ListEditItem Text="REFUSEE" Value="REFUSEE" />
                            <dx:ListEditItem Text="ACCEPTEE" Value="ACCEPTEE" />
                            <dx:ListEditItem Text="PARTIELLE" Value="PARTIELLE" />
                        </Items>
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Exlusion_Commentaires" VisibleIndex="15">
                    <PropertiesComboBox AllowNull="False">
                        <Items>
                            <dx:ListEditItem Text="RESA NON VALIDE" Value="RESA NON VALIDE" />
                            <dx:ListEditItem Text="RESA POUR MAG HORS R7" Value="RESA POUR MAG HORS R7" />
                            <dx:ListEditItem Text="BLOQUE LEX" Value="BLOQUE LEX" />
                            <dx:ListEditItem Text="BLOQUE MAN" Value="BLOQUE MAN" />
                            <dx:ListEditItem Text="BLOQUE ATP" Value="BLOQUE ATP" />
                        </Items>
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="Guichet_Depose" VisibleIndex="16">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm:ss">


                        <TimeSectionProperties>
                            <TimeEditProperties>
                                <ClearButton Visibility="Auto"></ClearButton>
                            </TimeEditProperties>
                        </TimeSectionProperties>


                        <ClientSideEvents ButtonClick="function(s, e) {
       var date = new Date();
   s.SetDate(date);
}" />

                        <ClearButton Visibility="Auto">
                        </ClearButton>
                        <Buttons>
                            <dx:EditButton Text="Maintenant">
                            </dx:EditButton>
                        </Buttons>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataCheckColumn FieldName="Guichet_Distri" VisibleIndex="19" Visible="false">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="File" VisibleIndex="17">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn VisibleIndex="10" Caption="Message">
                    <DataItemTemplate>
                        <dx:ASPxButton runat="server" ID="btn_Message" OnClick="btn_Message_Click" Text="" Image-IconID="mail_mail_32x32office2013" Height="16" Width="16" Theme="MetropolisBlue" VisibleIndex="14"></dx:ASPxButton>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn FieldName="Reference" VisibleIndex="28" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OT" VisibleIndex="22" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Quantite" VisibleIndex="33" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn FieldName="Reference2" VisibleIndex="29" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OT2" VisibleIndex="23" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Qte2" VisibleIndex="34" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>



                <dx:GridViewDataTextColumn FieldName="Reference3" VisibleIndex="30" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Qte3" VisibleIndex="35" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OT3" VisibleIndex="24" Visible="false">
                </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn FieldName="Reference4" VisibleIndex="31" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Qte4" VisibleIndex="36" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OT4" VisibleIndex="25" Visible="false">
                </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn FieldName="Reference5" VisibleIndex="32" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Qte5" VisibleIndex="37" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OT5" VisibleIndex="26" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SU_Commentaire" VisibleIndex="27" Visible="false">
                </dx:GridViewDataTextColumn>





                <dx:GridViewDataComboBoxColumn FieldName="Guichet_ExclusionMagasin" VisibleIndex="21" Caption="Exclusion Magasin" Visible="false">
                    <PropertiesComboBox AllowNull="False">
                        <Items>
                            <dx:ListEditItem Text="PAS DE QTE EN STOCK" Value="PAS DE QTE EN STOCK" />
                        </Items>
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>





                <dx:GridViewDataTextColumn FieldName="Appareil" VisibleIndex="3">
                </dx:GridViewDataTextColumn>





            </Columns>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID ="Grid_Detail" runat="server" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Grid_DataSelect">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="SU_Telephone"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Guichet_ExclusionMagasin"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Guichet_Distri"></dx:GridViewDataTextColumn>
                        </Columns>

                    </dx:ASPxGridView>
                </DetailRow>
            </Templates>

            <FormatConditions>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" FieldName="Chrono" Expression="Chrono<=30 and IsNullOrEmpty([Guichet_ExclusionMagasin])" Format="Custom">
                    <RowStyle BackColor="Green" ForeColor="White" />
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" FieldName="Chrono" Expression="Chrono>30 AND Chrono<=45 AND IsNullOrEmpty([Guichet_ExclusionMagasin])" Format="Custom">
                    <RowStyle BackColor="Orange" ForeColor="White" />
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" FieldName="Chrono" Expression="Chrono>45 AND IsNullOrEmpty([Guichet_ExclusionMagasin])" Format="Custom">
                    <RowStyle BackColor="Red" ForeColor="White" />
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" FieldName="Chrono" Expression="Chrono>45 AND IsNullOrEmpty([Guichet_ExclusionMagasin])" Format="Custom">
                    <RowStyle BackColor="Red" ForeColor="White" />
                </dx:GridViewFormatConditionHighlight>

                <dx:GridViewFormatConditionHighlight ApplyToRow="True" Format="Custom" Expression="Len([Guichet_ExclusionMagasin]) &gt; 0" FieldName="Guichet_ExclusionMagasin">
                    <RowStyle BackColor="#FF99CC" Font-Bold="True" />
                </dx:GridViewFormatConditionHighlight>

            </FormatConditions>


            <Styles AdaptiveDetailButtonWidth="22"></Styles>

        </dx:ASPxGridView>



        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel">
        </dx:ASPxLabel>

        <dx:ASPxTextBox ID="IdReport" runat="server" Width="170px" Text="1056" ClientVisible="false"></dx:ASPxTextBox>

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

        <asp:SqlDataSource ID="DS_Detail" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_GUICHET] WHERE IDGUICHET = @IDGUICHET">
        <SelectParameters>
            <asp:SessionParameter Name="IDGUICHET" SessionField="IDGUICHET" Type="Int32" />
            <asp:QueryStringParameter Name="@SULOCALISATION" Direction="Input" QueryStringField="ID" ConvertEmptyStringToNull="True" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" ConflictDetection="CompareAllValues"
            OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT 
            DATEADD(HOUR,1,DateDemande) as TargetDate,
            DATEDIFF(MINUTE,DATEADD(HOUR,1,DateDemande),GETDATE() ) as Chrono,
            IDGUICHET, 
            Appareil,
            DateDemande, 
            UserDemande, 
            SU_EOTP, 
            SU_Telephone, 
            Autre_PVL, 
            Stock_Mag, Num_Resa, Reference, OT, Type_Demande, SU_Commentaire, Exclusion, Exlusion_Commentaires, Guichet_Depose, Guichet_RemiseClient, Guichet_Distri, [File], OT2, OT3, OT4, OT5, Reference2, Reference3, Qte2, Qte3, Reference4, Qte4, Reference5, Qte5, Quantite,Guichet_ExclusionMagasin FROM T_GUICHET WHERE (Type_Demande = N'GUICHET')"
            UpdateCommand="UPDATE T_GUICHET 
            SET 
            [OT]=@OT,
            [OT2]=@OT2,
            [OT3]=@OT3,
            [OT4]=@OT4,
            [OT5]=@OT5,
            [SU_Commentaire]=@SU_Commentaire,
            Exclusion= @Exclusion, 
            Exlusion_Commentaires=@Exlusion_Commentaires, 
            Guichet_Depose=@Guichet_Depose, 
            Guichet_RemiseClient=@Guichet_RemiseClient,
            Guichet_Distri=@Guichet_Distri,
            Guichet_ExclusionMagasin=@Guichet_ExclusionMagasin
           WHERE [IDGUICHET] = @original_IDGUICHET">
            <UpdateParameters>
                <asp:Parameter Name="OT" />
                <asp:Parameter Name="OT2" />
                <asp:Parameter Name="OT3" />
                <asp:Parameter Name="OT4" />
                <asp:Parameter Name="OT5" />
                <asp:Parameter Name="SU_Commentaire" />
                <asp:Parameter Name="Exclusion" />
                <asp:Parameter Name="Exlusion_Commentaires" />
                <asp:Parameter Name="Guichet_Depose" />
                <asp:Parameter Name="Guichet_RemiseClient" />
                <asp:Parameter Name="Guichet_Distri" />
                <asp:Parameter Name="Guichet_ExclusionMagasin" />
                <asp:Parameter Name="original_IDGUICHET" Type="Int32" />
            </UpdateParameters>


        </asp:SqlDataSource>



    </div>
</asp:Content>

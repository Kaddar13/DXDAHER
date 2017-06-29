<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/PADS/PADS.Master" CodeBehind="SU_NEW.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.SPEEDUP.SU_NEW" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        var lastValidationResult = false;
        function OnContactMethodChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            //alert(selectedIndex);
            formLayout.GetItemByName("tabbedGroupPageControl").SetVisible(true);
            UpdateRadioButtonListDecoration(s);
            document.getElementById('<%= HiddenField1.ClientID %>').value = s.GetValue();
            tabbedGroupPageControl.SetActiveTabIndex(selectedIndex);

        }


        function OnTypeChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            formLayout.GetItemByName("SU_Localisation").SetVisible(true);
            formLayout.GetItemByName("tabbedGroupPageControl").SetVisible(false);

            if (selectedIndex == '1') {

                formLayout.GetItemByName("SU_Destinataire").SetVisible(true);
                formLayout.GetItemByName("Autres").SetVisible(false);
                formLayout.GetItemByName("Su_TrpDediee").SetVisible(true);
                cb_panel.PerformCallback(2);

            }
            else {
                formLayout.GetItemByName("SU_Destinataire").SetVisible(false);
                formLayout.GetItemByName("Autres").SetVisible(true);
                formLayout.GetItemByName("Su_TrpDediee").SetVisible(false);
                cb_panel.PerformCallback(1);

            }


            UpdateRadioButtonListDecoration(s);

        }

        function OnDestinataireChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            if (selectedIndex == '0' || selectedIndex == '1')
                formLayout.GetItemByName("Su_TrpDediee").SetVisible(true);
            else {
                formLayout.GetItemByName("Su_TrpDediee").SetVisible(false);
            }
        }

        function UpdateRadioButtonListDecoration(radioButtonList) {
            var selectedIndex = radioButtonList.GetSelectedIndex();
            for (var i = 0; i < radioButtonList.GetItemCount() ; i++)
                radioButtonList.GetItemElement(i).parentNode.className = i === selectedIndex ? "selectedElement" : "";
        }

        function OnTabbedGroupPageControlInit(s, e) {

            s.SetActiveTabIndex(radioButtonList.GetSelectedIndex());

        }

        function OnEmailValidation(s, e) {
            var valid = mail.GetText() == retypeEmail.GetText();
            if (s === retypeEmail && mail.GetIsValid())
                e.isValid = valid;
        }

        function OnValidationComplete(s, e) {
            lastValidationResult = e.isValid;
        }

        function OnMagChanged(s, e) {

            var mag = s.GetText();
            var str = mag.replace(/\s/g, '');

            if (str.toUpperCase() == '6LM' || str.toUpperCase() == '6ES' || str.toUpperCase() == 'FL22') {
                formLayout.GetItemByName("Su_TrpDedieeMag").SetVisible(true);
            } else {
                formLayout.GetItemByName("Su_TrpDedieeMag").SetVisible(false);
            }

        }


       

    </script>
    
    <div>
        
    </div>

    <dx:ASPxGlobalEvents runat="server" ClientSideEvents-ValidationCompleted="OnValidationComplete" />

    <dx:ASPxLabel runat="server" Text="Speed Up : 8,91€ / demande" Font-Bold="True" ForeColor="Black" ></dx:ASPxLabel>

    <dx:ASPxFormLayout ID="formLayout" runat="server" ClientInstanceName="formLayout" >
        <Items>
            <dx:LayoutGroup Caption="Creation Speed Up" ColCount="1" HorizontalAlign="Center" >
               
                <Items>
                    <dx:LayoutGroup ShowCaption="false" GroupBoxDecoration="none" >
                        <Items>
                            <%--Type--%>
                            <dx:LayoutItem Caption="Type Speed Up" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >

                                        <dx:ASPxRadioButtonList ID="Rbl_SU_Type" runat="server" ClientInstanceName="Rbl_Type"
                                            ClientSideEvents-SelectedIndexChanged="OnTypeChanged" ValueType="System.String" >
                                            <ClientSideEvents Init="UpdateRadioButtonListDecoration" />
                                            <Items>
                                                <dx:ListEditItem Text="SpeedUp Interne (In-Situ et envoie aux fournisseurs externes)" Value="Interne"  />
                                                <dx:ListEditItem Text="SpeedUp Externe (inter-site)" Value="Externe"  />

                                            </Items>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxRadioButtonList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--Eotp--%>
                            <dx:LayoutItem Caption="Imputation" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <dx:ASPxComboBox ID="txt_SU_EOTP" runat="server" ValueType="System.String" DataSourceID="DS_EOTP" TextField="PROGRAMME" ValueField="EOTP">
                                                <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                        
                      <%--                  <dx:ASPxTextBox ID="txt_SU_EOTP" runat="server" Width="170px" >
										<MaskSettings Mask="<'X0'>>aaa" ErrorText="Format obligatoire X0+3 caractères alphanumériques." />
                                            <ValidationSettings SetFocusOnError="True">
<RegularExpression ValidationExpression="\w{5}" ErrorText="Format obligatoire X0+3 caractères alphanumériques."/>
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>--%>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--AOG--%>
                            <dx:LayoutItem Caption="N° AOG"  ClientVisible="false">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <dx:ASPxTextBox ID="txt_AOG" runat="server" Width="170px" >
                                                                                    </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--Telephone--%>
                            <dx:LayoutItem Caption="Telephone du demandeur :" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <dx:ASPxTextBox ID="txt_telephone" runat="server" Width="170px" >
                                            <ValidationSettings ErrorDisplayMode="Text" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--Email--%>
                            <dx:LayoutItem Caption="Email du demandeur :" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <dx:ASPxTextBox ID="txt_demandeur" runat="server" Width="170px" >
                                            <ValidationSettings ErrorDisplayMode="Text" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">
                                                <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@airbus.com" />
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--Commentaire--%>
                            <dx:LayoutItem Caption="Commentaire :" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <dx:ASPxMemo ID="txt_commentaire" runat="server" Width="170px" >
                                            <ValidationSettings ErrorDisplayMode="Text" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">
                                            </ValidationSettings>
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--SiteDepart--%>
                            <dx:LayoutItem Caption="Site" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <dx:ASPxComboBox ID="txt_SiteDepart" runat="server" ValueType="System.String" >
                                            <Items>
                                                <dx:ListEditItem Text="MAR" Value="MAR"  />												
                                                <dx:ListEditItem Text="DON" Value="DON"  />
                                                <dx:ListEditItem Text="ALB" Value="ALB"  />
                                                <dx:ListEditItem Text="PLB" Value="PLB"  />
                                            </Items>
                                            <ClearButton Visibility="Auto"></ClearButton>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--Destinataire--%>
                            <dx:LayoutItem Name="SU_Destinataire" ClientVisible="false" Caption="Destinataire" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <dx:ASPxComboBox ID="txt_su_destinataire" runat="server" ValueType="System.String"  >

                                            <Items>
                                                <dx:ListEditItem Text="DON" Value="DON"  />
                                                <dx:ListEditItem Text="ALB" Value="ALB"  />
                                                
												<dx:ListEditItem Text="MAR" Value="MAR"  />
												<dx:ListEditItem Text="PLB" Value="PLB"  />
                                            </Items>
                                            <ClearButton Visibility="Auto"></ClearButton>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--TrpDediee--%>
                            <dx:LayoutItem Name="Su_TrpDediee" Caption="Transport Dediée" ClientVisible="false">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="txt_trpDediee" runat="server">
                                            <Items>
                                                <dx:ListEditItem Text="Transport Specifique" Value="Oui" />
                                                <dx:ListEditItem  Text="Prochaine Navette" Value="Non"/>
                                            </Items>
                                             <ClearButton Visibility="Auto"></ClearButton>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox> 
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>


                            </dx:LayoutItem>
                            <%--Localisation--%>
                            <dx:LayoutItem Name="SU_Localisation" ClientVisible="false" Caption="Localisation" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="cb_panel" runat="server" Width="200px" OnCallback="ASPxCallbackPanel1_Callback" >
                                            <PanelCollection>
                                                <dx:PanelContent >
                                                    <dx:ASPxRadioButtonList ID="txt_SU_Localisation" runat="server"
                                                        AllowNull="False" ClientInstanceName="radioButtonList"
                                                        ClientSideEvents-Init="UpdateRadioButtonListDecoration"
                                                        ClientSideEvents-SelectedIndexChanged="OnContactMethodChanged"
                                                        SelectedIndex="0"
                                                        DataSourceID="SqlDataSource2"
                                                        TextField="LOCALISATION"
                                                        ValueField="LOCALISATION"  Width="314px">
                                                        <ClientSideEvents SelectedIndexChanged="OnContactMethodChanged" Init="UpdateRadioButtonListDecoration"></ClientSideEvents>
                                                         <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                                        <CaptionCellStyle>
                                                            <Border BorderStyle="None" />
                                                        </CaptionCellStyle>
                                                    </dx:ASPxRadioButtonList>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>



                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <%--SiteDepart - Externe--%>
                            <dx:LayoutItem ClientVisible="false" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <dx:ASPxComboBox ID="txt_SiteDepart2" runat="server" ValueType="System.String" >
                                            <Items>
                                                <dx:ListEditItem Text="MAR" Value="MAR"  />
                                                <dx:ListEditItem Text="DON" Value="DON"  />
                                                <dx:ListEditItem Text="ALB" Value="ALB"  />
                                                <dx:ListEditItem Text="LCN" Value="LCN"  />
                                            </Items>
                                            <ClearButton Visibility="Auto"></ClearButton>
                                        </dx:ASPxComboBox>


                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                        </Items>
                    </dx:LayoutGroup>
                    <dx:TabbedLayoutGroup Name="tabbedGroupPageControl" ClientInstanceName="tabbedGroupPageControl" ShowGroupDecoration="false" ClientVisible="false" >
                        <Items>
                            <%--Reception--%>
                            <dx:LayoutGroup Caption="Reception Fournisseur" GroupBoxDecoration="Headingline" ShowCaption="True" ColCount="2" >
                                <Items>
                                    <dx:LayoutGroup Caption="Données Transport" >
                                        <Items>
                                            <dx:LayoutItem Caption="Numéro de Tracking :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:ASPxTextBox ID="txt_reception_track" runat="server" >
                                                            <ValidationSettings SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                                                                    <dx:LayoutItem Caption="N° de BL:" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:ASPxTextBox ID="txt_BL1" runat="server" >
                                                           
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Fournisseur :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:AspxTextBox ID="txt_reception_fournisseur" runat="server">

                                                        </dx:AspxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Transporteur :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:ASPxTextBox ID="txt_reception_transporteur" runat="server" >
                                                            <ValidationSettings SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Date de Livraison" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:ASPxDateEdit ID="txt_reception_datelivraion" runat="server" >
                                                            <TimeSectionProperties>
                                                                <TimeEditProperties>
                                                                    
                                                                    <ClearButton Visibility="Auto"></ClearButton>
                                                                    
                                                                </TimeEditProperties>
                                                            </TimeSectionProperties>

                                                            <ClearButton Visibility="Auto"></ClearButton>

                                                        </dx:ASPxDateEdit>
                                                        <%--<asp:TextBox ID="txt_reception_datelivraion" runat="server"></asp:TextBox>--%>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Numéro BR :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:AspxTextBox ID="txt_reception_br" runat="server" ></dx:AspxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="ZLECI :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:AspxTextBox ID="txt_reception_zleci" runat="server" ></dx:AspxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Origine :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <%--<asp:TextBox ID="txt_reception_origine" runat="server"></asp:TextBox>--%>
                                                        <dx:ASPxComboBox ID="txt_reception_origine" runat="server" >
                                                            <Items>
                                                                <dx:ListEditItem Text="France" Value="France"  />
                                                                <dx:ListEditItem Text="International" Value="International"  />
                                                            </Items>

                                                            <ClearButton Visibility="Auto"></ClearButton>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Données matériel" >
                                        <Items>
                                            <dx:LayoutItem Caption="Numéro commande :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:AspxTextBox ID="txt_reception_commande" runat="server" ></dx:AspxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Poste commande :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >                                                      
                                                        <dx:AspxTextBox ID="txt_reception_postecommande" runat="server" ></dx:AspxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Reference :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:ASPxTextBox ID="txt_reference3" runat="server" >
                                                            <ValidationSettings SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Quantité :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:AspxTextBox ID="txt_quantite2" runat="server" ></dx:AspxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>

                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Autres renseignements" Name="Autres" ClientVisible="false" >
                                        <Items>
                                            <dx:LayoutItem Caption="Je souhaite venir chercher le matériel au guichet R7:" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:ASPxComboBox ID="txt_autre_litige" runat="server" >
                                                            <Items>
                                                                <dx:ListEditItem Text="OUI" Value="OUI"  />
                                                                <dx:ListEditItem Text="NON" Value="NON"  />
                                                            </Items>
                                                            <ClearButton Visibility="Auto"></ClearButton>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Commentaires :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:AspxTextBox ID="txt_autre_commentaire" runat="server" ></dx:AspxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Livraison sous PVL :" >
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:ASPxComboBox ID="txt_autre_pvl" runat="server" >
                                                            <Items>
                                                                <dx:ListEditItem Text="OUI" Value="OUI"  />
                                                                <dx:ListEditItem Text="NON" Value="NON"  />
                                                            </Items>

                                                            <ClearButton Visibility="Auto"></ClearButton>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:LayoutGroup>
                            <%--Ditribution--%>
                            <dx:LayoutGroup Caption="Distribution inter-usine" GroupBoxDecoration="Headingline" ShowCaption="True" >
                                <Items>
                                    <dx:LayoutItem Caption="Gare départ" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxTextBox ID="txt_distribution_garedepart" runat="server" >
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Gare arrivée :" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxTextBox ID="txt_distribution_garearrivee" runat="server" >
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="N° Doc Libre / Liste de colisage :"  ClientVisible="false">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxTextBox ID="txt_doclibre2" runat="server" >
                                                    
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Poids (Kg):" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txt_distribution_poids" runat="server">
												<ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Longueur (mm):" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxComboBox runat="server" ID="SpinLongueur">
                                                    <Items>
                                                        <dx:ListEditItem Text="Inf à 2000" Value="Inf à 2000"/>
                                                        <dx:ListEditItem Text="Sup à 2000" Value="Sup à 2000"/>
                                                    </Items>
                                                    <ValidationSettings SetFocusOnError="True" EnableCustomValidation="True" 
                                                        RegularExpression-ValidationExpression="Inf à 2000" RegularExpression-ErrorText="Attention">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                   
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>                                             
                                               
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Largeur (mm):" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                 <dx:ASPxComboBox runat="server" ID="SpinLargeur">
                                                    <Items>
                                                        <dx:ListEditItem Text="Inf à 2400" Value="Inf à 2400"/>
                                                        <dx:ListEditItem Text="Sup à 2400" Value="Sup à 2400"/>
                                                    </Items>
                                                    <ValidationSettings SetFocusOnError="True" EnableCustomValidation="True" 
                                                        RegularExpression-ValidationExpression="Inf à 2400" RegularExpression-ErrorText="Attention">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                   
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>           
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Hauteur (mm):">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                 <dx:ASPxComboBox runat="server" ID="SpinHauteur">
                                                    <Items>
                                                        <dx:ListEditItem Text="Inf à 2400" Value="Inf à 2400"/>
                                                        <dx:ListEditItem Text="Sup à 2400" Value="Sup à 2400"/>
                                                    </Items>
                                                    <ValidationSettings SetFocusOnError="True" EnableCustomValidation="True" 
                                                        RegularExpression-ValidationExpression="Inf à 2400" RegularExpression-ErrorText="Attention">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                   
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>           
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                             <%--Magasin--%>
                            <dx:LayoutGroup Caption="Stock" GroupBoxDecoration="Headingline" ShowCaption="True">
                                <Items>
								<dx:LayoutItem Caption="Je souhaite venir chercher le matériel au guichet R7:"  Visible="false">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                                        <dx:ASPxComboBox ID="txt_autre_litige2" runat="server" >
                                                            <Items>
                                                                <dx:ListEditItem Text="OUI" Value="OUI"  />
                                                                <dx:ListEditItem Text="NON" Value="NON"  />
                                                            </Items>
                                                            <ClearButton Visibility="Auto"></ClearButton>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                <dx:LayoutItem Caption="Numéro de Magasin :" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                               <dx:ASPxComboBox ID="txt_stock_mag" runat="server" ClientInstanceName="txt_stockMag" DataSourceID="DS_Magasin" ValueField="Id_Magasin" TextField="Id_Magasin">
                                                    <ClientSideEvents TextChanged="OnMagChanged" />
												   <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
												</dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                <dx:LayoutItem Name="Su_TrpDedieeMag" ClientVisible="false" Caption="Transport Dediée">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="txt_trpDedieeMag" runat="server">
                                            <Items>
                                                <dx:ListEditItem Text="Transport Specifique" Value="Oui" />
                                                <dx:ListEditItem  Text="Prochaine Navette" Value="Non"/>
                                            </Items>
                                             <ClearButton Visibility="Auto"></ClearButton>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox> 
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                                <dx:LayoutItem Caption="OT / Resa / OF :" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxTextBox ID="txt_ot" runat="server" >
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Poste" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >  
                                                <div style="background-color:aliceblue">                                       
                                                        <div style="float:left">
                                                            Poste 1 
                                                            <dx:ASPxTextBox ID="txt_ot_poste" runat="server" Width="60px">
                                                                 <ValidationSettings SetFocusOnError="True"  ErrorDisplayMode="ImageWithTooltip">
                                                                    <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                                </ValidationSettings>
                                                            </dx:ASPxTextBox>    
                                                        </div>
                                                        <div style="float:left;margin-right:30px">
                                                            Poste 2
                                                             <dx:ASPxTextBox ID="txt_ot_poste2" runat="server" Width="60px"/>                                                   
                                                               
                                                        </div>
                                                        <div style="float:left;margin-right:30px">
                                                            Poste 3
                                                             <dx:ASPxTextBox ID="txt_ot_poste3" runat="server" Width="60px"/>                                                  
                                                        </div>                                             
                                                        <div style="float:left;margin-right:30px">
                                                         Poste 4
                                                            <dx:ASPxTextBox ID="txt_ot_poste4" runat="server" Width="60px"/> 
                                                     </div>                                                   
                                                 <div style="float:left;margin-right:30px">
                                                         Poste 5
                                                            <dx:ASPxTextBox ID="txt_ot_poste5" runat="server" Width="60px"/> 
                                                     </div>   
                                                 </div>                                                 
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Reference :"  ClientVisible="false">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxTextBox ID="txt_reference" runat="server" >
                                                   
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                          <%--Entree Sur Dossier--%>
                            <dx:LayoutGroup Caption="Entrees sur dossier" GroupBoxDecoration="Headingline" ShowCaption="True" >
                                <Items>
                                    <dx:LayoutItem Caption="Demandeur :" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:AspxTextBox ID="txt_dossier_demandeur" runat="server" ></dx:AspxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Numéro OF :" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:AspxTextBox ID="txt_dossier_OF" runat="server" ></dx:AspxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <%--GuichetMACS--%>
                            <dx:LayoutGroup Caption="Guichet MACS : Pour ce SpeedUp le périmetre de la prestation commence après la sortie marchandise de la division MACS." GroupBoxDecoration="Headingline" ShowCaption="True">
                                <Items>
                                    <dx:LayoutItem Caption="N° Livraison :" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" >
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    
                                </Items>
                            </dx:LayoutGroup>
                            <%--Expedition--%>
                            <dx:LayoutGroup Caption="Expedition" GroupBoxDecoration="Headingline" ShowCaption="True" >
                                <Items>
                                    <dx:LayoutItem Caption="OT / Resa / FTD :" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxTextBox ID="txt_ot2" runat="server" >
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Poste" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                

                                                 <div style="background-color:aliceblue">                                       
                                                        <div style="float:left">
                                                            Poste 1 
                                                            <dx:ASPxTextBox ID="txt_otposte1" runat="server" Width="60px">
                                                                 <ValidationSettings SetFocusOnError="True"  ErrorDisplayMode="ImageWithTooltip">
                                                                    <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                                </ValidationSettings>
                                                            </dx:ASPxTextBox>    
                                                        </div>
                                                        <div style="float:left;margin-right:30px">
                                                            Poste 2
                                                             <dx:ASPxTextBox ID="txt_otposte2" runat="server" Width="60px"/>                                                   
                                                               
                                                        </div>
                                                        <div style="float:left;margin-right:30px">
                                                            Poste 3
                                                             <dx:ASPxTextBox ID="txt_otposte3" runat="server" Width="60px"/>                                                  
                                                        </div>                                             
                                                        <div style="float:left;margin-right:30px">
                                                         Poste 4
                                                            <dx:ASPxTextBox ID="txt_otposte4" runat="server" Width="60px"/> 
                                                     </div>                                                   
                                                 <div style="float:left;margin-right:30px">
                                                         Poste 5
                                                            <dx:ASPxTextBox ID="txt_otposte5" runat="server" Width="60px"/> 
                                                     </div>   
                                                 </div>
             






                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Appareil :"  ClientVisible="false">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:AspxTextBox ID="txt_expedition_appareil" runat="server" ></dx:AspxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="BE :"  ClientVisible="false">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:AspxTextBox ID="txt_expedition_be" runat="server" ></dx:AspxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="FAL :"  ClientVisible="false">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:AspxTextBox ID="txt_expedition_fal" runat="server" ></dx:AspxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Doc libre :"  ClientVisible="false">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:AspxTextBox ID="txt_doclibre" runat="server" ></dx:AspxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Reference :"  ClientVisible="false">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:ASPxTextBox ID="txt_reference2" runat="server" >
                                                    
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Quantite :"  ClientVisible="false">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" >
                                                <dx:AspxTextBox ID="txt_quantite" runat="server" ></dx:AspxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                        </Items>
                    </dx:TabbedLayoutGroup>
                </Items>
            </dx:LayoutGroup>

            <dx:LayoutGroup ClientVisible="false" >
                <Items>
                    <dx:LayoutItem >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" >
                                <dx:AspxTextBox ID="txt_designation" runat="server" ></dx:AspxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>

            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right" Width="150" >
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True" >
                        <dx:ASPxButton ID="updateButton" runat="server" Text="Creation Speed Up" OnClick="updateButton_Click" Width="150"  />
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>


    <dx:ASPxLabel runat="server" ID="errorMessageLabel" ForeColor="Red" EnableViewState="False" EncodeHtml="False"  />

    <dx:ASPxLabel runat="server" ID="lbl_numspeed" ForeColor="Red" EnableViewState="False" EncodeHtml="False"  />

    <dx:ASPxLabel runat="server" ID="lbl_user" Visible="False" ForeColor="Red"  />

    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Speed-Up" ShowFooter="True" ></dx:ASPxPopupControl>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        InsertCommand="INSERT INTO [T_SPEEDUP] 
        ([Autre_Litige], 
        [Autre_Commentaire], 
        [Autre_PVL], 
        [Designation],
         [Distribtuion_GareArrivee],
         [Distribtuion_GareDepart],
         [DocLibre],
         [Dossier_Demandeur], 
        [Dossier_OF],
         [Expedition_Appareil],
         [Expedition_BE],
         [Expedition_FAL],
         [OT], [OT_Poste], 
        [Quantite],
         [Reception_BR],
         [Reception_Commande],
         [Reception_DateLivraison],
         [Reception_Fournisseur],
         [Reception_Origine],
         [Reception_Track],
         [Reception_Transporteur],
         [Reception_ZLECI],
         [Reception_PosteCommande], 
        [Reference], 
        [Stock_Mag], 
        [SU_Destinataire],
         [SU_EOTP],
         [SU_Localisation],
         [SU_Site],
         [SU_SiteDepart],
         [SU_Type],
        [UserDemande],
        [SU_Commentaire],
        [SU_Telephone],
     [Distribution_Poids],
      [Distribution_Longeur],
      [Distribution_Largeur],
      [Distribution_Hauteur],
	  [Type_Demande],
        [SU_TrpDediee],
        [BL],
        [AOG],
        [SU_Affectation]
      ) 
        VALUES (
        @Autre_Litige, 
        @Autre_Commentaire, 
        @Autre_PVL, 
        @Designation,
        @Distribtuion_GareArrivee, 
        @Distribtuion_GareDepart, 
        @DocLibre, 
        @Dossier_Demandeur, @Dossier_OF, @Expedition_Appareil, @Expedition_BE, @Expedition_FAL, @OT, @OT_Poste, @Quantite, 
        @Reception_BR, @Reception_Commande, @Reception_DateLivraison, @Reception_Fournisseur, 
        @Reception_Origine, @Reception_Track, @Reception_Transporteur, @Reception_ZLECI, @Reception_PosteCommande, @Reference, @Stock_Mag, @SU_Destinataire,
         @SU_EOTP,
         @SU_Localisation, 
        @SU_Site,
         @SU_SiteDepart,
         @SU_Type,
        @UserDemande,
        @SU_Commentaire,
        @SU_Telephone,
        @Distribution_Poids,
        @Distribution_Longeur,
        @Distribution_Largeur,
        @Distribution_Hauteur,
		@Type_Demande,
        @SU_TrpDediee,
        @BL,
        @AOG,
        @SU_Affectation);
        SET @QuoteID = Scope_Identity();"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [T_SPEEDUP]"
        UpdateCommand="UPDATE [T_SPEEDUP] SET [Autre_Litige] = @Autre_Litige, [Autre_Commentaire] = @Autre_Commentaire, [Autre_PVL] = @Autre_PVL, [Designation] = @Designation, [Distribtuion_GareArrivee] = @Distribtuion_GareArrivee, [Distribtuion_GareDepart] = @Distribtuion_GareDepart, [DocLibre] = @DocLibre, [Dossier_Demandeur] = @Dossier_Demandeur, [Dossier_OF] = @Dossier_OF, [Expedition_Appareil] = @Expedition_Appareil, [Expedition_BE] = @Expedition_BE, [Expedition_FAL] = @Expedition_FAL, [OT] = @OT, [OT_Poste] = @OT_Poste, [Quantite] = @Quantite, [Reception_BR] = @Reception_BR, [Reception_Commande] = @Reception_Commande, [Reception_DateLivraison] = @Reception_DateLivraison, [Reception_Fournisseur] = @Reception_Fournisseur, [Reception_Origine] = @Reception_Origine, [Reception_Track] = @Reception_Track, [Reception_Transporteur] = @Reception_Transporteur, [Reception_ZLECI] = @Reception_ZLECI, [Reception_PosteCommande] = @Reception_PosteCommande, [Reference] = @Reference, [Stock_Mag] = @Stock_Mag, [SU_Destinataire] = @SU_Destinataire, [SU_EOTP] = @SU_EOTP, [SU_Localisation] = @SU_Localisation, [SU_Site] = @SU_Site, [SU_SiteDepart] = @SU_SiteDepart, [SU_Type] = @SU_Type WHERE [IDSPEEDUP] = @original_IDSPEEDUP AND (([Autre_Litige] = @original_Autre_Litige) OR ([Autre_Litige] IS NULL AND @original_Autre_Litige IS NULL)) AND (([Autre_Commentaire] = @original_Autre_Commentaire) OR ([Autre_Commentaire] IS NULL AND @original_Autre_Commentaire IS NULL)) AND (([Autre_PVL] = @original_Autre_PVL) OR ([Autre_PVL] IS NULL AND @original_Autre_PVL IS NULL)) AND (([Designation] = @original_Designation) OR ([Designation] IS NULL AND @original_Designation IS NULL)) AND (([Distribtuion_GareArrivee] = @original_Distribtuion_GareArrivee) OR ([Distribtuion_GareArrivee] IS NULL AND @original_Distribtuion_GareArrivee IS NULL)) AND (([Distribtuion_GareDepart] = @original_Distribtuion_GareDepart) OR ([Distribtuion_GareDepart] IS NULL AND @original_Distribtuion_GareDepart IS NULL)) AND (([DocLibre] = @original_DocLibre) OR ([DocLibre] IS NULL AND @original_DocLibre IS NULL)) AND (([Dossier_Demandeur] = @original_Dossier_Demandeur) OR ([Dossier_Demandeur] IS NULL AND @original_Dossier_Demandeur IS NULL)) AND (([Dossier_OF] = @original_Dossier_OF) OR ([Dossier_OF] IS NULL AND @original_Dossier_OF IS NULL)) AND (([Expedition_Appareil] = @original_Expedition_Appareil) OR ([Expedition_Appareil] IS NULL AND @original_Expedition_Appareil IS NULL)) AND (([Expedition_BE] = @original_Expedition_BE) OR ([Expedition_BE] IS NULL AND @original_Expedition_BE IS NULL)) AND (([Expedition_FAL] = @original_Expedition_FAL) OR ([Expedition_FAL] IS NULL AND @original_Expedition_FAL IS NULL)) AND (([OT] = @original_OT) OR ([OT] IS NULL AND @original_OT IS NULL)) AND (([OT_Poste] = @original_OT_Poste) OR ([OT_Poste] IS NULL AND @original_OT_Poste IS NULL)) AND (([Quantite] = @original_Quantite) OR ([Quantite] IS NULL AND @original_Quantite IS NULL)) AND (([Reception_BR] = @original_Reception_BR) OR ([Reception_BR] IS NULL AND @original_Reception_BR IS NULL)) AND (([Reception_Commande] = @original_Reception_Commande) OR ([Reception_Commande] IS NULL AND @original_Reception_Commande IS NULL)) AND (([Reception_DateLivraison] = @original_Reception_DateLivraison) OR ([Reception_DateLivraison] IS NULL AND @original_Reception_DateLivraison IS NULL)) AND (([Reception_Fournisseur] = @original_Reception_Fournisseur) OR ([Reception_Fournisseur] IS NULL AND @original_Reception_Fournisseur IS NULL)) AND (([Reception_Origine] = @original_Reception_Origine) OR ([Reception_Origine] IS NULL AND @original_Reception_Origine IS NULL)) AND (([Reception_Track] = @original_Reception_Track) OR ([Reception_Track] IS NULL AND @original_Reception_Track IS NULL)) AND (([Reception_Transporteur] = @original_Reception_Transporteur) OR ([Reception_Transporteur] IS NULL AND @original_Reception_Transporteur IS NULL)) AND (([Reception_ZLECI] = @original_Reception_ZLECI) OR ([Reception_ZLECI] IS NULL AND @original_Reception_ZLECI IS NULL)) AND (([Reception_PosteCommande] = @original_Reception_PosteCommande) OR ([Reception_PosteCommande] IS NULL AND @original_Reception_PosteCommande IS NULL)) AND (([Reference] = @original_Reference) OR ([Reference] IS NULL AND @original_Reference IS NULL)) AND (([Stock_Mag] = @original_Stock_Mag) OR ([Stock_Mag] IS NULL AND @original_Stock_Mag IS NULL)) AND (([SU_Destinataire] = @original_SU_Destinataire) OR ([SU_Destinataire] IS NULL AND @original_SU_Destinataire IS NULL)) AND (([SU_EOTP] = @original_SU_EOTP) OR ([SU_EOTP] IS NULL AND @original_SU_EOTP IS NULL)) AND (([SU_Localisation] = @original_SU_Localisation) OR ([SU_Localisation] IS NULL AND @original_SU_Localisation IS NULL)) AND (([SU_Site] = @original_SU_Site) OR ([SU_Site] IS NULL AND @original_SU_Site IS NULL)) AND (([SU_SiteDepart] = @original_SU_SiteDepart) OR ([SU_SiteDepart] IS NULL AND @original_SU_SiteDepart IS NULL)) AND (([SU_Type] = @original_SU_Type) OR ([SU_Type] IS NULL AND @original_SU_Type IS NULL))"
        OnInserted="SqlDataSource1_Inserted">

        <InsertParameters>
            <asp:Parameter Name="Autre_Litige" Type="String" />
            <asp:Parameter Name="Autre_Commentaire" Type="String" />
            <asp:Parameter Name="Autre_PVL" Type="String" />
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
            <asp:Parameter Name="SU_Affectation" Type="String" />
            <asp:Parameter Name="SU_SiteDepart" Type="String" />
            <asp:Parameter Name="SU_Type" Type="String" />
            <asp:Parameter Name="UserDemande" Type="String" />
            <asp:Parameter Name="SU_Commentaire" Type="String" />
            <asp:Parameter Name="SU_Telephone" Type="String" />
            <asp:Parameter Name="Distribution_Poids" Type="Double" />
            <asp:Parameter Name="Distribution_Longeur" Type="String" />
            <asp:Parameter Name="Distribution_Largeur" Type="String" />
            <asp:Parameter Name="Distribution_Hauteur" Type="String" />
            <asp:Parameter Name="QuoteID" Direction="Output" Type="Int32"/>
			<asp:Parameter Name="Type_Demande" Type="String" DefaultValue="SpeedUp"/>
            <asp:Parameter Name="SU_TrpDediee" Type="String" />
            <asp:Parameter Name="BL" Type="String" />
            <asp:Parameter Name="AOG" Type="String" />
        </InsertParameters>
        <UpdateParameters>
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
                        <asp:Parameter Name="original_IDSPEEDUP" Type="Int32" />
            <asp:Parameter Name="original_Autre_Litige" Type="String" />
            <asp:Parameter Name="original_Autre_Commentaire" Type="String" />
            <asp:Parameter Name="original_Autre_PVL" Type="Int32" />
            <asp:Parameter Name="original_Designation" Type="String" />
            <asp:Parameter Name="original_Distribtuion_GareArrivee" Type="String" />
            <asp:Parameter Name="original_Distribtuion_GareDepart" Type="String" />
            <asp:Parameter Name="original_DocLibre" Type="String" />
            <asp:Parameter Name="original_Dossier_Demandeur" Type="String" />
            <asp:Parameter Name="original_Dossier_OF" Type="String" />
            <asp:Parameter Name="original_Expedition_Appareil" Type="String" />
            <asp:Parameter Name="original_Expedition_BE" Type="String" />
            <asp:Parameter Name="original_Expedition_FAL" Type="String" />
            <asp:Parameter Name="original_OT" Type="String" />
            <asp:Parameter Name="original_OT_Poste" Type="String" />
            <asp:Parameter Name="original_Quantite" Type="String" />
            <asp:Parameter Name="original_Reception_BR" Type="String" />
            <asp:Parameter Name="original_Reception_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="original_Reception_DateLivraison" />
            <asp:Parameter Name="original_Reception_Fournisseur" Type="String" />
            <asp:Parameter Name="original_Reception_Origine" Type="String" />
            <asp:Parameter Name="original_Reception_Track" Type="String" />
            <asp:Parameter Name="original_Reception_Transporteur" Type="String" />
            <asp:Parameter Name="original_Reception_ZLECI" Type="String" />
            <asp:Parameter Name="original_Reception_PosteCommande" Type="String" />
            <asp:Parameter Name="original_Reference" Type="String" />
            <asp:Parameter Name="original_Stock_Mag" Type="String" />
            <asp:Parameter Name="original_SU_Destinataire" Type="String" />
            <asp:Parameter Name="original_SU_EOTP" Type="String" />
            <asp:Parameter Name="original_SU_Localisation" Type="String" />
            <asp:Parameter Name="original_SU_Site" Type="String" />
            <asp:Parameter Name="original_SU_SiteDepart" Type="String" />
            <asp:Parameter Name="original_SU_Type" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_SpeedUp_Localisation] WHERE ([Type] = @Types) Order By Ordre">
        <SelectParameters>
            <asp:Parameter Name="Types" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


     <asp:SqlDataSource ID="DS_Mouvement" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
            InsertCommand="INSERT INTO 
            [T_SpeedUp_Mouvement] 
            (
            [Statut], 
            [Affectation],
            [IDSPEEDUP] 
           ) 
            VALUES 
            (
            @Statut, 
            @Affectation,
            @ID_SPEEDUP
        
            )"
            OldValuesParameterFormatString="original_{0}">

            <InsertParameters>
                <asp:Parameter Name="Date_Mouvement" Type="DateTime" />
                <asp:Parameter Name="Statut" Type="String" />
                <asp:Parameter Name="ID_SPEEDUP" Type="Int32" />
                <asp:Parameter Name="Affectation" Type="String" />
                <asp:Parameter Name="Commentaire" Type="String" />
            </InsertParameters>

        </asp:SqlDataSource>


    <asp:SqlDataSource ID="DS_Magasin" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="Select  [Id_Magasin] From [Dashboard].[dbo].[T_Ordo_PerimetreMagasin] ORDER BY [Id_Magasin]"
        >
        

    </asp:SqlDataSource>


    <asp:SqlDataSource ID="DS_EOTP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        SelectCommand="SELECT [Programme], [EOTP] FROM [T_Speedup_EOTP]">
    </asp:SqlDataSource>

</asp:Content>



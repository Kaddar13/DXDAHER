<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JJ_pokayoke.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.Industrie.JJ_pokayoke" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script>

        function DoProcessEnterKey(htmlEvent, editName) {
            if (htmlEvent.keyCode == 13) {
                ASPxClientUtils.PreventEventAndBubble(htmlEvent);
                if (editName) {
                    ASPxClientControl.GetControlCollection().GetByName(editName).SetFocus();
                } else {

                    btn.DoClick();

                }
            }
        }
        function PrintElem() {

            window.print();

        }
        function cbList_SelectedIndexChanged(s, e) {
            if (s.GetSelectedValues().length < 7) {
                btnPrint.SetEnabled(false);
                e.isValid = false;
                e.errorText = 'Toutes les conditions ne sont remplies !';

            }
            else {
                btnPrint.SetEnabled(true);
            }
        }

    </script>

    <div id="mydiv" runat="server" style="height: 800px">

        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="3" Theme="Moderno" ClientInstanceName="formedit">
            <Items>
                <dx:LayoutGroup Caption="Expedition Helibras">
                    <Items>
                        <dx:LayoutItem Caption="Commande :">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboCommande" runat="server" AllowNull="False" DataSourceID="ds_commande" ValueField="NumCommande" TextField="NumCommande" Theme="Moderno">
                                        <ClientSideEvents SelectedIndexChanged="function(s,e){ cboColis.PerformCallback() ;}" />
                                        <ClearButton Visibility="Auto"></ClearButton>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>

                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Colis :">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboColis" runat="server" ClientInstanceName="cboColis" AllowNull="False" ValueField="NumColis" TextField="NumColis" Theme="Moderno" OnCallback="cboColis_Callback">
                                        <ClearButton Visibility="Auto"></ClearButton>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="false">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="Button2" runat="server" AutoPostBack="false" Text="Refresh" Theme="Moderno" OnClick="btnUpdate" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="false">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" Text="Delete" Theme="Moderno" OnClick="ASPxButton1_Click" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Scan Item Label :">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtLivraison" runat="server" Width="170px" Theme="Moderno">
                                        <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, ''); }" />
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Synthese" Width="100px">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="grid_recap" runat="server" AutoResizeWithContainer="false" DataSourceID="ds_recap" Theme="Moderno" Width="200px">
                                        <Styles AdaptiveDetailButtonWidth="22">
                                        </Styles>
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings Location="Top" />
                        </dx:LayoutItem>


                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="Contenu physique du colis">
                    <Items>
                        <dx:LayoutItem Caption="Contenu physique du colis" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="grid2" runat="server" DataSourceID="ds_temp" AutoGenerateColumns="False" Theme="Moderno">
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="COMMANDE" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="COLIS" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="LIVRAISON" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="EVENEMENT" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn FieldName="DATE" VisibleIndex="4">
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
                                            <dx:GridViewDataTextColumn FieldName="USER" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings Location="Top" />
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="Contenu SAP">
                    <Items>
                        <dx:LayoutItem Caption="Contenu SAP" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="grid1" runat="server" DataSourceID="ds_grid" AutoGenerateColumns="False" Theme="Moderno">
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="NumCommande" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NumColis" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Item Label" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Check" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <FormatConditions>
                                            <dx:GridViewFormatConditionHighlight ApplyToRow="True" Expression="Len([Check]) &gt; 0" Format="Custom">
                                                <RowStyle BackColor="#339933" />
                                            </dx:GridViewFormatConditionHighlight>
                                        </FormatConditions>
                                        <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                    </dx:ASPxGridView>

                                </dx:LayoutItemNestedControlContainer>

                            </LayoutItemNestedControlCollection>
                            <CaptionSettings Location="Top" />
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>


                <dx:LayoutItem Caption="Validation" ShowCaption="False" ColSpan="3">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxCheckBoxList ID="checkBox" runat="server" Theme="Moderno" Width="1517px" ClientInstanceName="checkBox">
                                <ClientSideEvents SelectedIndexChanged="cbList_SelectedIndexChanged" />
                                <Items>
                                    <dx:ListEditItem Text="Tous les OT correspondent à la meme commande" Value="1" />
                                    <dx:ListEditItem Text="Les pieces sont correctement conditionnées" />
                                    <dx:ListEditItem Text="Le tampon ou les initiales du conditionnerurs se trouvent sur chaque OT" Value="1" />
                                    <dx:ListEditItem Text="Tous les items se trouvent bien sur le BL (imprimé prealablement double check)" Value="1" />
                                    <dx:ListEditItem Text="Le carton de consolidation est correctement identifié" Value="1" />
                                    <dx:ListEditItem Text="Les archives de saisie se trouvent dans la banette colis" Value="1" />
                                    <dx:ListEditItem Text="Le sachet est fermé et les items saisie / non saisie sont separés" Value="1" />
                                </Items>
                            </dx:ASPxCheckBoxList>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>



                <dx:LayoutItem Caption="Log" ColSpan="3">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxMemo ID="txt_log" runat="server" Width="1129px" ClientVisible="true" Theme="Moderno" AutoResizeWithContainer="True" />
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>



            </Items>
        </dx:ASPxFormLayout>
        <dx:ASPxButton ID="bntPrint" runat="server" Text="Print" Theme="Moderno" ClientInstanceName="btnPrint" ClientEnabled="false" OnClick="bntPrint_Click" />

    </div>


    <dx:ASPxButton ID="btn" ClientInstanceName="btn" runat="server" Text="Insert" ClientVisible="false" OnClick="InsertClick"></dx:ASPxButton>




    <asp:SqlDataSource ID="ds_commande" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT NumCommande FROM [T_JJ_SAP]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_colis" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT NumColis FROM T_JJ_SAP WHERE (NumCommande = @COMMANDE)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboCommande" Name="COMMANDE" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_grid" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT T_JJ_SAP.NumCommande, T_JJ_SAP.NumColis, T_JJ_TEMP.COMMANDE, T_JJ_SAP.[Item Label],T_JJ_TEMP.DATE AS [Check] 
        FROM T_JJ_SAP LEFT OUTER JOIN T_JJ_TEMP ON T_JJ_SAP.[Item Label] = T_JJ_TEMP.LIVRAISON AND T_JJ_SAP.NumColis = T_JJ_TEMP.COLIS AND T_JJ_SAP.NumCommande = T_JJ_TEMP.COMMANDE 
        WHERE (T_JJ_SAP.NumCommande = @COMMANDE) AND (T_JJ_SAP.NumColis = @COLIS)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboCommande" Name="COMMANDE" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboColis" Name="COLIS" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_temp" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_JJ_Temp] WHERE (([COMMANDE] = @COMMANDE) AND ([COLIS] = @COLIS))"
        DeleteCommand="DELETE  FROM [T_JJ_Temp] WHERE (([COMMANDE] = @COMMANDE) AND ([COLIS] = @COLIS))"
        InsertCommand="INSERT INTO T_JJ_TEMP(COMMANDE, COLIS, LIVRAISON,[USER],Evenement) VALUES (@COMMANDE, @COLIS, @LIVRAISON,@USER,@Evenement)">
        <InsertParameters>
            <asp:Parameter Name="COMMANDE" />
            <asp:Parameter Name="COLIS" />
            <asp:Parameter Name="LIVRAISON" />
            <asp:Parameter Name="USER" />
            <asp:Parameter Name="Evenement" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboCommande" Name="COMMANDE" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboColis" Name="COLIS" PropertyName="Value" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboCommande" Name="COMMANDE" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboColis" Name="COLIS" PropertyName="Value" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="ds_test" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_JJ_SAP] WHERE ((NumColis  = @COLIS) AND (NumCommande = @COMMANDE) AND ([Item Label] = @LIVRAISON))">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboColis" Name="COLIS" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboCommande" Name="COMMANDE" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ASPxFormLayout1$txtLivraison" Name="LIVRAISON" PropertyName="Text" Type="String" />
        </SelectParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_recap" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        SelectCommand="SELECT        NumCommande, NumColis, COUNT([Item Label]) AS [Total item Label],'SAP' as Evenement
FROM            dbo.T_JJ_SAP
GROUP BY NumCommande, NumColis
HAVING        (NumCommande = @COMMANDE) AND (NumColis = @COLIS)

UNION

SELECT        COMMANDE, COLIS, COUNT(LIVRAISON) AS Expr1, EVENEMENT
FROM            dbo.T_JJ_TEMP
GROUP BY COMMANDE, COLIS, EVENEMENT
HAVING        (COMMANDE = @COMMANDE) AND (COLIS = @COLIS)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboCommande" Name="COMMANDE" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ASPxFormLayout1$cboColis" Name="COLIS" PropertyName="Value" Type="String" />
        </SelectParameters>

    </asp:SqlDataSource>

</asp:Content>

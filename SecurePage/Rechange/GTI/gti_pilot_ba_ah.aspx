<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gti_pilot_ba_ah.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.GTI.gti_ba_ah" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Pilotage des commandes de bandes adhesives Airbus Helicopter"  Theme="MetropolisBlue"></dx:ASPxLabel >

    <dx:ASPxLabel ID="txt_log" runat="server"  Theme="MetropolisBlue"></dx:ASPxLabel >
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="DS_Grid" KeyFieldName="ID_CDE"  Theme="MetropolisBlue" KeyboardSupport="True">
        <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" />
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Ann. Cde">
                    <DataItemTemplate>
                        <dx:ASPxButton runat="server" ID="btn_cancel" OnClick="btn_cancel_Click" Text="" Image-IconID="actions_close_16x16devav" Height="16" Width="16" Theme="MetropolisBlue" VisibleIndex="14"></dx:ASPxButton>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="N#Cde" FieldName="ID_CDE" ReadOnly="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Qté rouleaux" FieldName="ID_QTT" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Statut" FieldName="Statut" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Date cde" FieldName="Dte_Cde" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Date rec" FieldName="Dte_Rec" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Id resp cde" FieldName="ID_CUser" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Statut Réc" FieldName="Rec_Status" VisibleIndex="5">
            </dx:GridViewDataCheckColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>

    <dx:ASPxPopupControl ID="PopUp" ClientInstanceName="popupControl" runat="server" CloseOnEscape="True" Modal="True" Theme="MetropolisBlue" Width="300" Height="200" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
                    <dx:PopupControlContentControl ID="popValidation" Visible="false" >
                        <dx:ASPxButton ID="yesButton" runat="server" Text="Oui" AutoPostBack="false" OnClick="yesButton_Click" Theme="MetropolisBlue">
                           
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="noButton" runat="server" Text="Non" AutoPostBack="false" Theme="MetropolisBlue">
                            <ClientSideEvents Click="function(s, e) {popupControl.Hide();}" />
                        </dx:ASPxButton>
                    </dx:PopupControlContentControl>
                </ContentCollection>

    </dx:ASPxPopupControl>

    <asp:SqlDataSource ID="DS_Grid" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" DeleteCommand="DELETE FROM [GTI_Tbl_Cde] WHERE [ID_CDE] = @original_ID_CDE AND (([ID_QTT] = @original_ID_QTT) OR ([ID_QTT] IS NULL AND @original_ID_QTT IS NULL)) AND (([ID_QTR] = @original_ID_QTR) OR ([ID_QTR] IS NULL AND @original_ID_QTR IS NULL)) AND (([ID_QTP] = @original_ID_QTP) OR ([ID_QTP] IS NULL AND @original_ID_QTP IS NULL)) AND (([ID_1STCART] = @original_ID_1STCART) OR ([ID_1STCART] IS NULL AND @original_ID_1STCART IS NULL)) AND (([ID_ENDCART] = @original_ID_ENDCART) OR ([ID_ENDCART] IS NULL AND @original_ID_ENDCART IS NULL)) AND (([ID_1STROLL] = @original_ID_1STROLL) OR ([ID_1STROLL] IS NULL AND @original_ID_1STROLL IS NULL)) AND (([ID_ENDROLL] = @original_ID_ENDROLL) OR ([ID_ENDROLL] IS NULL AND @original_ID_ENDROLL IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND [Stock] = @original_Stock AND (([Dte_Cde] = @original_Dte_Cde) OR ([Dte_Cde] IS NULL AND @original_Dte_Cde IS NULL)) AND (([Dte_Rec] = @original_Dte_Rec) OR ([Dte_Rec] IS NULL AND @original_Dte_Rec IS NULL)) AND (([Dte_Ser] = @original_Dte_Ser) OR ([Dte_Ser] IS NULL AND @original_Dte_Ser IS NULL)) AND (([ID_CUser] = @original_ID_CUser) OR ([ID_CUser] IS NULL AND @original_ID_CUser IS NULL)) AND [Rec_Status] = @original_Rec_Status AND (([ID_RUser] = @original_ID_RUser) OR ([ID_RUser] IS NULL AND @original_ID_RUser IS NULL))" InsertCommand="INSERT INTO [GTI_Tbl_Cde] ([ID_CDE], [ID_QTT], [ID_QTR], [ID_QTP], [ID_1STCART], [ID_ENDCART], [ID_1STROLL], [ID_ENDROLL], [Statut], [Stock], [Dte_Cde], [Dte_Rec], [Dte_Ser], [ID_CUser], [Rec_Status], [ID_RUser]) VALUES (@ID_CDE, @ID_QTT, @ID_QTR, @ID_QTP, @ID_1STCART, @ID_ENDCART, @ID_1STROLL, @ID_ENDROLL, @Statut, @Stock, @Dte_Cde, @Dte_Rec, @Dte_Ser, @ID_CUser, @Rec_Status, @ID_RUser)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [GTI_Tbl_Cde]" UpdateCommand="UPDATE [GTI_Tbl_Cde] SET [ID_QTT] = @ID_QTT, [ID_QTR] = @ID_QTR, [ID_QTP] = @ID_QTP, [ID_1STCART] = @ID_1STCART, [ID_ENDCART] = @ID_ENDCART, [ID_1STROLL] = @ID_1STROLL, [ID_ENDROLL] = @ID_ENDROLL, [Statut] = @Statut, [Stock] = @Stock, [Dte_Cde] = @Dte_Cde, [Dte_Rec] = @Dte_Rec, [Dte_Ser] = @Dte_Ser, [ID_CUser] = @ID_CUser, [Rec_Status] = @Rec_Status, [ID_RUser] = @ID_RUser WHERE [ID_CDE] = @original_ID_CDE AND (([ID_QTT] = @original_ID_QTT) OR ([ID_QTT] IS NULL AND @original_ID_QTT IS NULL)) AND (([ID_QTR] = @original_ID_QTR) OR ([ID_QTR] IS NULL AND @original_ID_QTR IS NULL)) AND (([ID_QTP] = @original_ID_QTP) OR ([ID_QTP] IS NULL AND @original_ID_QTP IS NULL)) AND (([ID_1STCART] = @original_ID_1STCART) OR ([ID_1STCART] IS NULL AND @original_ID_1STCART IS NULL)) AND (([ID_ENDCART] = @original_ID_ENDCART) OR ([ID_ENDCART] IS NULL AND @original_ID_ENDCART IS NULL)) AND (([ID_1STROLL] = @original_ID_1STROLL) OR ([ID_1STROLL] IS NULL AND @original_ID_1STROLL IS NULL)) AND (([ID_ENDROLL] = @original_ID_ENDROLL) OR ([ID_ENDROLL] IS NULL AND @original_ID_ENDROLL IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND [Stock] = @original_Stock AND (([Dte_Cde] = @original_Dte_Cde) OR ([Dte_Cde] IS NULL AND @original_Dte_Cde IS NULL)) AND (([Dte_Rec] = @original_Dte_Rec) OR ([Dte_Rec] IS NULL AND @original_Dte_Rec IS NULL)) AND (([Dte_Ser] = @original_Dte_Ser) OR ([Dte_Ser] IS NULL AND @original_Dte_Ser IS NULL)) AND (([ID_CUser] = @original_ID_CUser) OR ([ID_CUser] IS NULL AND @original_ID_CUser IS NULL)) AND [Rec_Status] = @original_Rec_Status AND (([ID_RUser] = @original_ID_RUser) OR ([ID_RUser] IS NULL AND @original_ID_RUser IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID_CDE" Type="Int32" />
            <asp:Parameter Name="original_ID_QTT" Type="Int32" />
            <asp:Parameter Name="original_ID_QTR" Type="Int32" />
            <asp:Parameter Name="original_ID_QTP" Type="Int32" />
            <asp:Parameter Name="original_ID_1STCART" Type="Int32" />
            <asp:Parameter Name="original_ID_ENDCART" Type="Int32" />
            <asp:Parameter Name="original_ID_1STROLL" Type="String" />
            <asp:Parameter Name="original_ID_ENDROLL" Type="String" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Stock" Type="Boolean" />
            <asp:Parameter Name="original_Dte_Cde" Type="Double" />
            <asp:Parameter Name="original_Dte_Rec" Type="Double" />
            <asp:Parameter Name="original_Dte_Ser" Type="Double" />
            <asp:Parameter Name="original_ID_CUser" Type="Int32" />
            <asp:Parameter Name="original_Rec_Status" Type="Boolean" />
            <asp:Parameter Name="original_ID_RUser" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ID_CDE" Type="Int32" />
            <asp:Parameter Name="ID_QTT" Type="Int32" />
            <asp:Parameter Name="ID_QTR" Type="Int32" />
            <asp:Parameter Name="ID_QTP" Type="Int32" />
            <asp:Parameter Name="ID_1STCART" Type="Int32" />
            <asp:Parameter Name="ID_ENDCART" Type="Int32" />
            <asp:Parameter Name="ID_1STROLL" Type="String" />
            <asp:Parameter Name="ID_ENDROLL" Type="String" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Stock" Type="Boolean" />
            <asp:Parameter Name="Dte_Cde" Type="Double" />
            <asp:Parameter Name="Dte_Rec" Type="Double" />
            <asp:Parameter Name="Dte_Ser" Type="Double" />
            <asp:Parameter Name="ID_CUser" Type="Int32" />
            <asp:Parameter Name="Rec_Status" Type="Boolean" />
            <asp:Parameter Name="ID_RUser" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID_QTT" Type="Int32" />
            <asp:Parameter Name="ID_QTR" Type="Int32" />
            <asp:Parameter Name="ID_QTP" Type="Int32" />
            <asp:Parameter Name="ID_1STCART" Type="Int32" />
            <asp:Parameter Name="ID_ENDCART" Type="Int32" />
            <asp:Parameter Name="ID_1STROLL" Type="String" />
            <asp:Parameter Name="ID_ENDROLL" Type="String" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Stock" Type="Boolean" />
            <asp:Parameter Name="Dte_Cde" Type="Double" />
            <asp:Parameter Name="Dte_Rec" Type="Double" />
            <asp:Parameter Name="Dte_Ser" Type="Double" />
            <asp:Parameter Name="ID_CUser" Type="Int32" />
            <asp:Parameter Name="Rec_Status" Type="Boolean" />
            <asp:Parameter Name="ID_RUser" Type="Int32" />
            <asp:Parameter Name="original_ID_CDE" Type="Int32" />
            <asp:Parameter Name="original_ID_QTT" Type="Int32" />
            <asp:Parameter Name="original_ID_QTR" Type="Int32" />
            <asp:Parameter Name="original_ID_QTP" Type="Int32" />
            <asp:Parameter Name="original_ID_1STCART" Type="Int32" />
            <asp:Parameter Name="original_ID_ENDCART" Type="Int32" />
            <asp:Parameter Name="original_ID_1STROLL" Type="String" />
            <asp:Parameter Name="original_ID_ENDROLL" Type="String" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Stock" Type="Boolean" />
            <asp:Parameter Name="original_Dte_Cde" Type="Double" />
            <asp:Parameter Name="original_Dte_Rec" Type="Double" />
            <asp:Parameter Name="original_Dte_Ser" Type="Double" />
            <asp:Parameter Name="original_ID_CUser" Type="Int32" />
            <asp:Parameter Name="original_Rec_Status" Type="Boolean" />
            <asp:Parameter Name="original_ID_RUser" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>



</asp:Content>

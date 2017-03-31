<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_EDITION_POSTE.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Parametrage.ORDO_EDITION_POSTE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID">
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Poste" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Gare" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CELLULE" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" DeleteCommand="DELETE FROM [T_Ordo_MP_PosteCellule] WHERE [ID] = @original_ID AND (([Poste] = @original_Poste) OR ([Poste] IS NULL AND @original_Poste IS NULL)) AND (([Gare] = @original_Gare) OR ([Gare] IS NULL AND @original_Gare IS NULL)) AND (([CELLULE] = @original_CELLULE) OR ([CELLULE] IS NULL AND @original_CELLULE IS NULL))" InsertCommand="INSERT INTO [T_Ordo_MP_PosteCellule] ([Poste], [Gare], [CELLULE]) VALUES (@Poste, @Gare, @CELLULE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_Ordo_MP_PosteCellule]" UpdateCommand="UPDATE [T_Ordo_MP_PosteCellule] SET [Poste] = @Poste, [Gare] = @Gare, [CELLULE] = @CELLULE WHERE [ID] = @original_ID AND (([Poste] = @original_Poste) OR ([Poste] IS NULL AND @original_Poste IS NULL)) AND (([Gare] = @original_Gare) OR ([Gare] IS NULL AND @original_Gare IS NULL)) AND (([CELLULE] = @original_CELLULE) OR ([CELLULE] IS NULL AND @original_CELLULE IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Poste" Type="String" />
            <asp:Parameter Name="original_Gare" Type="String" />
            <asp:Parameter Name="original_CELLULE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Poste" Type="String" />
            <asp:Parameter Name="Gare" Type="String" />
            <asp:Parameter Name="CELLULE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Poste" Type="String" />
            <asp:Parameter Name="Gare" Type="String" />
            <asp:Parameter Name="CELLULE" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Poste" Type="String" />
            <asp:Parameter Name="original_Gare" Type="String" />
            <asp:Parameter Name="original_CELLULE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

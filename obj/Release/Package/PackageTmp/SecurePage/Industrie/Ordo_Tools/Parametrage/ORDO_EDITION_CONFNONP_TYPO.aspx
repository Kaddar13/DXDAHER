<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_EDITION_CONFNONP_TYPO.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Parametrage.ORDO_EDITION_CONFNONP_TYPO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID">
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TYPOLOGIE" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" DeleteCommand="DELETE FROM [T_Ordo_Confnonpointe_Typologie] WHERE [ID] = @original_ID AND (([TYPOLOGIE] = @original_TYPOLOGIE) OR ([TYPOLOGIE] IS NULL AND @original_TYPOLOGIE IS NULL))" InsertCommand="INSERT INTO [T_Ordo_Confnonpointe_Typologie] ([TYPOLOGIE]) VALUES (@TYPOLOGIE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_Ordo_Confnonpointe_Typologie]" UpdateCommand="UPDATE [T_Ordo_Confnonpointe_Typologie] SET [TYPOLOGIE] = @TYPOLOGIE WHERE [ID] = @original_ID AND (([TYPOLOGIE] = @original_TYPOLOGIE) OR ([TYPOLOGIE] IS NULL AND @original_TYPOLOGIE IS NULL))">
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

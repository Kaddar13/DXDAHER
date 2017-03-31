<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VBSP_MOP.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.VBSP.VBSP_MOP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID_MOP">
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID_MOP" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MOP" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LIBELLE_MOP" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" DeleteCommand="DELETE FROM [VBSP_TB_MOP] WHERE [ID_MOP] = @original_ID_MOP AND (([MOP] = @original_MOP) OR ([MOP] IS NULL AND @original_MOP IS NULL)) AND (([LIBELLE_MOP] = @original_LIBELLE_MOP) OR ([LIBELLE_MOP] IS NULL AND @original_LIBELLE_MOP IS NULL))" InsertCommand="INSERT INTO [VBSP_TB_MOP] ([MOP], [LIBELLE_MOP]) VALUES (@MOP, @LIBELLE_MOP)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [VBSP_TB_MOP]" UpdateCommand="UPDATE [VBSP_TB_MOP] SET [MOP] = @MOP, [LIBELLE_MOP] = @LIBELLE_MOP WHERE [ID_MOP] = @original_ID_MOP AND (([MOP] = @original_MOP) OR ([MOP] IS NULL AND @original_MOP IS NULL)) AND (([LIBELLE_MOP] = @original_LIBELLE_MOP) OR ([LIBELLE_MOP] IS NULL AND @original_LIBELLE_MOP IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID_MOP" Type="Int32" />
            <asp:Parameter Name="original_MOP" Type="String" />
            <asp:Parameter Name="original_LIBELLE_MOP" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MOP" Type="String" />
            <asp:Parameter Name="LIBELLE_MOP" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MOP" Type="String" />
            <asp:Parameter Name="LIBELLE_MOP" Type="String" />
            <asp:Parameter Name="original_ID_MOP" Type="Int32" />
            <asp:Parameter Name="original_MOP" Type="String" />
            <asp:Parameter Name="original_LIBELLE_MOP" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="REC_ECRAN_PROD_MVTD.aspx.cs" Inherits="DX_DAHERCMS.REC_ECRAN_PROD_MVTD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div style="height:50px" >
    </div>
    <div>
       <dx:ASPxLabel runat="server" Text="Table des MVT & D"></dx:ASPxLabel> 
    </div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="MVT_ID">
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="MVT_ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MVTD" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
     </dx:ASPxGridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConLocal %>" DeleteCommand="DELETE FROM [T_MACS_MVTD] WHERE [MVT_ID] = @original_MVT_ID AND [MVTD] = @original_MVTD" InsertCommand="INSERT INTO [T_MACS_MVTD] ([MVTD]) VALUES (@MVTD)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_MACS_MVTD]" UpdateCommand="UPDATE [T_MACS_MVTD] SET [MVTD] = @MVTD WHERE [MVT_ID] = @original_MVT_ID AND [MVTD] = @original_MVTD">
         <DeleteParameters>
             <asp:Parameter Name="original_MVT_ID" Type="Int32" />
             <asp:Parameter Name="original_MVTD" Type="String" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="MVTD" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="MVTD" Type="String" />
             <asp:Parameter Name="original_MVT_ID" Type="Int32" />
             <asp:Parameter Name="original_MVTD" Type="String" />
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>

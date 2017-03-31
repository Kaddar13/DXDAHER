<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kit_DoubleControl.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.Industrie.Expedition.Kit.Kit_DoubleControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <script language="javascript" type="text/javascript">
            function OnNewClick(s, e) {
                grid.AddNewRow();
            }

            function OnEditClick(s, e) {
                var index = grid.GetFocusedRowIndex();
                grid.StartEditRow(index);
            }

            function OnSaveClick(s, e) {
                grid.UpdateEdit();
            }

            function OnCancelClick(s, e) {
                grid.CancelEdit();
            }

            function OnDeleteClick(s, e) {
                var index = grid.GetFocusedRowIndex();
                grid.DeleteRow(index);
            }
    </script>

   
    <dx:ASPxLabel ID="Label" runat="server"></dx:ASPxLabel>
    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px" ></dx:ASPxTextBox>
    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ASPxButton" OnClick="ASPxButton1_Click"  AutoPostBack="false"></dx:ASPxButton>


  <dx:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" OnRowDeleting="grid_RowDeleting"
                            OnRowInserting="grid_RowInserting" OnRowUpdating="grid_RowUpdating" OnInitNewRow="grid_InitNewRow">
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Templates>
                                <EditForm>
                                    <dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormEditors" ID="ASPxGridViewTemplateReplacement3"
                                        runat="server">
                                    </dx:ASPxGridViewTemplateReplacement>
                                </EditForm>
                            </Templates>
                        </dx:ASPxGridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        
        
        
        SelectCommand="SELECT * FROM [T_OrdoStatut]"></asp:SqlDataSource>



</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Synthese_MagVolumetrie.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.Volumetrie.Synthese_MagVolumetrie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <telerik:radscriptblock runat="server">
        <script type="text/javascript">

            //<![CDATA[

            function OnDateSelected1(sender, eventArgs) {

                var datepicker1 = $find("<%= Param_Date1.ClientID %>");
                var day = datepicker1.get_selectedDate().getDate();
                var monthIndex = datepicker1.get_selectedDate().getMonth() + 1;
                var year = datepicker1.get_selectedDate().getFullYear();

                document.getElementById("<%= Param_Hidden1.ClientID %>").value = year + '-' + monthIndex + '-' + day

            }
            function OnDateSelected2(sender, eventArgs) {

                var datepicker2 = $find("<%= Param_Date2.ClientID %>");
                var day = datepicker2.get_selectedDate().getDate();
                var monthIndex = datepicker2.get_selectedDate().getMonth() + 1;
                var year = datepicker2.get_selectedDate().getFullYear();
                document.getElementById("<%= Param_Hidden2.ClientID %>").value = year + '-' + monthIndex + '-' + day

            }

            //]]>
        </script>
    </telerik:radscriptblock>
     <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="Panel1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="RadNotification1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
             </AjaxSettings>
        </telerik:RadAjaxManager>
 <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"/>
<div>
    <telerik:RadNotification ID="RadNotification1" runat="server" Position="Center" LoadContentOn="EveryShow" VisibleOnPageLoad="true" 
                             Width="330" Height="160" Animation="Fade" EnableRoundedCorners="true" EnableShadow="true" />

   <asp:Panel ID="Panel1" runat="server" Height="380px">
        <telerik:RadDatePicker ID="Param_Date1" runat="server"  clientevents-ondateselected="OnDateSelected1" />
        <telerik:RadDatePicker ID="Param_Date2" runat="server" clientevents-ondateselected="OnDateSelected2"/>
        <telerik:RadButton ID="Button1" runat="server" Text="Refresh" OnClick="Button1_Click" Skin="MetroTouch" />
        <telerik:RadButton ID="Button2" runat="server" Text="Importer" OnClick="Button2_Click" Skin="MetroTouch" />
    
        <input id="Param_Hidden1" type="hidden"   runat="server" />
        <input id="Param_Hidden2" type="hidden"  runat="server" />
        <input id="Param_RetourProc" type="hidden"  runat="server" />
   
  <telerik:RadGrid ID="RadGrid1" runat="server"  AllowPaging="True" OnSortCommand="RadGrid1_SortCommand" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" 
            PageSize="7" AutoGenerateColumns="False" Culture="fr-FR"  GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both" OnNeedDataSource="RadGrid1_NeedDataSource"  > 
            <ExportSettings ExportOnlyData="True" IgnorePaging="True">
                <Excel Format="Xlsx" />
            </ExportSettings>
           
            <MasterTableView CommandItemDisplay="Top"> 
                <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" ShowExportToCsvButton="True" /> 
                <Columns> 
                    <telerik:GridBoundColumn DataField="DateSaisie" HeaderText="DateSaisie" HeaderStyle-Width="100px"  FilterControlAltText="Filter DateSaisie column" SortExpression="DateSaisie" UniqueName="DateSaisie" ReadOnly="True"> 
<HeaderStyle Width="100px"></HeaderStyle>
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="Volumetrie" HeaderText="Volumetrie" HeaderStyle-Width="130px" FilterControlAltText="Filter Volumetrie column" SortExpression="Volumetrie" UniqueName="Volumetrie"> 
<HeaderStyle Width="130px"></HeaderStyle>
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="Nom de l'utilisateur" HeaderText="Nom de l'utilisateur" HeaderStyle-Width="130px" FilterControlAltText="Filter Nom de l'utilisateur column" SortExpression="Nom de l'utilisateur" UniqueName="Nomutilisateur"> 
<HeaderStyle Width="130px"></HeaderStyle>
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="NB_Article" HeaderText="NB_Article"
                        HeaderStyle-Width="140px" DataType="System.Int32" FilterControlAltText="Filter NB_Article column" SortExpression="NB_Article" UniqueName="NB_Article"> 
<HeaderStyle Width="140px"></HeaderStyle>
                    </telerik:GridBoundColumn> 
                </Columns> 
            </MasterTableView> 
        </telerik:RadGrid> 
  </asp:Panel> 
</div>   
</asp:Content>

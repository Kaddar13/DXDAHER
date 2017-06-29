<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_PLANIF.aspx.cs" Inherits="DX_DAHERCMS.ORDO_PLANIF_FLORIDES" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Dashboard.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .AutoHeight{
            height: auto !important;
        }
          .CSSGrid
        {
            background-color: orange;
        }
    </style>

    <div>
        Plannification 
        <dx:ASPxLabel ID="txtTypo" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
        <dx:ASPxLabel ID="txtCompteur" runat="server" Text="ASPxLabel"></dx:ASPxLabel>

                <div>
            <telerik:RadComboBox Visible="false" ID="cb_MP" runat="server" EnableCheckAllItemsCheckBox="True" CheckBoxes="True" Culture="fr-FR" DataSourceID="SqlDataSource1" DataTextField="Market_Place" DataValueField="Market_Place">
            </telerik:RadComboBox>
            <asp:Literal ID="itemsClientSide" runat="server" />
            <telerik:RadButton Visible="false" ID="btn_MP" runat="server" OnClick="Button1_Click" Text="Filtrer"></telerik:RadButton>
        </div>

    </div>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>
    <link rel="stylesheet" href="ORDO_CSS.css" type="text/css" />
    <telerik:RadScriptBlock runat="Server" ID="RadScriptBlock1">
        <script type="text/javascript">
            /* <![CDATA[ */
            Sys.Application.add_load(function () {
                demo.scheduler = $find("<%= RadScheduler1.ClientID %>");
                demo.targetSlotHiddenFieldId = "<%=TargetSlotHiddenField.ClientID %>";
            });
            /* ]]> */
        </script>
        <script type="text/javascript" src="ORDO_SCRIPT.js"></script>
    </telerik:RadScriptBlock>
    <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" EnableAJAX="true">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadScheduler1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadScheduler1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadScheduler1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    <%--<div>--%>
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

            <input type="hidden" runat="server" id="TargetSlotHiddenField" />

            <telerik:RadSplitter RenderMode="Auto" runat="server" ID="RadSplitter1" Width="100%" Height="600px" Orientation="Horizontal">
                <telerik:RadPane runat="server" ID="TopPane">
                    <telerik:RadScheduler RenderMode="Lightweight" ID="RadScheduler1" runat="server" Skin="Metro"
                        Width="100%" OverflowBehavior="Expand" ShowFooter="False" DataSourceID="SchedulerDataSource" AppointmentStyleMode="Default" AllowDelete="False" AllowEdit="False"
                        DataKeyField="AppointmentID" 
                        DataStartField="Start" 
                        DataEndField="End" 
                        DataSubjectField="Subject"
                        CustomAttributeNames="Due,Priority,Locke,NB_LIGNE,Nb_Traite" 
                        RowHeight="37px"
                        OnAppointmentCommand="RadScheduler1_AppointmentCommand"
                        OnTimeSlotCreated="RadScheduler1_TimeSlotCreated"
                        OnAppointmentInsert="RadScheduler1_AppointmentInsert"
                        OnAppointmentDataBound="RadScheduler1_AppointmentDataBound"
                        OnAppointmentCreated="RadScheduler1_AppointmentCreated"
                        Culture="fr-FR" FirstDayOfWeek="Monday" LastDayOfWeek="Friday" SelectedView="MonthView">
                        <ExportSettings>
                            <Pdf PageBottomMargin="1in" PageLeftMargin="1in" PageRightMargin="1in" PageTopMargin="1in" />
                        </ExportSettings>
                        <AdvancedForm Modal="true"></AdvancedForm>
                        <ResourceHeaderTemplate>
                            <asp:Panel ID="ResourceImageWrapper" runat="server" CssClass="ResCustomClass">
                                <asp:Image ID="SpeakerImage" runat="server"></asp:Image>
                            </asp:Panel>
                        </ResourceHeaderTemplate>
                        <ResourceTypes>
                            <%--                        <telerik:ResourceType KeyField="Locke" Name="Cloture" TextField="Cloture" ForeignKeyField="Locke" />      
                        <telerik:ResourceType KeyField="NB_LIGNE" Name="NB_LIGNE" TextField="NB_LIGNE" ForeignKeyField="NB_LIGNE" /> 
                        <telerik:ResourceType KeyField="Nb_Traite" Name="Nb_Traite" TextField="Nb_Traite" ForeignKeyField="Nb_Traite" />  --%>
                        </ResourceTypes>
                        <ResourceStyles>
                            <%--         <telerik:ResourceStyleMapping Type="Locke" Text="Locked"></telerik:ResourceStyleMapping>    
                        <telerik:ResourceStyleMapping Type="NB_LIGNE" Text="NB_LIGNE"></telerik:ResourceStyleMapping>   
                        <telerik:ResourceStyleMapping Type="Nb_Traite" Text="Nb_Traite"></telerik:ResourceStyleMapping>--%>
                        </ResourceStyles>
                        <AppointmentTemplate>
                            <div>
                                <%#Eval("Nb_Traite") %>/ <%#Eval("NB_LIGNE") %>
                                <asp:HiddenField ID="Loked" runat="server" Value='<%# Eval("Locke") %>' />
                            </div>
                            <asp:Label runat="server" ID="sujet" Text='<%# Eval("Subject") %>' Font-Size="X-Small"></asp:Label>

                            <asp:Button runat="server" ID="UnscheduleAppointment" CssClass="simpleButton" CommandName="Unschedule"
                                Text="&nbsp;" ToolTip="Unschedule this appointment"></asp:Button>
                        </AppointmentTemplate>
                        <TimeSlotContextMenuSettings EnableDefault="true"></TimeSlotContextMenuSettings>
                        <WeekView UserSelectable="False" />
                        <DayView UserSelectable="False" />
                        <MonthView DayHeaderDateFormat="dd-MM" FirstDayHeaderDateFormat="MM-dd-yy" ColumnHeaderDateFormat="dddd" HeaderDateFormat="dd-MM" />
                        <AppointmentContextMenuSettings EnableDefault="true"></AppointmentContextMenuSettings>
                    </telerik:RadScheduler>
                </telerik:RadPane>
                <telerik:RadSplitBar runat="Server" ID="RadSplitBar1" CollapseMode="Both" />

                <telerik:RadPane runat="server" ID="BottomPane" >
                    <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="RadGrid1" DataSourceID="GridDataSource"
                        AutoGenerateColumns="False"
                        OnRowDrop="RadGrid1_RowDrop"
                        Skin="Metro"
                        Style="border: none; outline: 0"
                        Height="100%"
                        AllowAutomaticInserts="True"
                        AllowAutomaticUpdates="True"
                        AllowAutomaticDeletes="True"
                        ShowFooter="True"
                        OnItemCreated="RadGrid1_ItemCreated"
                        OnItemCommand="RadGrid1_ItemCommand"
                        AllowSorting="True"
                        Culture="fr-FR"
                        GroupPanelPosition="Top"
                        ShowGroupPanel="True"
                        AllowFilteringByColumn="True"
                        AllowMultiRowSelection="True" OnItemDataBound="RadGrid1_ItemDataBound">
                        <GroupingSettings ShowUnGroupButton="True" />
                        <ExportSettings>
                            <Pdf PageWidth="">
                            </Pdf>
                        </ExportSettings>
                        <ClientSettings AllowRowsDragDrop="True" AllowDragToGroup="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                            <ClientEvents OnRowDropping="rowDropping" OnRowDblClick="onRowDoubleClick"></ClientEvents>
                        </ClientSettings>
                        <MasterTableView DataKeyNames="AppointmentID" InsertItemDisplay="Bottom" EditMode="InPlace" ShowGroupFooter="True">

                            <Columns>
                                  <telerik:GridBoundColumn DataField="RESA"  FilterControlAltText="Filter RESA column" HeaderText="Resa" ReadOnly="True" SortExpression="RESA" UniqueName="RESA" Display="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AppointmentID" DataType="System.Int32" FilterControlAltText="Filter AppointmentID column" HeaderText="AppointmentID" ReadOnly="True" SortExpression="AppointmentID" UniqueName="AppointmentID" Display="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Market_Place" FilterControlAltText="Filter Market_Place column" HeaderText="Market_Place" SortExpression="Market_Place" UniqueName="Market_Place">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Appareil" FilterControlAltText="Filter Appareil column" HeaderText="Appareil" SortExpression="Appareil" UniqueName="Appareil">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Poste_Appareil" FilterControlAltText="Filter Poste_Appareil column" HeaderText="Poste_Appareil" SortExpression="Poste_Appareil" UniqueName="Poste_Appareil">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Magasin_Prenant" FilterControlAltText="Filter Magasin_Prenant column" HeaderText="Magasin_Prenant" SortExpression="Magasin_Prenant" UniqueName="Magasin_Prenant">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Magasin_Cedant" FilterControlAltText="Filter Magasin_Cedant column" HeaderText="Magasin_Cedant" SortExpression="Magasin_Cedant" UniqueName="Magasin_Cedant">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OT_CREEE_LE" FilterControlAltText="Filter OT_CREEE_LE column" HeaderText="OT_CREEE_LE" SortExpression="OT_CREEE_LE" UniqueName="OT_CREEE_LE" DataType="System.DateTime">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Locke_Date" DataType="System.DateTime" FilterControlAltText="Filter Locke_Date column" HeaderText="Locke_Date" SortExpression="Locke_Date" UniqueName="Locke_Date" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Locke" FilterControlAltText="Filter Locke column" HeaderText="Locke" SortExpression="Locke" UniqueName="Locke" DataType="System.Int32" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="Priority" FilterControlAltText="Filter Priority column" HeaderText="Priority" SortExpression="Priority" UniqueName="Priority">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="LabelA" Text='<%#Bind ("Priority") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox RenderingMode="Simple" runat="server" ID="priorityCombobox">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="High" Value="High" />
                                                <telerik:RadComboBoxItem Text="Medium" Value="High" />
                                                <telerik:RadComboBoxItem Text="Low" Value="High" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn DataField="Due" DataType="System.DateTime" FilterControlAltText="Filter Due column" HeaderText="Due" SortExpression="Due" UniqueName="Due" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="End" FilterControlAltText="Filter End column" HeaderText="End" SortExpression="End" UniqueName="End" DataType="System.DateTime" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Start" FilterControlAltText="Filter Start column" HeaderText="Start" SortExpression="Start" UniqueName="Start" DataType="System.DateTime" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Subject" FilterControlAltText="Filter Subject column" HeaderText="Subject" SortExpression="Subject" UniqueName="Subject" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NB_LIGNE" FilterControlAltText="Filter NB_LIGNE column" HeaderText="NB_LIGNE" SortExpression="NB_LIGNE" UniqueName="NB_LIGNE" DataType="System.Int32" Aggregate="Sum" FooterText="Total Total :">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Cellule" FilterControlAltText="Filter Cellule column" HeaderText="Cellule" SortExpression="Cellule" UniqueName="Cellule">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Nb_Traite" DataType="System.Int32" FilterControlAltText="Filter Nb_Traite column" HeaderText="Nb_Traite" SortExpression="Nb_Traite" UniqueName="Nb_Traite" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Statut" DataType="System.Int32" FilterControlAltText="Filter Statut column" HeaderText="Statut" SortExpression="Statut" UniqueName="Statut" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Type_Ordo" FilterControlAltText="Filter Type_Ordo column" HeaderText="Type_Ordo" SortExpression="Type_Ordo" UniqueName="Type_Ordo" Display="True">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <FilterMenu RenderMode="Lightweight">
                        </FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight">
                        </HeaderContextMenu>
                    </telerik:RadGrid>
                </telerik:RadPane>
            </telerik:RadSplitter>
        </telerik:RadAjaxPanel>
    <%--</div>--%>

    <asp:SqlDataSource ID="SchedulerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" OnSelecting="SchedulerDataSource_Selecting"
        DeleteCommand="DELETE FROM [T_Ordo_Appointments_DragAndDrop] WHERE [AppointmentID] = @AppointmentID"
        InsertCommand="INSERT INTO [T_Ordo_Appointments_DragAndDrop] ([Start], [End], [Subject]) VALUES (@Start, @End, @Subject)"
        SelectCommand="SELECT DISTINCT T_Ordo_Appointments_DragAndDrop.AppointmentID, T_Ordo_Appointments_DragAndDrop.Market_Place, T_Ordo_Appointments_DragAndDrop.Appareil, T_Ordo_Appointments_DragAndDrop.Poste_Appareil, T_Ordo_Appointments_DragAndDrop.Magasin_Prenant, T_Ordo_Appointments_DragAndDrop.Magasin_Cedant, CONVERT (date, T_Ordo_Appointments_DragAndDrop.OT_CREEE_LE, 12) AS OT_CREEE_LE, T_Ordo_Appointments_DragAndDrop.NB_LIGNE, T_Ordo_Appointments_DragAndDrop.Subject, T_Ordo_Appointments_DragAndDrop.Start, T_Ordo_Appointments_DragAndDrop.[End], T_Ordo_Appointments_DragAndDrop.Due, T_Ordo_Appointments_DragAndDrop.Priority, T_Ordo_Appointments_DragAndDrop.Locke, T_Ordo_Appointments_DragAndDrop.Locke_Date, T_Ordo_TypeOrdo.Type_Ordo, T_Ordo_Appointments_DragAndDrop.Cellule, T_Ordo_Appointments_DragAndDrop.Nb_Traite FROM T_Ordo_Appointments_DragAndDrop INNER JOIN T_Ordo ON T_Ordo_Appointments_DragAndDrop.AppointmentID = T_Ordo.AppointmentID INNER JOIN T_Ordo_TypeOrdo ON T_Ordo.[Clé gare] = T_Ordo_TypeOrdo.Cle_Gare WHERE (T_Ordo_TypeOrdo.Type_Ordo LIKE @Type_Ordo) AND (T_Ordo_Appointments_DragAndDrop.Start &lt; @RangeEnd) AND (T_Ordo_Appointments_DragAndDrop.[End] &gt; @RangeStart)"
        UpdateCommand="UPDATE [T_Ordo_Appointments_DragAndDrop] SET [Start] = @Start, [End] = @End, [Subject] = @Subject WHERE [AppointmentID] = @AppointmentID">
        <SelectParameters>
            <asp:QueryStringParameter Name="Type_Ordo" Direction="Input" QueryStringField="Id" ConvertEmptyStringToNull="True" Type="String" />
            <asp:Parameter DbType="DateTime" DefaultValue="1900/1/1" Name="RangeEnd" />
            <asp:Parameter DbType="DateTime" DefaultValue="2900/1/1" Name="RangeStart" />

        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="AppointmentID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="End" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="End" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
            <asp:Parameter Name="AppointmentID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="GridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT T_Ordo_Appointments_DragAndDrop.AppointmentID, T_Ordo_Appointments_DragAndDrop.Market_Place, T_Ordo_Appointments_DragAndDrop.Appareil, T_Ordo_Appointments_DragAndDrop.Poste_Appareil, T_Ordo_Appointments_DragAndDrop.Magasin_Prenant, T_Ordo_Appointments_DragAndDrop.Magasin_Cedant, CONVERT (date, T_Ordo_Appointments_DragAndDrop.OT_CREEE_LE, 12) AS OT_CREEE_LE, T_Ordo_Appointments_DragAndDrop.Locke_Date, T_Ordo_Appointments_DragAndDrop.Locke, T_Ordo_Appointments_DragAndDrop.Priority, T_Ordo_Appointments_DragAndDrop.Due, T_Ordo_Appointments_DragAndDrop.[End], T_Ordo_Appointments_DragAndDrop.Start, T_Ordo_Appointments_DragAndDrop.Subject, T_Ordo_Appointments_DragAndDrop.NB_LIGNE, T_Ordo_Appointments_DragAndDrop.Cellule, T_Ordo_Appointments_DragAndDrop.Nb_Traite, T_Ordo.Statut, T_Ordo_TypeOrdo.Type_Ordo, T_Ordo_Appointments_DragAndDrop.RESA FROM T_Ordo_Appointments_DragAndDrop INNER JOIN T_Ordo ON T_Ordo_Appointments_DragAndDrop.AppointmentID = T_Ordo.AppointmentID INNER JOIN T_Ordo_PerimetreMagasin ON T_Ordo.[Type magasin cédant] = T_Ordo_PerimetreMagasin.Id_Magasin INNER JOIN T_Ordo_TypeOrdo ON T_Ordo.[Clé gare] = T_Ordo_TypeOrdo.Cle_Gare WHERE (T_Ordo_Appointments_DragAndDrop.Start IS NULL) AND (T_Ordo_Appointments_DragAndDrop.[End] IS NULL) AND (T_Ordo.Statut = 0) AND (T_Ordo_PerimetreMagasin.VOIR = N'oui') AND (T_Ordo_TypeOrdo.Type_Ordo LIKE @Type_Ordo) ORDER BY T_Ordo_Appointments_DragAndDrop.RESA DESC"
        DeleteCommand="DELETE FROM [T_Ordo_Appointments_DragAndDrop] WHERE [AppointmentID] = @AppointmentID"
        InsertCommand="INSERT INTO [T_Ordo_Appointments_DragAndDrop] ([Subject], [Due], [Priority]) VALUES (@Subject, @Due, @Priority)"
        UpdateCommand="UPDATE [T_Ordo_Appointments_DragAndDrop] SET [Subject] = @Subject, [Start] = @Start, [End] = @End, [Due] = @Due,  [Priority] = @Priority  WHERE [AppointmentID] = @AppointmentID">

        <SelectParameters>
            <asp:QueryStringParameter Name="Type_Ordo" Direction="Input" QueryStringField="Id" ConvertEmptyStringToNull="True" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="AppointmentID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
            <asp:Parameter Name="Due" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
            <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="End" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Due" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
            <asp:Parameter Name="AppointmentID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_TotalJour" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" OnSelecting="SchedulerDataSource_Selecting"
        DeleteCommand="DELETE FROM [T_Ordo_Appointments_DragAndDrop] WHERE [AppointmentID] = @AppointmentID"
        InsertCommand="INSERT INTO [T_Ordo_Appointments_DragAndDrop] ([Start], [End], [Subject]) VALUES (@Start, @End, @Subject)"
        SelectCommand="SELECT DISTINCT COUNT(T_Ordo_Appointments_DragAndDrop.NB_LIGNE) AS Total, CONVERT (VARCHAR(10), T_Ordo_Appointments_DragAndDrop.Start, 103) AS Start FROM T_Ordo_Appointments_DragAndDrop INNER JOIN T_Ordo ON T_Ordo_Appointments_DragAndDrop.AppointmentID = T_Ordo.AppointmentID INNER JOIN T_Ordo_TypeOrdo ON T_Ordo.[Clé gare] = T_Ordo_TypeOrdo.Cle_Gare WHERE (T_Ordo_TypeOrdo.Type_Ordo LIKE @Type_Ordo) GROUP BY CONVERT (VARCHAR(10), T_Ordo_Appointments_DragAndDrop.Start, 103) HAVING (CONVERT (VARCHAR(10), T_Ordo_Appointments_DragAndDrop.Start, 103) &lt;= @RangeEnd) AND (CONVERT (VARCHAR(10), T_Ordo_Appointments_DragAndDrop.Start, 103) &gt;= @RangeStart)">

        <SelectParameters>
            <asp:QueryStringParameter Name="Type_Ordo" Direction="Input" QueryStringField="Id" ConvertEmptyStringToNull="True" Type="String" />
            <asp:Parameter DbType="DateTime" DefaultValue="1900/1/1" Name="RangeEnd" />
            <asp:Parameter DbType="DateTime" DefaultValue="2900/1/1" Name="RangeStart" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="AppointmentID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="End" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="End" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
            <asp:Parameter Name="AppointmentID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        SelectCommand="SELECT DISTINCT ID_RESOURCE, MarketPlace, Couleur FROM T_Ordo_ResourceMP">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Compteur" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        SelectCommand="SELECT     CASE WHEN Start IS NULL THEN 0 ELSE 1 END AS Planif, COUNT(dbo.T_Ordo_Appointments_DragAndDrop.AppointmentID) AS Nb_Ligne, dbo.T_Ordo_TypeOrdo.Type_Ordo
FROM         dbo.T_Ordo_Appointments_DragAndDrop INNER JOIN
                      dbo.T_Ordo ON dbo.T_Ordo_Appointments_DragAndDrop.AppointmentID = dbo.T_Ordo.AppointmentID INNER JOIN
                      dbo.T_Ordo_TypeOrdo ON dbo.T_Ordo.[Clé gare] = dbo.T_Ordo_TypeOrdo.Cle_Gare
GROUP BY CASE WHEN Start IS NULL THEN 0 ELSE 1 END, dbo.T_Ordo_TypeOrdo.Type_Ordo
HAVING      (dbo.T_Ordo_TypeOrdo.Type_Ordo LIKE @TypeOrdo)
">
        <SelectParameters>
              <asp:QueryStringParameter Name="TypeOrdo" Direction="Input" QueryStringField="ID" ConvertEmptyStringToNull="True" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>

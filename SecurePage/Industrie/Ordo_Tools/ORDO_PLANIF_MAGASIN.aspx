<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_PLANIF_MAGASIN.aspx.cs" Inherits="DX_DAHERCMS.ORDO_PLANIF_MAGASIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>Plannification Magasin</div>
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
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="demo-container no-bg">
        <input type="hidden" runat="server" id="TargetSlotHiddenField" />
        <telerik:RadSplitter RenderMode="Lightweight" runat="server" ID="RadSplitter1" Height="552px" Width="100%"
            CssClass="exampleContainer" Orientation="Horizontal" Skin="Metro">
            <telerik:RadPane runat="server" ID="TopPane" Height="400px" Scrolling="None">

                <telerik:RadScheduler RenderMode="Lightweight" ID="RadScheduler1" runat="server" Skin="Metro"
                    Width="100%" OverflowBehavior="Auto" ShowFooter="False" DataSourceID="SchedulerDataSource" AppointmentStyleMode="Default"
                    DataKeyField="AppointmentID" DataStartField="Start" DataEndField="End" DataSubjectField="Subject" SelectedView="TimelineView" 
                    CustomAttributeNames="Due,Priority,Locke" RowHeight="37px" 
                    OnAppointmentCommand="RadScheduler1_AppointmentCommand"
                    OnTimeSlotCreated="RadScheduler1_TimeSlotCreated"
                    OnAppointmentInsert="RadScheduler1_AppointmentInsert"
                    OnAppointmentDataBound="RadScheduler1_AppointmentDataBound"
                    OnAppointmentCreated="RadScheduler1_AppointmentCreated"
                    Culture="fr-FR" 
                    >
                    <AdvancedForm Modal="true"></AdvancedForm>
                    <ResourceTypes>
                        <telerik:ResourceType KeyField="Locke" Name="Cloture" TextField="Cloture" ForeignKeyField="Locke" />
                    </ResourceTypes>
                    <ResourceStyles>
                        <telerik:ResourceStyleMapping Type="Locke" Text="Locked" ApplyCssClass="rsCategoryBlue"></telerik:ResourceStyleMapping>                       
                    </ResourceStyles>
                    <AppointmentTemplate>
                       <div>
                            Verroullé :
                            <%# Eval("Locke") %>
                        </div>

                        <%# Eval("Subject") %>
                        <asp:Button runat="server" ID="UnscheduleAppointment" CssClass="simpleButton" CommandName="Unschedule"
                            Text="&nbsp;" ToolTip="Unschedule this appointment"></asp:Button>

                    </AppointmentTemplate>
                    <TimeSlotContextMenuSettings EnableDefault="true"></TimeSlotContextMenuSettings>
                    <AppointmentContextMenuSettings EnableDefault="true"></AppointmentContextMenuSettings>

                </telerik:RadScheduler>

            </telerik:RadPane>
            <telerik:RadSplitBar runat="Server" ID="RadSplitBar1">
            </telerik:RadSplitBar>
            <telerik:RadPane runat="server" ID="BottomPane">
                <div style="float: left; height: 100%; width: 55px; background: #E3EFFF; text-align: center; border-right: 1px solid #6593CF;">
                    <img src="/img/Ordo.PNG" alt="" />
                </div>
                <div style="margin-left: 56px; border: none;">
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
                        AllowMultiRowSelection="True">
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
                                <telerik:GridBoundColumn DataField="AppointmentID" DataType="System.Int32" FilterControlAltText="Filter AppointmentID column" HeaderText="AppointmentID" ReadOnly="True" SortExpression="AppointmentID" UniqueName="AppointmentID" Display="False">
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
                                <telerik:GridBoundColumn DataField="OT_CREEE_LE" FilterControlAltText="Filter OT_CREEE_LE column" HeaderText="OT_CREEE_LE" SortExpression="OT_CREEE_LE" UniqueName="OT_CREEE_LE">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NB_LIGNE" DataType="System.Int32" FilterControlAltText="Filter NB_LIGNE column" HeaderText="NB_LIGNE" SortExpression="NB_LIGNE" UniqueName="NB_LIGNE">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Subject" FilterControlAltText="Filter Subject column" HeaderText="Subject" SortExpression="Subject" UniqueName="Subject" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Start" DataType="System.DateTime" FilterControlAltText="Filter Start column" HeaderText="Start" SortExpression="Start" UniqueName="Start" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="End" DataType="System.DateTime" FilterControlAltText="Filter End column" HeaderText="End" SortExpression="End" UniqueName="End" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Due" DataType="System.DateTime" FilterControlAltText="Filter Due column" HeaderText="Due" SortExpression="Due" UniqueName="Due" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Priority" FilterControlAltText="Filter Priority column" HeaderText="Priority" SortExpression="Priority" UniqueName="Priority" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Locke" DataType="System.Int32" Display="False" FilterControlAltText="Filter Locke column" HeaderText="Locke" SortExpression="Locke" UniqueName="Locke">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Locke_Date" DataType="System.DateTime" Display="False" FilterControlAltText="Filter Locke_Date column" HeaderText="Locke_Date" SortExpression="Locke_Date" UniqueName="Locke_Date">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Type_Ordo" FilterControlAltText="Filter Type_Ordo column" HeaderText="Type_Ordo" SortExpression="Type_Ordo" UniqueName="Type_Ordo">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Cellule" FilterControlAltText="Filter Cellule column" HeaderText="Cellule" SortExpression="Cellule" UniqueName="Cellule">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <FilterMenu RenderMode="Lightweight">
                        </FilterMenu>
                        <HeaderContextMenu RenderMode="Lightweight">
                        </HeaderContextMenu>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPane>
        </telerik:RadSplitter>
    </div>
    <asp:SqlDataSource ID="SchedulerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:laboConnectionString %>"
        DeleteCommand="DELETE FROM [T_Ordo_Appointments_DragAndDrop] WHERE [AppointmentID] = @AppointmentID"
        InsertCommand="INSERT INTO [T_Ordo_Appointments_DragAndDrop] ([Start], [End], [Subject]) VALUES (@Start, @End, @Subject)"
        SelectCommand="SELECT AppointmentID, Market_Place, Appareil, Poste_Appareil, Magasin_Prenant, Magasin_Cedant, OT_CREEE_LE, NB_LIGNE, Subject, Start, [End], Due, Priority, Locke, Locke_Date, Type_Ordo, Cellule, Nb_Traite FROM T_Ordo_Appointments_DragAndDrop" UpdateCommand="UPDATE [T_Ordo_Appointments_DragAndDrop] SET [Start] = @Start, [End] = @End, [Subject] = @Subject WHERE [AppointmentID] = @AppointmentID">
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
    <asp:SqlDataSource ID="GridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:laboConnectionString %>"
        DeleteCommand="DELETE FROM [T_Ordo_Appointments_DragAndDrop] WHERE [AppointmentID] = @AppointmentID"
        InsertCommand="INSERT INTO [T_Ordo_Appointments_DragAndDrop] ([Subject], [Due], [Priority]) VALUES (@Subject, @Due, @Priority)"
        SelectCommand="SELECT AppointmentID, Market_Place, Appareil, Poste_Appareil, Magasin_Prenant, Magasin_Cedant, OT_CREEE_LE, NB_LIGNE, Subject, Start, [End], Due, Priority, Locke, Locke_Date, Type_Ordo, Cellule FROM T_Ordo_Appointments_DragAndDrop WHERE (Start IS NULL) AND ([End] IS NULL) AND (Type_Ordo = N'MAGASIN')"
        UpdateCommand="UPDATE [T_Ordo_Appointments_DragAndDrop] SET [Subject] = @Subject, [Start] = @Start, [End] = @End, [Due] = @Due,  [Priority] = @Priority  WHERE [AppointmentID] = @AppointmentID">
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

</asp:Content>

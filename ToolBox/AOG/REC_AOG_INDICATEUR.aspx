<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="REC_AOG_INDICATEUR.aspx.cs" Inherits="DX_DAHERCMS.REC_AOG_INDICATEUR" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script>
        function Filtre2h(s, e) {
            var filterCondition = "[CD_CHRONO] >'2'";
            Grid2h.ApplyFilter(filterCondition);
            isFiltered = true;
        }
    </script>
        <script src="jquery-1.11.2.min.js"></script>
        <script>window.jQuery || document.write('<script src="jquery-1.11.2.min.js"><\/script>')</script>
        <script src="jquery.timeTo.js"></script>
        <script src="jquery.countdown.js"></script>
        <script>

            //var theGridView = document.getElementById("GridView1").rows[1].cells[1].innerHTML
            //console.log(theGridView)


            //$('#countdown-1').timeTo({
            //    timeTo: new Date(new Date(theGridView)),
            //    theme: "black",
            //    displayCaptions: false,
            //    fontSize: 14,
            //    captionSize: 14
            //});

            $('[data-countdown]').each(function () {
                var $this = $(this), finalDate = $(this).data('countdown');
                $this.countdown(finalDate, function (event) {
                    $this.html(event.strftime('%H:%M:%S'));
                });
            });



        </script>
 <div style="margin-left:auto;margin-right:auto;width:auto;">
            <div style="float:right;padding:5px;">
               
                        <asp:GridView ID="GridView2" CssClass="GridViewStyle2" runat="server" Font-Size="X-Small"  AutoGenerateColumns="False" DataSourceID="DS_DateFichier" >
                            <Columns>
                                <asp:BoundField DataField="CD_Source" HeaderText="Fichier" SortExpression="CD_Source" >
                                <ControlStyle BorderColor="White" BorderStyle="None" BorderWidth="0px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CD_DateExtract" HeaderText="Date Extract" SortExpression="CD_DateExtract">
                                <ControlStyle BorderColor="White" BorderStyle="None" BorderWidth="0px" />
                                </asp:BoundField>
                            </Columns>  
                            <RowStyle CssClass="GridViewRowStyle2" /> 
                            <HeaderStyle CssClass="GridViewHeaderStyle2" />
                        </asp:GridView>
            </div> 
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
         SelectCommand="SELECT IDSPEEDUP FROM T_SPEEDUP WHERE (IDSPEEDUP &gt;= 10)"></asp:SqlDataSource>
            <div>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="AOG" Font-Size="XX-Large"></dx:ASPxLabel>

             <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="Grid2h" AutoGenerateColumns="False" DataSourceID="DS_Grid1" KeyFieldName="Livraison" Theme="moderno" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
			     <ClientSideEvents />
			 <SettingsPager Mode="ShowAllRecords"/>
                    <SettingsEditing Mode="EditForm">
                    </SettingsEditing>
                    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                    <EditFormLayoutProperties ColCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="Commentaires">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
					    <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
					<dx:GridViewDataTextColumn FieldName="Chrono" VisibleIndex="1">
						<DataItemTemplate>
							 <div data-countdown="<%# Eval("TargetAOG") %>"></div>
							</DataItemTemplate>
						</dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Livraison" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CD_CreeLe_Format" VisibleIndex="3" Caption="Date Creation">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CD_TargetAOG" VisibleIndex="4" Caption="Date Objectif">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Reception" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NbPoste" ReadOnly="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Statut" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CD_Commentaire" ReadOnly="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Commentaires" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CD_CHRONO" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <FormatConditions>
					<dx:GridViewFormatConditionHighlight ApplyToRow="True" Expression="Toint([CD_CHRONO]) > 45" Format="Custom" >
                            <RowStyle BackColor="Green" ForeColor="White" />
                        </dx:GridViewFormatConditionHighlight>
                        <dx:GridViewFormatConditionHighlight ApplyToRow="True" Expression="Toint([CD_CHRONO]) < 0" Format="Custom">
                            <RowStyle BackColor="Red" ForeColor="White"/>
                        </dx:GridViewFormatConditionHighlight>
						    <dx:GridViewFormatConditionHighlight ApplyToRow="True" Expression="(Toint([CD_CHRONO]) < 45) AND (Toint([CD_CHRONO]) > 0)  " Format="Custom">
                            <RowStyle BackColor="Orange" ForeColor="White"/>
                        </dx:GridViewFormatConditionHighlight>



                        
                    </FormatConditions>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
                </dx:ASPxGridView>
            <asp:SqlDataSource ID="DS_Grid1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
			SelectCommand="SELECT * FROM View_AOG_INDICATEUR" 
			UpdateCommand="UPDATE AOG_Encours_Commentaires SET Commentaires = @Commentaires WHERE (Livraison = @Livraison)">
                <UpdateParameters>
                    <asp:Parameter Name="Commentaires" />
                    <asp:Parameter Name="Livraison" />
                </UpdateParameters>
            </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DS_DateFichier" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_connectionstring %>" 
                            SelectCommand="SELECT DISTINCT [CD_Source], [CD_DateExtract] FROM [AOG_Encours]">
                        </asp:SqlDataSource>
       

            </div>
</asp:Content>
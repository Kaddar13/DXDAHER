<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="REC_AOG_INDICATEUR.aspx.cs" Inherits="DX_DAHERCMS.REC_AOG_INDICATEUR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="margin-left:auto;margin-right:auto;width:auto;">
            <div style="float:right;padding:5px;">
                        Indicateur AOG
                        <asp:GridView ID="GridView2" CssClass="GridViewStyle2" runat="server" Font-Size="X-Small"  AutoGenerateColumns="False" DataSourceID="SqlDataSource2" >
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
 
            <div style="clear:both;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"  Font-Names="Calibri" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Livraison" HeaderText="Livraison" SortExpression="Livraison" >
                    
                    <ItemStyle Width="0px" />
                    </asp:BoundField>
                    
                    <asp:BoundField DataField="CD_CreeLe_Format" HeaderText="CD_CreeLe_Format" SortExpression="CD_CreeLe_Format" />
                    <asp:BoundField DataField="CD_TargetAOG" HeaderText="CD_TargetAOG" SortExpression="CD_TargetAOG" />
                    <asp:BoundField DataField="Reception" HeaderText="Reception" SortExpression="Reception" />
                    <asp:BoundField DataField="NbPoste" HeaderText="NbPoste" ReadOnly="True" SortExpression="NbPoste" />
                    <asp:BoundField DataField="SMreelle" HeaderText="SMreelle" SortExpression="SMreelle" />
                    <asp:BoundField DataField="Statut" HeaderText="Statut" SortExpression="Statut" />
                    <asp:BoundField DataField="CD_Chrono" HeaderText="CD_Chrono" SortExpression="CD_Chrono" />
                    <asp:BoundField DataField="CD_Commentaire" HeaderText="CD_Commentaire" ReadOnly="True" SortExpression="CD_Commentaire" />
                    <asp:BoundField DataField="filtre" HeaderText="filtre" ReadOnly="True" SortExpression="filtre" />
                    <asp:BoundField DataField="CD_Source" HeaderText="CD_Source" SortExpression="CD_Source" />
                    <asp:BoundField DataField="TargetAOG" HeaderText="TargetAOG" ReadOnly="True" SortExpression="TargetAOG" />
                    <asp:BoundField DataField="Commentaires" HeaderText="Commentaires" SortExpression="Commentaires" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DashboardConnectionString %>" SelectCommand="SELECT AOG_Encours.Livraison, AOG_Encours.CD_CreeLe_Format, AOG_Encours.CD_TargetAOG, AOG_Encours.Reception, COUNT(AOG_Encours.Poste) AS NbPoste, AOG_Encours.SMreelle, AOG_Statut.Statut, AOG_Encours.CD_Chrono, LEFT (AOG_Encours_Commentaires.Commentaires, 10) + '[...]' AS CD_Commentaire, RIGHT (AOG_Encours.Creele, 4) AS filtre, AOG_Encours.CD_Source, CONVERT (VARCHAR(24), AOG_Encours.CD_TargetAOG, 120) AS TargetAOG, AOG_Encours_Commentaires.Commentaires FROM AOG_Encours LEFT OUTER JOIN AOG_Statut ON AOG_Encours.CD_Statut = AOG_Statut.Code LEFT OUTER JOIN AOG_Encours_Commentaires ON AOG_Encours.Livraison = AOG_Encours_Commentaires.Livraison GROUP BY AOG_Encours.Livraison, AOG_Encours.CD_CreeLe_Format, AOG_Encours.CD_TargetAOG, AOG_Encours.Reception, AOG_Encours.SMreelle, AOG_Statut.Statut, AOG_Encours.CD_Chrono, LEFT (AOG_Encours_Commentaires.Commentaires, 10) + '[...]', RIGHT (AOG_Encours.Creele, 4), AOG_Encours.CD_Source, CONVERT (VARCHAR(24), AOG_Encours.CD_TargetAOG, 120), AOG_Encours_Commentaires.Commentaires HAVING (RIGHT (AOG_Encours.Creele, 4) = '2014')" UpdateCommand="UPDATE AOG_Encours_Commentaires SET Commentaires = @Commentaires WHERE (Livraison = @Livraison)">
                <UpdateParameters>
                    <asp:Parameter Name="Commentaires" />
                    <asp:Parameter Name="Livraison" />
                </UpdateParameters>
            </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DashboardConnectionString %>" SelectCommand="SELECT DISTINCT [CD_Source], [CD_DateExtract] FROM [AOG_Encours]">

         </asp:SqlDataSource>
       
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
                    $this.html(event.strftime('%D days %H:%M:%S'));
                });
            });



        </script>
            </div>
        </div>
</asp:Content>

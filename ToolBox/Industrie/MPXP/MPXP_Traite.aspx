<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MPXP_Traite.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.Industrie.MPXP.MPXP_Traite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<dx:ASPxLabel runat="server" Text="Tracabilite - Statut pieces"></dx:ASPxLabel>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="True" Collapsed="True" Theme="Moderno" HeaderText="Filtre" AllowCollapsingByHeaderClick="True">
        <PanelCollection>
            <dx:PanelContent>   
                 <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2">
         <Items>
             <dx:LayoutItem Caption="Appareil">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server" >
                          <dx:ASPxTextBox ID="Filtre1"  runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
             <dx:LayoutItem Caption="Poste Appareil">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server"  >
                         <dx:ASPxTextBox ID="Filtre2" runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
             <dx:LayoutItem Caption="Operation">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server" >
                          <dx:ASPxTextBox ID="Filtre3"  runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
             <dx:LayoutItem Caption="Article">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server"  >
                         <dx:ASPxTextBox ID="Filtre4" runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
             <dx:LayoutItem  Caption="Num OT">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server">
                          <dx:ASPxTextBox ID="Filtre5"  runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
             <dx:LayoutItem Caption="Num Ordre">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server" >
                         <dx:ASPxTextBox ID="Filtre9"  runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
             <dx:LayoutItem Caption="Poste OT">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server" >
                            <dx:ASPxTextBox ID="Filtre6"  runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
             <dx:LayoutItem Caption="BL">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server" >
                         <dx:ASPxTextBox ID="Filtre7"  runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
             <dx:LayoutItem Caption="Shipping">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server"  >
                         <dx:ASPxTextBox ID="Filtre8" runat="server" ></dx:ASPxTextBox>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>            
            
             <dx:LayoutItem ColSpan="2" ShowCaption="False">
                 <LayoutItemNestedControlCollection>
                     <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxButton runat="server" OnClick="Unnamed_Click" Text="Actualiser" ></dx:ASPxButton>
                     </dx:LayoutItemNestedControlContainer>
                 </LayoutItemNestedControlCollection>
             </dx:LayoutItem>
         </Items>
 </dx:ASPxFormLayout>  
                           
             

             </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>

<div style="height:20px">

</div>                

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Theme="Moderno">

                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="N° Ordre" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Appareil" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PosApp" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Opération" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Numéro_OT" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Pos_OT" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="livraison" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="transport" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="recept" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Statut" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Date_conf_conv" VisibleIndex="10">
                            <PropertiesDateEdit>
                                <TimeSectionProperties>
                                    <TimeEditProperties>
                                        <ClearButton Visibility="Auto">
                                        </ClearButton>
                                    </TimeEditProperties>
                                </TimeSectionProperties>
                                <ClearButton Visibility="Auto">
                                </ClearButton>
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="Date_recep_conv" VisibleIndex="11">
                            <PropertiesDateEdit>
                                <TimeSectionProperties>
                                    <TimeEditProperties>
                                        <ClearButton Visibility="Auto">
                                        </ClearButton>
                                    </TimeEditProperties>
                                </TimeSectionProperties>
                                <ClearButton Visibility="Auto">
                                </ClearButton>
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="Date_livr_conv" VisibleIndex="12">
                            <PropertiesDateEdit>
                                <TimeSectionProperties>
                                    <TimeEditProperties>
                                        <ClearButton Visibility="Auto">
                                        </ClearButton>
                                    </TimeEditProperties>
                                </TimeSectionProperties>
                                <ClearButton Visibility="Auto">
                                </ClearButton>
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="Date_pack_conv" VisibleIndex="13">
                            <PropertiesDateEdit>
                                <TimeSectionProperties>
                                    <TimeEditProperties>
                                        <ClearButton Visibility="Auto">
                                        </ClearButton>
                                    </TimeEditProperties>
                                </TimeSectionProperties>
                                <ClearButton Visibility="Auto">
                                </ClearButton>
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="Date_finTran_conv" VisibleIndex="14">
                            <PropertiesDateEdit>
                                <TimeSectionProperties>
                                    <TimeEditProperties>
                                        <ClearButton Visibility="Auto">
                                        </ClearButton>
                                    </TimeEditProperties>
                                </TimeSectionProperties>
                                <ClearButton Visibility="Auto">
                                </ClearButton>
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Comment" VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                    </Columns>
            <Styles AdaptiveDetailButtonWidth="22"></Styles>

                </dx:ASPxGridView>
           
       


               

            
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IndustrieMagasin_ConnectionString %>" 
                SelectCommand="SELECT [N° Ordre], [Appareil], [PosApp], [Opération], [Numéro OT] AS Numéro_OT, [Pos OT] AS Pos_OT, [livraison], [transport], [recept], [Statut], [Date_conf_conv], [Date_recep_conv], [Date_livr_conv], [Date_pack_conv], [Date_finTran_conv],[Comment] 
                FROM [MPXP_Traite] WHERE (([Appareil] LIKE '%' + @Appareil + '%') AND ([PosApp] LIKE '%' + @PosApp + '%') AND ([Opération] LIKE '%' + @Opération + '%') AND ([Article] LIKE '%' + @Article +'%') AND ([Numéro OT] LIKE '%'+ @Numéro_OT+'%') AND ([Pos OT] LIKE '%'+ @Pos_OT+'%') AND ([livraison] LIKE '%' + @livraison + '%') AND ([transport] LIKE '%'+ @transport +'%') AND ([N° Ordre] LIKE '%' + @Num_Ordre +'%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre1" ConvertEmptyStringToNull="False" DefaultValue="%" Name="Appareil" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre2" ConvertEmptyStringToNull="False" Name="PosApp" PropertyName="Text" />					
                    <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre3" ConvertEmptyStringToNull="False" Name="Opération" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre4" ConvertEmptyStringToNull="False" Name="Article" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre5" ConvertEmptyStringToNull="False" Name="Numéro_OT" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre6" ConvertEmptyStringToNull="False" Name="Pos_OT" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre7" ConvertEmptyStringToNull="False" Name="livraison" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre8" ConvertEmptyStringToNull="False" Name="transport" PropertyName="Text" />
					<asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxFormLayout1$Filtre9" ConvertEmptyStringToNull="False" Name="Num_Ordre" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

    



</asp:Content>

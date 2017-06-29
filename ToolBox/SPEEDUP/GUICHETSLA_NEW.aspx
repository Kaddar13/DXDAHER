<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GUICHETSLA_NEW.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.SPEEDUP.GUICHETSLA_NEW" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <script>

          function onUploadControlFileUploadComplete(s, e) {
              if (e.isValid)
                  ASPxTextBox1.SetValue(e.callbackData);
          }
    </script>
      
      <div>
            
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Reservation Guichet - Servitude en 1 heure." Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>

        <dx:ASPxFormLayout ID="formLayout" runat="server" >
            <Items>
                <dx:LayoutGroup Caption="Demande Guichet">
                    <Items>
                        <dx:LayoutGroup Caption="Informations du demandeur :">
                            <Items>
							<%--Sigle--%>
                                <dx:LayoutItem Caption="Appareil">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txt_appareil" runat="server">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="EOTP :" RowSpan="2" Visible="True">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxTextBox ID="txt_sigle" runat="server" >
											                 <ValidationSettings SetFocusOnError="True">
                                                    <RequiredField IsRequired="false" ErrorText="Champs Obligatoire !" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <%--Email--%>
                                <dx:LayoutItem Caption="Email du demandeur :">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxTextBox ID="txt_email" runat="server">
                                                <ValidationSettings ErrorDisplayMode="Text" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">
                                                    <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <%--Telephone--%>
                                <dx:LayoutItem Caption="Telephone du demandeur :">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxTextBox ID="txt_telephone" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>

                        <dx:LayoutGroup Caption="Specification de la demande :">
                            <Items>
                                <%--Enlevement--%>
                                <dx:LayoutItem Caption="Enlevement">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxRadioButtonList ID="txt_Enlevement" runat="server">
                                                <Items>
                                                    <dx:ListEditItem Text="Guichet" Value="Guichet" Selected="true" />

                                                </Items>
                                                <ValidationSettings SetFocusOnError="True">
                                                    <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                </ValidationSettings>
                                            </dx:ASPxRadioButtonList>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <%--Magasin--%>
                                <dx:LayoutItem Caption="Magasin">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxComboBox ID="txt_Magasin" runat="server">
                                                <Items>
                                                    <dx:ListEditItem Text="C1 SLA" Value="C1 SLA" Selected="true"/>
													<dx:ListEditItem Text="5GV" Value="5GV"/>
                                                    <dx:ListEditItem Text="5AU" Value="5AU"/>
                                                    <dx:ListEditItem Text="5DE" Value="5DE"/>
                                                    <dx:ListEditItem Text="5GH" Value="5GH"/>
                                                    <dx:ListEditItem Text="5PH" Value="5PH"/>
                                                    <dx:ListEditItem Text="5HV" Value="5HV"/>
                                                    <dx:ListEditItem Text="5HG" Value="5HG"/>
                                                    <dx:ListEditItem Text="521" Value="521"/>
                                                    <dx:ListEditItem Text="531" Value="531"/>
                                                    <dx:ListEditItem Text="541" Value="541"/>
                                                </Items>

                                                <ClearButton Visibility="Auto"></ClearButton>
                                                 <ValidationSettings SetFocusOnError="True">
                                                    <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <%--Resa--%>
                                <dx:LayoutItem Caption="Resa / OT :">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxTextBox ID="txt_resa" runat="server" >
											                 <ValidationSettings SetFocusOnError="True">
                                                    <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                
                                <%--Reference--%>
                                <dx:LayoutGroup Caption="Référence article :" ColCount="2" RowSpan="2" Visible="false">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="True" FieldName="Reference" Name="txt_ref1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" >
                                                    <dx:ASPxTextBox ID="txt_ref1" runat="server" >
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Quantite" Name="txt_ref1Qte">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref1Qte" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Reference2" Name="txt_ref2">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref2" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Qte2" Name="txt_ref2Qte">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref2Qte" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Reference3" Name="txt_ref3">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref3" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Qte3" Name="txt_ref3Qte">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref3Qte" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Reference4" Name="txt_ref4">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref4" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Qte4" Name="txt_ref4Qte">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref4Qte" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Reference5" Name="txt_ref5">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref5" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Qte5" Name="txt_ref5Qte">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txt_ref5Qte" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Confirmation demandeur :">
                                    <Items>
                                        <dx:LayoutItem Caption="Avoir vérifié que l'OT ne comporte pas plus de 5 references ." RequiredMarkDisplayMode="Required">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxCheckBox ID="formLayout_E3" runat="server" CheckState="Unchecked" ValueUnchecked="">
                                                        <ValidationSettings SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                        </ValidationSettings>
                                                    </dx:ASPxCheckBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>



                                        <dx:LayoutItem Caption="Avoir vérifié au préalable l'ATP" RequiredMarkDisplayMode="Required" Visible="false">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                  <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" CheckState="Unchecked" ValueUnchecked="">
                                                        <ValidationSettings SetFocusOnError="True">
                                                            <RequiredField IsRequired="false" ErrorText="Champs Obligatoire !" />
                                                        </ValidationSettings>
                                                    </dx:ASPxCheckBox>                    
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>



                                        <dx:LayoutItem Caption="Avoir fait valider la réservation par l'ordonnanceur concerné (si le matériel et en code MAN ou LEX, merci de joindre l'accord de l'approvisionneur à cette fiche." RequiredMarkDisplayMode="Required" Visible="false">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" CheckState="Unchecked" ValueUnchecked="">
                                                        <ValidationSettings SetFocusOnError="True">
                                                            <RequiredField IsRequired="False" ErrorText="Champs Obligatoire !" />
                                                        </ValidationSettings>
                                                    </dx:ASPxCheckBox>                    
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>

                                        <dx:LayoutItem Caption="Piece jointe (OT) :" >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                 <asp:FileUpload ID="FileUpload1" runat="server" />                                               
                                  
                                                    

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>



                                    </Items>
                                </dx:LayoutGroup>
                            </Items>

                        </dx:LayoutGroup>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutItem HorizontalAlign="Right" ShowCaption="False" Width="150px">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxButton ID="updateButton" runat="server" OnClick="updateButton_Click" Text="Sauvegarder" Width="150px">
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>

        <dx:ASPxLabel runat="server" ID="errorMessageLabel" ForeColor="Red" EnableViewState="False" EncodeHtml="False" meta:resourcekey="errorMessageLabelResource1" />
        <dx:ASPxLabel runat="server" ID="lbl_numspeed" ForeColor="Red" EnableViewState="False" EncodeHtml="False" meta:resourcekey="lbl_numspeedResource1" />
        <dx:ASPxLabel runat="server" ID="lbl_user" Visible="False" ForeColor="Red" meta:resourcekey="lbl_userResource1" />
        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Resa Guichet" ShowFooter="True" meta:resourcekey="ASPxPopupControl1Resource1"></dx:ASPxPopupControl>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
            InsertCommand="INSERT INTO [T_GUICHET] 
        (  
            [Type_Demande],         
         [UserDemande],
         [SU_EOTP],
         [SU_Telephone],
         [Autre_PVL], 
         [Stock_Mag], 
         [Num_Resa],      
         [Reference],
           [Quantite],
            [Reference2]
           ,[Qte2]
           ,[Reference3]
           ,[Qte3]
           ,[Reference4]
           ,[Qte4]
           ,[Reference5]
           ,[Qte5]
         ,[File] 
            ,[Appareil]     
         ) 
         VALUES (
            @Type_Demande,
         @UserDemande,
         @SU_EOTP,
         @SU_Telephone,
         @Autre_PVL, 
         @Stock_Mag,
         @Num_Resa,      
         @Reference  ,
            @Quantite
            ,@Reference2
           ,@Qte2
           ,@Reference3
           ,@Qte3
           ,@Reference4
           ,@Qte4
           ,@Reference5
           ,@Qte5
            ,@Txt_File  
            ,@Txt_appareil        
             )
        SET @QuoteID = Scope_Identity();"
            OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [T_GUICHET]"
            OnInserted="SqlDataSource1_Inserted">

            <InsertParameters>
                <asp:Parameter Name="Autre_PVL" Type="String" />
                <asp:Parameter Name="Reference" Type="String" />
                <asp:Parameter Name="Quantite" Type="String" />
                <asp:Parameter Name="Stock_Mag" Type="String" />
                <asp:Parameter Name="SU_EOTP" Type="String" />
                <asp:Parameter Name="Type_Demande" Type="String" />
                <asp:Parameter Name="UserDemande" Type="String" />
                <asp:Parameter Name="SU_Telephone" Type="String" />
                <asp:Parameter Name="Num_Resa" Type="String" />
                <asp:Parameter Name="Txt_File" Type="String" />
                 <asp:Parameter Name="Txt_appareil" Type="String" />
                <asp:Parameter Name="QuoteID" Direction="Output" Type="Int32" />
                 <asp:Parameter Name="Reference2" Type="String" />
                <asp:Parameter Name="Reference3" Type="String" />
                <asp:Parameter Name="Reference4" Type="String" />
                <asp:Parameter Name="Reference5" Type="String" />
                <asp:Parameter Name="Qte2" Type="Int32" />
                <asp:Parameter Name="Qte3" Type="Int32" />
                <asp:Parameter Name="Qte4" Type="Int32" />
                <asp:Parameter Name="Qte5" Type="Int32" />
            </InsertParameters>

        </asp:SqlDataSource>


    </div>
</asp:Content>

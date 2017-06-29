<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DX_DAHERCMS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div style="background-color:aliceblue">
          <div style="background-color:bisque;float:left">
                                                        <dx:ASPxTextBox ID="txt_ot_poste" runat="server" >
                                                     <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>    
                                                    </div>
                                                     <div>
                                                <dx:ASPxTextBox ID="txt_ot_poste2" runat="server" >                                                   
                                                </dx:ASPxTextBox> 
                                                     </div>                                                    
                             
                                                    </div>
</asp:Content>

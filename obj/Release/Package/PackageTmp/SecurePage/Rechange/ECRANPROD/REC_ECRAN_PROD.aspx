<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="REC_ECRAN_PROD.aspx.cs" Inherits="DX_DAHERCMS.REC_ECRAN_PROD" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <style>
        .div-table {
            display: table;
            width: 100%;
            table-layout: fixed;
            margin-top: 50px;
            border: 2px solid;
        }

        .div-row {
            display: table-row;
            border: 2px solid;
        }

        .div-div {
            display: table-cell;
            /*border:1px solid;*/
            text-align: center;
            /*border-bottom:2px solid;*/
            border-right: 1px solid;
            border-left: 1px solid;
        }

        .circle1 {
            float: right;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            line-height: 50px;
            text-align: center;
            background: green;
        }
    </style>

      <div>
        <dx:ASPxLabel runat="server" Text="Ecran de pilotage"></dx:ASPxLabel> 
    </div>


    <div class="div-table">
        <%--/* Ligne des titres*/--%>
        <div class="div-row">
            <div class="div-div">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Status global" EnableTheming="True" Theme="Moderno" />
            </div>
            <div class="div-div">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="6h - 13h" EnableTheming="True" Theme="Moderno"></dx:ASPxLabel>
            </div>
            <div class="div-div">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="13h - 20h" EnableTheming="True" Theme="Moderno"></dx:ASPxLabel>
            </div>
        </div>
        <%--/*Lignes IMG*/--%>
        <div class="div-row">
            <div class="div-div" >
                <asp:Image ID="Smiley0" runat="server" ImageUrl="~/img/SmileyVert.png" Height="123px" Width="123px" />

            </div>
            <div class="div-div">
                <asp:Image ID="Smiley1" runat="server" ImageUrl="~/img/SmileyRouge.png" Height="123px" Width="123px" />

            </div>
            <div class="div-div">
                <asp:Image ID="Smiley2" runat="server" ImageUrl="~/img/SmileyVert.png" Height="123px" Width="123px" />

            </div>
        </div>
      <%--  /*Lignes des titres poste*/--%>
        <div class="div-row">
            <div class="div-div"></div>
            <div class="div-div">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Postes Realisés" EnableTheming="True" Theme="Moderno"></dx:ASPxLabel>

            </div>
            <div class="div-div">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Postes Realisés" EnableTheming="True" Theme="Moderno"></dx:ASPxLabel>
            </div>
        </div>
      <%--  /*lignes des valeur real*/--%>
        <div class="div-row">
            <div class="div-div"></div>
            <div class="div-div" style="border-bottom:1px solid">

                <dx:ASPxLabel runat="server" ID="Txt_Realise1" Font-Size="XX-Large"></dx:ASPxLabel>
                <asp:Label CssClass="circle1" ID="Ecart1" runat="server" Text="1234" EnableTheming="True" ForeColor="White" Theme="Moderno"></asp:Label>
            </div>
            <div class="div-div" style="border-bottom:1px solid">
                <dx:ASPxLabel runat="server" ID="Txt_Realise2" Font-Size="XX-Large"></dx:ASPxLabel>
                <asp:Label CssClass="circle1" ID="Ecart2" runat="server" Text="1234" EnableTheming="True" ForeColor="White" Theme="Moderno"></asp:Label>
            </div>
        </div>
      <%--  /*Ligne titres objecif*/--%>
        <div class="div-row">
            <div class="div-div"></div>
            <div class="div-div">
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Objectif Poste" EnableTheming="True" Theme="Moderno"></dx:ASPxLabel>
            </div>
            <div class="div-div">
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Objectif Poste" EnableTheming="True" Theme="Moderno"></dx:ASPxLabel>
            </div>
        </div>
<%--        /*Ligne valeur objectif*/--%>
        <div class="div-row">
            <div class="div-div"></div>
            <div class="div-div">
                <dx:ASPxLabel runat="server" ID="Txt_Objectif1" Text="0" Font-Size="XX-Large"></dx:ASPxLabel>
            </div>
            <div class="div-div">
                <dx:ASPxLabel runat="server" ID="Txt_Objectif2" Font-Size="XX-Large" Text="0"></dx:ASPxLabel>
            </div>
        </div>
<%--        /*ligne des radio button*/--%>
        <div class="div-row">
            <div class="div-div"></div>
            <div class="div-div">
                <dx:ASPxRadioButtonList ID="Param1" runat="server" RepeatColumns="7" AutoPostBack="True" BackColor="White" Theme="MetropolisBlue" TextWrap="False" CaptionSettings-ShowColon="False" OnValueChanged="Param1_ValueChanged">
                    <Items>
                        <dx:ListEditItem Value="6" />
                        <dx:ListEditItem Value="7" />
                        <dx:ListEditItem Value="8" />
                        <dx:ListEditItem Value="9" />
                        <dx:ListEditItem Value="10" />
                        <dx:ListEditItem Value="11" />
                        <dx:ListEditItem Value="12" />
                    </Items>
                </dx:ASPxRadioButtonList>
            </div>
            <div class="div-div">
                <dx:ASPxRadioButtonList ID="ASPxRadioButtonList2" runat="server" RepeatColumns="7" AutoPostBack="True" ForeColor="Black" BackColor="White" TextWrap="False">
                    <Items>
                        <dx:ListEditItem Value="6" />
                        <dx:ListEditItem Value="7" />
                        <dx:ListEditItem Value="8" />
                        <dx:ListEditItem Value="9" />
                        <dx:ListEditItem Value="10" />
                        <dx:ListEditItem Value="11" />
                        <dx:ListEditItem Value="12" />
                    </Items>
                </dx:ASPxRadioButtonList>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="DS_Realise1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT        COUNT(*) AS ObjectifGlobal
FROM            dbo.T_MACS_Suivi INNER JOIN
                         dbo.T_MACS_MATRICULE ON dbo.T_MACS_Suivi.Utilisateur = dbo.T_MACS_MATRICULE.XA_MATRICULE INNER JOIN
                         dbo.T_MACS_MVTD ON dbo.T_MACS_Suivi.Colonne15 = dbo.T_MACS_MVTD.MVTD
WHERE        (dbo.T_MACS_Suivi.Heure &lt;= CAST('13:59:59' AS datetime)) AND (dbo.T_MACS_Suivi.Heure &gt;= CAST('06:00:00' AS datetime)) AND (dbo.T_MACS_Suivi.Saisie_le = '19.12.2015')
GROUP BY dbo.T_MACS_Suivi.Saisie_le"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Objectif1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="IF DATEPART(HOUR, GETDATE()) &gt; 14 
BEGIN
SELECT [NB_LIGNE_OBJECTIF]FROM [T_MACS_OBJECTIF] WHERE ([NB_PERSONNE] = @Param1) AND (HEURE_OBJECTIF =7)
END
ELSE
SELECT [NB_LIGNE_OBJECTIF]FROM [T_MACS_OBJECTIF] WHERE ([NB_PERSONNE] = @Param1) AND (HEURE_OBJECTIF =14-DATEPART(HOUR, GETDATE()));">
        <SelectParameters>
            <asp:ControlParameter ControlID="Param1" DefaultValue="6" Name="Param1" PropertyName="Value" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Realise2" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT        COUNT(*) AS ObjectifGlobal
FROM            dbo.T_MACS_Suivi INNER JOIN
                         dbo.T_MACS_MATRICULE ON dbo.T_MACS_Suivi.Utilisateur = dbo.T_MACS_MATRICULE.XA_MATRICULE INNER JOIN
                         dbo.T_MACS_MVTD ON dbo.T_MACS_Suivi.Colonne15 = dbo.T_MACS_MVTD.MVTD
WHERE        (dbo.T_MACS_Suivi.Heure &lt;= CAST('20:00:00' AS datetime)) AND (dbo.T_MACS_Suivi.Heure &gt;= CAST('13:00:00' AS datetime)) AND (dbo.T_MACS_Suivi.Saisie_le = '19.12.2015')
GROUP BY dbo.T_MACS_Suivi.Saisie_le"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Objectif2" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="IF DATEPART(HOUR, GETDATE()) &gt; 14 
BEGIN
SELECT [NB_LIGNE_OBJECTIF]FROM [T_MACS_OBJECTIF] WHERE ([NB_PERSONNE] = @Param2) AND (HEURE_OBJECTIF =7)
END
ELSE
SELECT [NB_LIGNE_OBJECTIF]FROM [T_MACS_OBJECTIF] WHERE ([NB_PERSONNE] = @Param2) AND (HEURE_OBJECTIF =20-DATEPART(HOUR, GETDATE()));">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxRadioButtonList2" DefaultValue="6" Name="Param2" PropertyName="Value" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>


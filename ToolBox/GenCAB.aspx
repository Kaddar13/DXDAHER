<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenCAB.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.GenCAB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div style="height: 84px; width: 1257px">
     <asp:Label runat="server" Text="Ref. à code-barrer :" /> 
         <asp:TextBox ID="ctrl_Clayette" runat="server"></asp:TextBox>
        <asp:TextBox ID="ctrl_provenance" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="ctrl_destination" runat="server" Visible="false"></asp:TextBox>
         <asp:TextBox ID="ctrl_traite" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="ctrl_urgence" runat="server" Visible="false"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Generer"  OnClick="Button1_Click"  Width="133px" />
                  
        </div>
  
        <asp:Panel runat="server" id="pnlContents" HorizontalAlign="Center"  >
                 <table style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <telerik:RadBarcode ID="RadBarcode2" runat="server" Font-Size="16px" Height="120px" ShowChecksum="False" Style="margin-left: 30px; text-align: center;" Text="BarCode" Width="300px">
                        </telerik:RadBarcode>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <br class="qsf-clear-float" />
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID%>");
            var printWindow = window.open('', '', 'height=800,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 800);
            return false;
        }
    </script>
</asp:Content>

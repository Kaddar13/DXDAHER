<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnhancedCreateUserWizard.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Admin.Membership.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Create a New User Account (and a Record in <code>UserProfiles</code>)</h2>
    <p>
        This CreateUserWizard control not only adds the new user account to the
        Membership framework, but also adds a corresponding record to the
        <code>UserProfiles</code> table.
    </p>
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>

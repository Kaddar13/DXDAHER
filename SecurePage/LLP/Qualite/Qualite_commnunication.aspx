<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Qualite_commnunication.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Qualite_commnunication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function OnInitEdit(s, e) {
           <%-- s, e
            var User = '<%=@HttpContext.Current.User.Identity.Name%>';
            var now = new Date();


            alert(User);
            GridView.SetEditValue("User", User);
            GridView.SetEditValue("Date", now);--%>





        }
    </script>

    <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="GridView" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="ID" 
        OnInitNewRow="ASPxGridView1_InitNewRow" 
        OnBeforePerformDataSelect="Grid_DataSelect"
      
        
        KeyboardSupport="True" OnStartRowEditing="ASPxGridView1_StartRowEditing" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" >
        <ClientSideEvents  />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" />
        <SettingsDataSecurity AllowDelete="False" />
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewLayoutGroup ColSpan="2" Caption="NC  Declaration">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="Part_from" Caption="Part from">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Date">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="DN_number" Caption="DN number">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="GE_number" Caption="GE number">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="PN">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Qte" Caption="Qty">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Defect">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Comment">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="User">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:GridViewLayoutGroup Caption="Answer" ColSpan="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="Answer">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Returned">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="User_answer">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Date_answer">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:GridViewLayoutGroup Caption="Tracking for return if applicable" ColSpan="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem Caption="DN return" ColumnName="DN_return">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Date return" ColumnName="Date_return">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="3">
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
            <dx:GridViewDataTextColumn FieldName="DN_number" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GE_number" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PN" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Qte" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comment" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Answer" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date_return" VisibleIndex="12">
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
            <dx:GridViewDataTextColumn FieldName="DN_return" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="User" VisibleIndex="14" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Part_from" VisibleIndex="2">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="Marignane" Value="Marignane" />
                        <dx:ListEditItem Text="Donauwörth" Value="Donauwörth" />
                        <dx:ListEditItem Text="Albacete" Value="Albacete" />
                        <dx:ListEditItem Text="Querétaro" Value="Querétaro" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Defect" VisibleIndex="8">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="Extra part recieved" Value="Extra part recieved" />
                        <dx:ListEditItem Text="PO/Order is wrong" Value="PO/Order is wrong" />
                        <dx:ListEditItem Text="Missing Parts" Value="Missing Parts" />
                        <dx:ListEditItem Text="Wrong part (A instead of B)" Value="Wrong part (A instead of B)" />
                        <dx:ListEditItem Text="Other (indicate in &quot;comments&quot; the defect)" Value="Other (indicate in &quot;comments&quot; the defect)" />
                        <dx:ListEditItem Text="Parts send by mistake (wrong delivery)" Value="Parts send by mistake (wrong delivery)" />
                        <dx:ListEditItem Text="Missing Document (DN)" Value="Missing Document (DN)" />
                        <dx:ListEditItem Text="Missing Document (CoC)" Value="Missing Document (CoC)" />
                        <dx:ListEditItem Text="Missing Document (other indicate in &quot;comments&quot; the  document)" Value="Missing Document (other indicate in &quot;comments&quot; the  document)" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Returned" VisibleIndex="11">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="Yes" Value="Yes" />
                        <dx:ListEditItem Text="No" Value="No" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="User_answer" ReadOnly="True" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date_answer" VisibleIndex="16">
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
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" DeleteCommand="DELETE FROM [T_Qualite_Communication] WHERE [ID] = @original_ID AND (([Part_from] = @original_Part_from) OR ([Part_from] IS NULL AND @original_Part_from IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([DN_number] = @original_DN_number) OR ([DN_number] IS NULL AND @original_DN_number IS NULL)) AND (([GE_number] = @original_GE_number) OR ([GE_number] IS NULL AND @original_GE_number IS NULL)) AND (([PN] = @original_PN) OR ([PN] IS NULL AND @original_PN IS NULL)) AND (([Qte] = @original_Qte) OR ([Qte] IS NULL AND @original_Qte IS NULL)) AND (([Defect] = @original_Defect) OR ([Defect] IS NULL AND @original_Defect IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL)) AND (([Answer] = @original_Answer) OR ([Answer] IS NULL AND @original_Answer IS NULL)) AND (([Returned] = @original_Returned) OR ([Returned] IS NULL AND @original_Returned IS NULL)) AND (([Date_return] = @original_Date_return) OR ([Date_return] IS NULL AND @original_Date_return IS NULL)) AND (([DN_return] = @original_DN_return) OR ([DN_return] IS NULL AND @original_DN_return IS NULL)) AND (([User] = @original_User) OR ([User] IS NULL AND @original_User IS NULL)) AND (([User_answer] = @original_User_answer) OR ([User_answer] IS NULL AND @original_User_answer IS NULL)) AND (([Date_answer] = @original_Date_answer) OR ([Date_answer] IS NULL AND @original_Date_answer IS NULL))" InsertCommand="INSERT INTO [T_Qualite_Communication] ([Part_from], [Date], [DN_number], [GE_number], [PN], [Qte], [Defect], [Comment], [Answer], [Returned], [Date_return], [DN_return], [User], [User_answer], [Date_answer]) VALUES (@Part_from, @Date, @DN_number, @GE_number, @PN, @Qte, @Defect, @Comment, @Answer, @Returned, @Date_return, @DN_return, @User, @User_answer, @Date_answer)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_Qualite_Communication]" UpdateCommand="UPDATE [T_Qualite_Communication] SET [Part_from] = @Part_from, [Date] = @Date, [DN_number] = @DN_number, [GE_number] = @GE_number, [PN] = @PN, [Qte] = @Qte, [Defect] = @Defect, [Comment] = @Comment, [Answer] = @Answer, [Returned] = @Returned, [Date_return] = @Date_return, [DN_return] = @DN_return, [User] = @User, [User_answer] = @User_answer, [Date_answer] = @Date_answer WHERE [ID] = @original_ID AND (([Part_from] = @original_Part_from) OR ([Part_from] IS NULL AND @original_Part_from IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([DN_number] = @original_DN_number) OR ([DN_number] IS NULL AND @original_DN_number IS NULL)) AND (([GE_number] = @original_GE_number) OR ([GE_number] IS NULL AND @original_GE_number IS NULL)) AND (([PN] = @original_PN) OR ([PN] IS NULL AND @original_PN IS NULL)) AND (([Qte] = @original_Qte) OR ([Qte] IS NULL AND @original_Qte IS NULL)) AND (([Defect] = @original_Defect) OR ([Defect] IS NULL AND @original_Defect IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL)) AND (([Answer] = @original_Answer) OR ([Answer] IS NULL AND @original_Answer IS NULL)) AND (([Returned] = @original_Returned) OR ([Returned] IS NULL AND @original_Returned IS NULL)) AND (([Date_return] = @original_Date_return) OR ([Date_return] IS NULL AND @original_Date_return IS NULL)) AND (([DN_return] = @original_DN_return) OR ([DN_return] IS NULL AND @original_DN_return IS NULL)) AND (([User] = @original_User) OR ([User] IS NULL AND @original_User IS NULL)) AND (([User_answer] = @original_User_answer) OR ([User_answer] IS NULL AND @original_User_answer IS NULL)) AND (([Date_answer] = @original_Date_answer) OR ([Date_answer] IS NULL AND @original_Date_answer IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Part_from" Type="String" />
            <asp:Parameter Name="original_Date" Type="DateTime" />
            <asp:Parameter Name="original_DN_number" Type="String" />
            <asp:Parameter Name="original_GE_number" Type="String" />
            <asp:Parameter Name="original_PN" Type="String" />
            <asp:Parameter Name="original_Qte" Type="Int32" />
            <asp:Parameter Name="original_Defect" Type="String" />
            <asp:Parameter Name="original_Comment" Type="String" />
            <asp:Parameter Name="original_Answer" Type="String" />
            <asp:Parameter Name="original_Returned" Type="String" />
            <asp:Parameter Name="original_Date_return" Type="DateTime" />
            <asp:Parameter Name="original_DN_return" Type="String" />
            <asp:Parameter Name="original_User" Type="String" />
            <asp:Parameter Name="original_User_answer" Type="String" />
            <asp:Parameter Name="original_Date_answer" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Part_from" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="DN_number" Type="String" />
            <asp:Parameter Name="GE_number" Type="String" />
            <asp:Parameter Name="PN" Type="String" />
            <asp:Parameter Name="Qte" Type="Int32" />
            <asp:Parameter Name="Defect" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="Returned" Type="String" />
            <asp:Parameter Name="Date_return" Type="DateTime" />
            <asp:Parameter Name="DN_return" Type="String" />
            <asp:Parameter Name="User" Type="String" />
            <asp:Parameter Name="User_answer" Type="String" />
            <asp:Parameter Name="Date_answer" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Part_from" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="DN_number" Type="String" />
            <asp:Parameter Name="GE_number" Type="String" />
            <asp:Parameter Name="PN" Type="String" />
            <asp:Parameter Name="Qte" Type="Int32" />
            <asp:Parameter Name="Defect" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="Returned" Type="String" />
            <asp:Parameter Name="Date_return" Type="DateTime" />
            <asp:Parameter Name="DN_return" Type="String" />
            <asp:Parameter Name="User" Type="String" />
            <asp:Parameter Name="User_answer" Type="String" />
            <asp:Parameter Name="Date_answer" Type="DateTime" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Part_from" Type="String" />
            <asp:Parameter Name="original_Date" Type="DateTime" />
            <asp:Parameter Name="original_DN_number" Type="String" />
            <asp:Parameter Name="original_GE_number" Type="String" />
            <asp:Parameter Name="original_PN" Type="String" />
            <asp:Parameter Name="original_Qte" Type="Int32" />
            <asp:Parameter Name="original_Defect" Type="String" />
            <asp:Parameter Name="original_Comment" Type="String" />
            <asp:Parameter Name="original_Answer" Type="String" />
            <asp:Parameter Name="original_Returned" Type="String" />
            <asp:Parameter Name="original_Date_return" Type="DateTime" />
            <asp:Parameter Name="original_DN_return" Type="String" />
            <asp:Parameter Name="original_User" Type="String" />
            <asp:Parameter Name="original_User_answer" Type="String" />
            <asp:Parameter Name="original_Date_answer" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GameOver.aspx.cs" Inherits="SwordSurvival.GameOver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script>
            var intro = new Howl({
                src: ['Audio/GameOver.wav'],
                loop: true
            }).play();

            var startSound = new Howl({
                src: ['Audio/hit.wav']
            });

            function PlayStart() {
                startSound.play();
            }

        </script>
    </telerik:RadCodeBlock>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <asp:Panel ID="pnlGameOver" runat="server" CssClass="StartPageWrapper">

        <label class="GameTitle">Game Over</label>

        <asp:Panel ID="pnlPlayerName" runat="server" CssClass="PlayerName">

            <telerik:RadTextBox 
                ID="txtPlayerName" 
                runat="server" 
                EmptyMessage="Enter Your Name"
                CssClass="StartButton"
                Skin="Glow"
                Height="42px">
            </telerik:RadTextBox>
            &nbsp&nbsp
            <telerik:RadButton 
                ID="btnSubmitName" 
                runat="server" 
                Text="Submit" 
                Skin="Glow"
                CssClass="StartButton"               
                Font-Size="X-Large" 
                BorderStyle="Groove" 
                OnClick="btnSubmitName_Click"
                OnClientMouseOver="PlayStart">
            </telerik:RadButton>

        </asp:Panel>

    </asp:Panel>

    <asp:Panel ID="pnlHighScores" runat="server" Visible="false" CssClass="HighScoreWrapper">

        <label class="HighScoresLabel">Hall Of Heroes</label>

        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">

            <telerik:RadGrid 
                ID="grdScores" 
                runat="server" 
                DataSourceID="XmlScores" 
                Skin="Glow"  
                AllowPaging="True" 
                PageSize="10" 
                OnItemCommand="grdScores_ItemCommand"
                OnItemDataBound="grdScores_ItemDataBound"
                OnPageIndexChanged="grdScores_PageIndexChanged">

                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <SortingSettings EnableSkinSortStyles="False" />

                <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                    <Selecting AllowRowSelect="True"/>
                </ClientSettings>

                <MasterTableView AutoGenerateColumns="False" DataSourceID="XmlScores">
                    <SortExpressions>
                      <telerik:GridSortExpression FieldName="levelReached" SortOrder="Descending" />
                    </SortExpressions>
                    <Columns>

                        <telerik:GridBoundColumn 
                            DataField="id" 
                            FilterControlAltText="Filter name column" 
                            HeaderText="" 
                            SortExpression="id" 
                            UniqueName="id"
                            Display="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="">
                            <ItemTemplate>
                              <asp:Label ID="numberLabel" runat="server" />
                            </ItemTemplate>                          
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn 
                            DataField="name" 
                            FilterControlAltText="Filter name column" 
                            HeaderText="Name" 
                            SortExpression="name" 
                            UniqueName="name">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn 
                            DataField="class" 
                            FilterControlAltText="Filter class column" 
                            HeaderText="Class" 
                            SortExpression="class" 
                            UniqueName="class">
                        </telerik:GridBoundColumn>

                        <telerik:GridNumericColumn 
                            DataField="monstersSlain" 
                            FilterControlAltText="Filter monstersSlain column" 
                            HeaderText="Monsters Slain" 
                            SortExpression="monstersSlain" 
                            UniqueName="monstersSlain" 
                            DataType="System.Int32">
                        </telerik:GridNumericColumn >

                        <telerik:GridBoundColumn 
                            DataField="levelReached" 
                            FilterControlAltText="Filter levelReached column" 
                            HeaderText="Level Reached" 
                            SortExpression="levelReached" 
                            UniqueName="levelReached">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn 
                            DataField="date" 
                            FilterControlAltText="Filter date column" 
                            HeaderText="Date" 
                            SortExpression="date" 
                            UniqueName="date">
                        </telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>


        </telerik:RadAjaxPanel>
        

        <asp:Panel ID="pnlEndGameBtns" runat="server" CssClass="EndGameButtons">

            <telerik:RadLinkButton 
                ID="btnPlayAgain" 
                runat="server"
                Text="Play Again" 
                NavigateUrl="ClassSelection.aspx" 
                Skin="Glow" 
                Font-Size="X-Large" 
                BorderStyle="Groove"
                OnClientMouseOver="PlayStart">
            </telerik:RadLinkButton>
            &nbsp &nbsp

            <telerik:RadLinkButton 
                ID="btnQuit" 
                runat="server"
                Text="Quit" 
                NavigateUrl="TitlePage.aspx" 
                Skin="Glow"                
                Font-Size="X-Large" 
                BorderStyle="Groove"
                OnClientMouseOver="PlayStart">
            </telerik:RadLinkButton>

        </asp:Panel>

    </asp:Panel>

    <asp:XmlDataSource ID="XmlScores" runat="server" DataFile="~/Scores.xml"></asp:XmlDataSource>

</asp:Content>

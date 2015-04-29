<%@ Page Title="Home Page" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="GeracaoCompleto.aspx.cs" Inherits="_GeracaoCompleto" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>GERAÇÃO</h1>
                <h2>&nbsp;Visão Completa</h2>
            </hgroup>
            <nav>
                <ul id="menu0">
                    <li>Trocar para <a href="GeracaoResumo">Visão Resumida</a></li>
                </ul>
            </nav>
        </div>
    </section>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
    <script type="text/javascript">

       
        $(document).ready(function () {
          
            $("#botaoPesquisa").click(function () {
              
                $.ajax({
                    type: "POST",
                    contentType: "application/string; charset=utf-8",
                    data: "{ texto: '" + $('#textoPesquisa').val() + "'}",
                    url: "Contact.aspx",
                    dataType: "json",
                    success: function (data) {
                        alert(data);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                   
                });;

            });
            
        
                
            });

      

       
         
    </script>
    <div class="jumbotron">
       
        <!--<input type="text" ID="textoPesquisa"/>-->
        <asp:TextBox  runat="server" ID="textoPesquisa"/>
        <asp:Button  runat="server" ID="botaoPesquisa_Acao" OnClick="botaoPesquisa_Acao_Click" Text="Pesquisar" />
      <!--  <input type="button" ID="botaoPesquisa" />-->
       
    </div>

    <div class="row">
        <div class="col-md-4">

     
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="600px"  EnableViewState="False" DataKeyNames="Código" HorizontalAlign="Center" PageSize="20">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Código" HeaderText="Código" SortExpression="Código" InsertVisible="False" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" >
                        </asp:BoundField>
                        <asp:BoundField DataField="CEG" HeaderText="CEG" SortExpression="CEG" />
                        <asp:BoundField DataField="USINA" HeaderText="USINA" SortExpression="USINA" />
                        <asp:BoundField DataField="POTOUTORGADA" HeaderText="POT(Out.)" SortExpression="POTOUTORGADA" />
                        <asp:BoundField DataField="POTFISCALIZADA" HeaderText="POT(FISC)" SortExpression="POTFISCALIZADA" />
                        <asp:BoundField DataField="DESTINOENERGIA" HeaderText="DESTINOENERGIA" SortExpression="DESTINOENERGIA" />
                        <asp:BoundField DataField="PROPRIETARIO" HeaderText="PROPRIETARIO" SortExpression="PROPRIETARIO" />
                        <asp:BoundField DataField="MUNICIPIO" HeaderText="MUNICIPIO" SortExpression="MUNICIPIO" />
                        <asp:BoundField DataField="RIO" HeaderText="RIO" SortExpression="RIO" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
        </div>
        <div class="col-md-4">
                <asp:SqlDataSource  ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [Código], [TIPO], [CEG], [USINA], [POTOUTORGADA], [POTFISCALIZADA], [DESTINOENERGIA], [PROPRIETARIO], [MUNICIPIO], [RIO] FROM [Tab_Geradoras] WHERE ([PROPRIETARIO] LIKE '%' + ? + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="textoPesquisa" Name="PROPRIETARIO" PropertyName="Text" Type="String" />
                    </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</asp:Content>
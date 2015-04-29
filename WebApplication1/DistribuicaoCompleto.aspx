<%@ Page Title="Home Page" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="DistribuicaoCompleto.aspx.cs" Inherits="_DistribuicaoCompleto" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>DISTRIBUIÇÃO</h1>
                <h2>&nbsp;Visão Completa</h2>
            </hgroup>
            <nav>
                <ul id="menu0">
                    <li>Trocar para <a href="DistribuicaoResumo">Visão Resumida</a></li>
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
       
    
        <asp:TextBox  runat="server" ID="textoPesquisa"/>
        <asp:Button  runat="server" ID="botaoPesquisa_Acao" OnClick="botaoPesquisa_Acao_Click" Text="Pesquisar" />
    
       
    </div>

    <div class="row">
        <div class="col-md-4">

     
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="600px"  EnableViewState="False" DataKeyNames="CODIGO_INTERNO" HorizontalAlign="Center" PageSize="20">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="CODIGO_ANEEL" HeaderText="CÓD." SortExpression="CODIGO_ANEEL" />
                        <asp:BoundField DataField="CONJUNTO" HeaderText="CONJUNTO" SortExpression="CONJUNTO" >
                        </asp:BoundField>
                        <asp:BoundField DataField="EMPRESA" HeaderText="EMPRESA" SortExpression="EMPRESA" >
                        </asp:BoundField>
                        <asp:BoundField DataField="CODIGO_INTERNO" HeaderText="CODIGO_INTERNO" SortExpression="CODIGO_INTERNO" InsertVisible="False" ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="Consumidores" HeaderText="CONSUMIDORES" SortExpression="Consumidores" />
                        <asp:BoundField DataField="DEC_APURADO" HeaderText="DEC_APURADO" SortExpression="DEC_APURADO" />
                        <asp:BoundField DataField="DEC_LIMITE" HeaderText="DEC_LIMITE" SortExpression="DEC_LIMITE" />
                        <asp:BoundField DataField="FEC_APURADO" HeaderText="FEC_APURADO" SortExpression="FEC_APURADO" />
                        <asp:BoundField DataField="FEC_LIMITE" HeaderText="FEC_LIMITE" SortExpression="FEC_LIMITE" />
                        <asp:BoundField DataField="ANO" HeaderText="ANO" SortExpression="ANO" />
                        <asp:BoundField DataField="REGIAO" HeaderText="REGIAO" SortExpression="REGIAO" />
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
                <asp:SqlDataSource  ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [EMPRESA], [CONJUNTO], [CODIGO_INTERNO], [CODIGO_ANEEL], [Consumidores], [DEC_APURADO], [DEC_LIMITE], [FEC_APURADO], [FEC_LIMITE], [ANO], [REGIAO] FROM [Tab_Distribuidoras] WHERE ([EMPRESA] LIKE '%' + ? + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="textoPesquisa" Name="EMPRESA" PropertyName="Text" Type="String" />
                    </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</asp:Content>
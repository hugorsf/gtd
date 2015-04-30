<%@ Page Title="Home Page" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>GTD</h1>
                <h2>Cadastro de Concessionárias e Permissionárias do Setor Elétrico </h2>
            </hgroup>
            <p>
                Produtoras, Transmissoras e Distribuidoras</p>
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
        <h1></h1>
       
        <!--<input type="text" ID="textoPesquisa"/>
        <asp:TextBox  runat="server" ID="textoPesquisa"/>
        <asp:Button  runat="server" ID="botaoPesquisa_Acao" OnClick="botaoPesquisa_Acao_Click" Text="Pesquisar" />
       <input type="button" ID="botaoPesquisa" />-->
       
    </div>

    <div class="row">
        <div class="col-md-4">

     
           <!--     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="765px"  EnableViewState="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="PROPRIETARIO" HeaderText="PROPRIETARIO" SortExpression="PROPRIETARIO" >
                        </asp:BoundField>
                        <asp:BoundField DataField="USINAS" HeaderText="USINAS" SortExpression="USINAS" >
                        </asp:BoundField>
                        <asp:BoundField DataField="POT_OUTORGADA" HeaderText="POT_OUTORGADA" SortExpression="POT_OUTORGADA" />
                        <asp:BoundField DataField="POT_FISCALIZADA" HeaderText="POT_FISCALIZADA" SortExpression="POT_FISCALIZADA" />
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
                </asp:GridView>-->
        </div>
        <div class="col-md-4">
                <asp:SqlDataSource  ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [PROPRIETARIO], [USINAS], [POT_OUTORGADA], [POT_FISCALIZADA] FROM [Consulta_Proprietario_Usinas] WHERE ([PROPRIETARIO] LIKE '%' + ? + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="textoPesquisa" Name="PROPRIETARIO" PropertyName="Text" Type="String" />
                    </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</asp:Content>
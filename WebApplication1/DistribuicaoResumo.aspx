<%@ Page Title="Home Page" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="DistribuicaoResumo.aspx.cs" Inherits="_DistribuicaoResumo"  EnableSessionState="True"%>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>DISTRIBUIÇÃO <span class="auto-style1">Visão Resumida </span> </h1> </hgroup>
            
            <nav>
                <ul id="menu0">
                    <li>Trocar para <a href="DistribuicaoCompleto">Visão Completa</a> </li>
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
       
      <!--  <input   type="button" ID="botao10" Value="10" /> -->
       
    </div>

    <div class="row">
        <div class="col-md-4">

     
                <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="765px"  EnableViewState="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="EMPRESA" HeaderText="EMPRESA" SortExpression="EMPRESA" >
                        </asp:BoundField>
                        <asp:BoundField DataField="CONJUNTOS" HeaderText="CONJUNTOS" SortExpression="CONJUNTOS" >
                        </asp:BoundField>
                        <asp:BoundField DataField="CONSUMIDORES" HeaderText="CONSUMIDORES" SortExpression="CONSUMIDORES" />
                        <asp:BoundField DataField="Média_DEC" HeaderText="Média_DEC" SortExpression="Média_DEC" ReadOnly="True" />
                        <asp:BoundField DataField="MédiaDEC_LIM" HeaderText="MédiaDEC_LIM" ReadOnly="True" SortExpression="MédiaDEC_LIM" />
                        <asp:BoundField DataField="Média_FEC" HeaderText="Média_FEC" ReadOnly="True" SortExpression="Média_FEC" />
                        <asp:BoundField DataField="MédiaFEC_LIM" HeaderText="MédiaFEC_LIM" ReadOnly="True" SortExpression="MédiaFEC_LIM" />
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
                <asp:SqlDataSource  ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [EMPRESA], [CONJUNTOS], [Média_DEC], [CONSUMIDORES], [MédiaDEC_LIM], [Média_FEC], [MédiaFEC_LIM] FROM [Tab_Distribuidoras Consulta] WHERE ([EMPRESA] LIKE '%' + ? + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="textoPesquisa" Name="EMPRESA" PropertyName="Text" Type="String" />
                    </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            font-weight: normal;
        }
    </style>
</asp:Content>

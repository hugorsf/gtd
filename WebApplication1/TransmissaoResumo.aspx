<%@ Page Title="Home Page" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="TransmissaoResumo.aspx.cs" Inherits="_TransmissaoResumo"  EnableSessionState="True"%>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>TRANSMISSÃO<span class="auto-style1"> </span> </h1> 
                <h2> &nbsp;</h2>
            </hgroup>
            
            <nav>
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
      <!--  <input type="button" ID="botaoPesquisa" />-->
       
      <!--  <input   type="button" ID="botao10" Value="10" /> -->
       
    </div>

    <div class="row">
        <div class="col-md-4">

     
                PÁGINA NÃO DISPONÍVEL</div>
        <div class="col-md-4">
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _DistribuicaoResumo : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //GridView1.PageSize = Convert.ToInt32(Session["QuantidadeItens"]);
        //if (Session["QuantidadeItens"] != null) {
        // //   GridView1.PageSize = 10;
        //   switch (Convert.ToInt32(Session["QuantidadeItens"])){
        //       case 2: { GridView1.PageSize = 2; } break;
        //       case 20: { GridView1.PageSize = 20; } break;
        //       case 30: { GridView1.PageSize = 30; } break;
        //    }
    }
    protected void botaoPesquisa_Acao_Click(object sender, EventArgs e)
    {

    }

    protected void botao10_Click(object sender, EventArgs e)
    {
        //        GridView1.PageSize = 10;
        //  Session["QuantidadeItens"] = 10;
    }

    protected void botao10_Click1(object sender, EventArgs e)
    {
    }
}
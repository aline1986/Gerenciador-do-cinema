<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActionCadastroSessao.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.ActionCadastroSessao" %>

<form id="form1" runat="server">
        <div>
                <%@Import Namespace="System.Data"  %>
                <%@Import Namespace="System.Data.SqlClient"  %>
                <%@Import Namespace="System.Configuration"  %>  
                <%@Import Namespace="Projeto.Entidades" %>
                <%@Import Namespace="System.IO"  %>
               

                        <% /// Assemblies Para Entidades e Conexao com a Base %>
            <%  
                try
                {

                    Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();
                    gs.Data = Convert.ToDateTime(Request.Form["Data"]);
                    gs.Horario_de_inicio = Convert.ToInt32(Request.Form["Horario_de_inicio"]);
                    gs.Duracao = Convert.ToInt32(Request.Form["Duracao"]);
                    gs.Horario_de_fim = 0;
                    gs.Horario_de_fim += gs.Horario_de_inicio + gs.Duracao;
                    gs.Duracao_Minuto = Convert.ToInt32(Request.Form["DuracaoMinuto"]);
                    gs.Duracao_Segundo = Convert.ToInt32(Request.Form["DuracaoSegundo"]);
                    gs.Horario_de_inicio_Minuto = Convert.ToInt32(Request.Form["Horario_de_inicio_Minuto"]);
                    gs.Horario_de_fim_Minuto = 0;
                    gs.Horario_de_fim_Minuto += gs.Horario_de_inicio_Minuto + gs.Duracao_Minuto;
                    if(gs.Horario_de_fim_Minuto > 59)
                    {
                        gs.Horario_de_fim += 1;
                        if(gs.Horario_de_fim > 23)
                        {
                            gs.Horario_de_fim = 0;
                        }
                    }
                    gs.Horario_de_Inicio_Segundo = Convert.ToInt32(Request.Form["Horario_de_inicio_Segundo"]);
                    gs.Horario_de_fim_Segundo = 0;
                    gs.Duracao_Segundo = Convert.ToInt32(Request.Form["DuracaoSegundo"]);
                    gs.Horario_de_fim_Segundo += gs.Horario_de_Inicio_Segundo + gs.Duracao_Segundo;
                    if(gs.Horario_de_fim_Segundo > 59)
                    {
                        gs.Horario_de_fim_Minuto += 1;
                        if(gs.Horario_de_fim_Minuto > 59)
                        {
                            gs.Horario_de_fim_Minuto = 0;
                            gs.Horario_de_fim += 1;
                            if(gs.Horario_de_fim > 23)
                            {
                                gs.Horario_de_fim = 0;
                            }
                        }
                    }
                    gs.Valor_do_ingresso = Convert.ToDouble(Request.Form["Valor_do_Ingresso"]);
                    gs.Valor_do_ingresso_centavos = Convert.ToDouble(Request.Form["Valor_do_Ingresso_centavos"]);
                    gs.Tipo_de_animacao = Request.Form["Tipo_de_animacao"];
                    gs.Tipo_de_audio = Request.Form["Tipo_de_audio"];
                    gs.Id_filme = Convert.ToInt32(Request.Form["Id_Filme"]);
                    gs.Id_sala = Convert.ToInt32(Request.Form["Id_Sala"]);


                    SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con2.Open();

                    SqlCommand com2 = new SqlCommand("Select * From VW_Sessao_Filme_Sala", con2);
                    SqlDataReader dr = com2.ExecuteReader();
                    /// Conversa com a base

                    while(dr.Read())
                    {
                        VW_Sessao_Filme_Sala vwsfs = new VW_Sessao_Filme_Sala();
                        vwsfs.Id_Filme = Convert.ToInt32(dr["IdFilme"]);
                        vwsfs.Id_Sala = Convert.ToInt32(dr["IdSala"]);
                        vwsfs.DiaFilme = Convert.ToDateTime(dr["DiaFilme"]);
                        vwsfs.HorarioInicioFilme = Convert.ToInt32(dr["HorarioInicioFilme"]);
                        vwsfs.Horario_de_inicio_Minuto = Convert.ToInt32(dr["HorarioInicioMinutoSessao"]);
                        vwsfs.Horario_de_inicio_Segundo = Convert.ToInt32(dr["HorarioInicioSegundoSessao"]);
                        vwsfs.HorarioFimFilme = Convert.ToInt32(dr["HorarioInicioMinutoSessao"]) + Convert.ToInt32(dr["DuracaoFilme"]); 
                        vwsfs.HorarioFimFilmeMinuto = Convert.ToInt32(dr["HorarioInicioMinutoSessao"]) + Convert.ToInt32(dr["DuracaoMinutoFilme"]);
                        vwsfs.HorarioFimFilmeSegundo = Convert.ToInt32(dr["HorarioInicioSegundoSessao"]) + Convert.ToInt32(dr["DuracaoSegundoFilme"]);

                        if(gs.Id_filme == vwsfs.Id_Filme 
                            && gs.Id_sala == vwsfs.Id_Sala
                            && gs.Data == vwsfs.DiaFilme
                            && (gs.Horario_de_inicio == vwsfs.HorarioInicioFilme 
                            || gs.Horario_de_fim == vwsfs.HorarioInicioFilme)
                            && (gs.Horario_de_fim == vwsfs.HorarioInicioFilme
                            || gs.Horario_de_fim == vwsfs.HorarioFimFilme)
                            && (gs.Horario_de_inicio_Minuto == vwsfs.Horario_de_inicio_Minuto
                            || gs.Horario_de_inicio_Minuto == vwsfs.HorarioFimFilmeMinuto)
                            && (gs.Horario_de_Inicio_Segundo ==  vwsfs.Horario_de_inicio_Segundo
                            || gs.Horario_de_Inicio_Segundo == vwsfs.HorarioFimFilmeSegundo)
                            && (gs.Horario_de_fim_Minuto == vwsfs.HorarioFimFilmeMinuto 
                            || gs.Horario_de_fim_Minuto == vwsfs.Horario_de_inicio_Minuto)
                            && (gs.Horario_de_fim_Segundo == vwsfs.HorarioFimFilmeSegundo
                            || gs.Horario_de_fim_Segundo == vwsfs.HorarioFimFilmeSegundo))
                        { %>
            <script>
                window.location.href = "../Home/CadastroErroSessao";
            </script>
                       <% }
                    }

                    con2.Close();

                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base





                    SqlCommand com = new SqlCommand("Insert Into Gerenciamento_de_sessoes (Data, Horario_de_inicio," +
                            " Valor_do_ingresso_reais,Valor_do_Ingresso_centavos, Tipo_de_animacao, Tipo_de_audio, Id_Filme, Id_Sala," +
                            " Horario_de_inicio_Minuto, Horario_de_inicio_Segundo) " +
                            "Values('" + gs.Data.ToString("yyyy-MM-dd") + "', " + gs.Horario_de_inicio + ", " +
                            gs.Valor_do_ingresso + ", " + gs.Valor_do_ingresso_centavos +  " ,'" + gs.Tipo_de_animacao + "', '" + gs.Tipo_de_audio + "', " +
                            gs.Id_filme + ", " + gs.Id_sala + ", " + gs.Horario_de_inicio_Minuto + ", " +
                            "" + gs.Horario_de_Inicio_Segundo + ")", con);
                    com.ExecuteReader();
                    /// Conversa com a base
                    %>
            
                    
                    
                                
              <script>
                window.location.href = "../Home/CadastroSucessoSessao";
            </script>
            <%
                    
        con.Close();
                    /// Fecha a Conexao
                }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
         <script>
                window.location.href = "../Home/CadastroErroSessao";
            </script>
            <%: e.Message %>

                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    
    </form>

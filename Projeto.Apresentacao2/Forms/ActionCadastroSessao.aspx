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
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();
                    gs.Data = Convert.ToDateTime(Request.Form["Data"]);
                    gs.Horario_de_inicio = Convert.ToInt32(Request.Form["Horario_de_inicio"]);
                    gs.Duracao = Convert.ToInt32(Request.Form["Duracao"]);
                    gs.Horario_de_fim = 0;
                    gs.Horario_de_fim += gs.Horario_de_inicio + gs.Duracao;
                    gs.Duracao_Minuto = Convert.ToInt32(Request.Form["DuracaoMinuto"]);
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
                    gs.Tipo_de_animacao = Request.Form["Tipo_de_animacao"];
                    gs.Tipo_de_audio = Request.Form["Tipo_de_audio"];
                    gs.Id_filme = Convert.ToInt32(Request.Form["Id_Filme"]);
                    gs.Id_sala = Convert.ToInt32(Request.Form["Id_Sala"]);

                    

                   %>
                
            <%

                SqlCommand com = new SqlCommand("Insert Into Gerenciamento_de_sessoes (Data, Horario_de_inicio," +
                        "Horario_de_fim, Valor_do_ingresso, Tipo_de_animacao, Tipo_de_audio, Id_Filme, Id_Sala," +
                        " Horario_de_fim_Minuto, Horario_de_fim_Segundo, Horario_de_inicio_Minuto, Horario_de_inicio_Segundo) " +
                        "Values('" + gs.Data.ToString("yyyy-MM-dd") + "', " + gs.Horario_de_inicio + ", " + gs.Horario_de_fim + ", " +
                        gs.Valor_do_ingresso + ", '" + gs.Tipo_de_animacao + "', '" + gs.Tipo_de_audio + "', " +
                        gs.Id_filme + ", " + gs.Id_sala + ", " + gs.Horario_de_fim_Minuto + ", " + gs.Horario_de_fim_Segundo + ", " + gs.Horario_de_inicio_Minuto + ", " +
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

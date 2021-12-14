<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateSessao.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.UpdateSessao" %>

<link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/modernizr-2.6.2.js"></script>
  
<form id="form1" action="#" runat="server" style="margin-left: 50px">
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

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();
                    gs.Id = Convert.ToInt32(Request.Form["Id"]);
                    gs.Data = DateTime.Parse(Request.Form["Data"]);
                    gs.Horario_de_inicio = Convert.ToInt32(Request.Form["Horario_de_inicio"]);
                    gs.Valor_do_ingresso = Convert.ToDouble(Request.Form["Valor_do_ingresso_reais"]);
                    gs.Valor_do_ingresso_centavos = Convert.ToDouble(Request.Form["Valor_do_ingresso_centavos"]);
                    gs.Tipo_de_audio = Request.Form["Tipo_de_audio"].ToString();
                    gs.Horario_de_inicio_Minuto = Convert.ToInt32(Request.Form["Horario_de_inicio_Minuto"]);
                    gs.Horario_de_Inicio_Segundo = Convert.ToInt32(Request.Form["Horario_de_Inicio_Segundo"]);
                    gs.Horario_de_fim = 0;
                    gs.Duracao = 0;
                    gs.Horario_de_fim += gs.Horario_de_inicio + gs.Duracao;

                    if(gs.Horario_de_fim > 23)
                    {
                        gs.Horario_de_fim = 0;
                    }
                    else
                    {
                        gs.Horario_de_fim = 0;
                    }
                    gs.Horario_de_fim_Minuto = 0;
                    gs.Horario_de_fim_Minuto += gs.Horario_de_inicio_Minuto + gs.Duracao_Minuto;
                    if(gs.Horario_de_fim_Minuto > 59)
                    {
                        gs.Horario_de_fim_Minuto = 0;
                        gs.Horario_de_fim += 1;
                        if(gs.Horario_de_fim > 23)
                        {
                            gs.Horario_de_fim = 0;
                        }
                    }
                    gs.Horario_de_fim_Segundo = 0;
                    gs.Horario_de_fim_Segundo += gs.Horario_de_Inicio_Segundo + gs.Duracao_Segundo;
                    if(gs.Horario_de_Inicio_Segundo > 59)
                    {
                        gs.Horario_de_fim_Segundo = 0;
                        gs.Horario_de_fim_Minuto += 1;
                        if(gs.Horario_de_fim_Minuto > 59)
                        {
                            gs.Horario_de_fim += 1;
                            if(gs.Horario_de_fim > 23)
                            {
                                gs.Horario_de_fim = 0;
                            }
                        }

                    }
                    gs.Id_filme = Convert.ToInt32(Request.Form["Id_Filme"]);
                    gs.Id_sala = Convert.ToInt32(Request.Form["Id_Sala"]);
                    SqlCommand com = new SqlCommand("UPDATE Gerenciamento_de_sessoes SET " +
                        "Data = '" + gs.Data.Year + "-" + gs.Data.Month + "-" + gs.Data.Day + "', Horario_de_inicio = " + gs.Horario_de_inicio + ", Valor_do_ingresso_reais = " + gs.Valor_do_ingresso + " " +
                        ", Horario_de_inicio_Minuto = " + gs.Horario_de_inicio_Minuto + ",  Horario_de_inicio_Segundo = " + gs.Horario_de_Inicio_Segundo + ", Valor_do_ingresso_centavos = " + gs.Valor_do_ingresso_centavos + ", " +
                        "Id_filme = " + gs.Id_filme + ", Id_sala = " + gs.Id_sala + " Where Id = " + gs.Id, con);
                    com.ExecuteReader();



                    /// Conversa com a base
                    %>
            
           <script>
                window.location.href = "../Home/EditarSucessoSessao";
            </script>       
                    
                    
        <% con.Close();
        /// Fecha a Conexao
    }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
           
           <script>
                window.location.href = "../Home/EditarErroSessao";
            </script>
            <%: e.Message %>         
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>

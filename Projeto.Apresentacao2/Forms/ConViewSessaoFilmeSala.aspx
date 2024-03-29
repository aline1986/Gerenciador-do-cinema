﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConViewSessaoFilmeSala.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.ResConViewSessaoFilmeSala" %>

<title>Gerenciador de cinema</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/modernizr-2.6.2.js"></script>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header"> 
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               </div>
            <br />
            <a href="../Home/Logado" class="navbar-brand" >Voltar</a>
            <table  align="right" >
            <tr >
                <td><font color="White" face="arial" size="3"><%: DateTime.Now.DayOfWeek %> - <%:DateTime.Now.Day%> / <%: DateTime.Now.Month%> / <%:DateTime.Now.Year%>  <%:DateTime.Now.Hour%> : <%:DateTime.Now.Minute %> Hrs</font></td>
            </tr>
        </table>

            <!Implementacao do relogio na Aplicacao>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav"></ul>
           
            </div>

        </div>

    </div>
<br /><br /><br /><br />
<strong><font face="arial" size="6">Alterar Sessões</font></strong>
<br /><br />
<hr /><script>
            function Alert()
            {
                alert('Prezado(a) Usuário(a), A Data desse Filme Já Passou de 3 Dias, ele Não pode ser alterado');
            }

          function AlertApagar()
          {
              alert('Prezado(a) Usuário(a), A Data desse Filme Já Passou do dia, ele já tem que ser Excluído');
          }
      </script>
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
                    string conection = "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    
                    SqlCommand com = new SqlCommand("SELECT * FROM VW_Sessao_Filme_Sala", con);
                       SqlDataReader dr = com.ExecuteReader();
                    /// Conversa com a base
                    %>
            
                    <table border style="margin-left: 150px" width="2500px" height="300px">
                        <th bgcolor="gray">
                            <td bgcolor="gray" width="150px"><strong><center>Título do filme</center></strong></td>
                            <td bgcolor="gray" width="300px"><strong><center>Descrição do filme</center></strong></td>
                            <td bgcolor="gray" width="1350px"><strong><center>Duração do filme</center></strong></td>
                            <td bgcolor="gray"><strong><center>Imagem do filme</center></strong></td>
                            <td bgcolor="gray" width="180px"><strong><center>Sala</center></strong></td>
                            <td bgcolor="gray" width="550px"><strong><center>Quantidade de assentos da sala</center></strong></td>
                            <td bgcolor="gray" width="150px"><strong><center>Dia do filme</center></strong></td>
                            <td bgcolor="gray" width="750px"><strong><center>Horário de início do filme</center></strong></td>
                            <td bgcolor="gray" width="150px"><strong><center>Horário final do filme</center></strong></td>
                            <td bgcolor="gray" width="150px"><strong><center>Tipo de animação</center></strong></td>
                            <td bgcolor="gray" width="150px"><strong><center>Tipo de áudio</center></strong></td>
                            <td bgcolor="gray" width="150px"><strong><center>Valor do ingresso</center></strong></td>
                            <td bgcolor="gray"><strong><center>Editar</center></strong></td>
                        </th>
                    <%while (dr.Read())
                        {

                            VW_Sessao_Filme_Sala vw_sfs = new VW_Sessao_Filme_Sala();

                            vw_sfs.Id_Sessao = Convert.ToInt32(dr["IdSessao"]);
                            vw_sfs.NomeFilme = dr["NomeFilme"].ToString();
                            vw_sfs.DescricaoFilme = dr["DescricaoFilme"].ToString();
                            vw_sfs.DuracaoFilme = Convert.ToInt32(dr["DuracaoFilme"]);
                            vw_sfs.ImagemFilme = dr["ImagemFilme"].ToString();
                            vw_sfs.NomeSala = dr["NomeSala"].ToString();
                            vw_sfs.QuantidadeDeAssentosSala = Convert.ToInt32(dr["QuantidadeDeAssentosSala"]);
                            vw_sfs.DiaFilme = Convert.ToDateTime(dr["DiaFilme"]);
                            vw_sfs.DuracaoFilme = Convert.ToInt32(dr["DuracaoFilme"]);
                            vw_sfs.HorarioInicioFilme = Convert.ToInt32(dr["HorarioInicioFilme"]);
                            vw_sfs.Horario_de_inicio_Minuto = Convert.ToInt32(dr["HorarioInicioMinutoSessao"]);
                            vw_sfs.Horario_de_inicio_Segundo = Convert.ToInt32(dr["HorarioInicioSegundoSessao"]);
                            vw_sfs.HorarioFimFilme = Convert.ToInt32(dr["HorarioInicioFilme"]) + Convert.ToInt32(dr["DuracaoFilme"]);
                            vw_sfs.Valor = Convert.ToInt32(dr["Valor"]);
                            vw_sfs.ValorIngressoCentavo = Convert.ToInt32(dr["ValorIngressoCentavo"]);
                            vw_sfs.TipoAnimacaoFilme = dr["TipoAnimacaoFilme"].ToString();
                            vw_sfs.TipoAudio = dr["TipoAudio"].ToString();
                            vw_sfs.DuracaoMinuto = Convert.ToInt32(dr["DuracaoMinutoFilme"]);
                            vw_sfs.HorarioFimFilmeMinuto = Convert.ToInt32(dr["HorarioInicioMinutoSessao"]) + Convert.ToInt32(dr["DuracaoMinutoFilme"]);
                            vw_sfs.DuracaoSegundo = Convert.ToInt32(dr["DuracaoSegundoFilme"]);
                            vw_sfs.HorarioFimFilmeSegundo = Convert.ToInt32(dr["HorarioInicioSegundoSessao"]) + Convert.ToInt32(dr["DuracaoSegundoFilme"]);
                            /// Codigo do(a) Usuario(a) Administrador(a)
                            %>
                            <tr>
                                <td></td>
                               <td width="250px"><center><%: vw_sfs.NomeFilme %></center></td>
                                <td width="560px" height="230px"><center><%: vw_sfs.DescricaoFilme %></center></td> 
                                <td width="1008px"><center><%: vw_sfs.DuracaoFilme %> Hora(s) <%: vw_sfs.DuracaoMinuto %> Minuto(s) e <%: vw_sfs.DuracaoSegundo %> Segundo(s)</center></td>
                                <td><center><img src=" <%: "../Imagem/" + vw_sfs.ImagemFilme %>" width="155px" /></center></td>
                                <td><center><%: vw_sfs.NomeSala%></center></td>
                                <td><center><%: vw_sfs.QuantidadeDeAssentosSala%> Assento(s)</center></td>
                                <td><center><%: vw_sfs.DiaFilme.ToString("dd/MM/yyyy")%></center></td>
                                <td width="1000px" ><center><%: vw_sfs.HorarioInicioFilme %> Hora(s) <%: vw_sfs.Horario_de_inicio_Minuto %> Minuto(s) e <%: vw_sfs.Horario_de_inicio_Segundo %> Segundo(s)</center></td>
                                <td width="1000px"><center><%: vw_sfs.HorarioFimFilme %> Hora(s) <%: vw_sfs.Horario_de_inicio_Minuto + vw_sfs.DuracaoMinuto %> e <%: vw_sfs.Horario_de_inicio_Segundo + vw_sfs.DuracaoSegundo %> Segundo(s)</center></td>
                                <td><center><%: vw_sfs.TipoAnimacaoFilme %></center></td>
                                <td><center><%: vw_sfs.TipoAudio %></center></td>
                                <td><center>R$ <%: vw_sfs.Valor %>,
                                    <% if (vw_sfs.ValorIngressoCentavo == 0)
                                        { %>00
                                    <%}
    else
    { %><%: vw_sfs.ValorIngressoCentavo %>
                                    <%} %>
                                    </center></td>
                                <td><center>
                                    <% if (DateTime.Now >= vw_sfs.DiaFilme.AddDays(-3))
                                        { %>
                                        <a href="#" onclick="Alert()" class="btn-primary btn-sm">Clique</a>

                                        <% } else if(DateTime.Now >= vw_sfs.DiaFilme.AddDays(0)) { %>
                                            <a href="#" onclick="AlertApagar()" class="btn-primary btn-sm">Clique</a>
                                        <% } else { %>
                                            <a href="ResConSessaoAlt.aspx?Id_Sessao=<%: vw_sfs.Id_Sessao%>" class="btn-primary btn-sm">Clique</a>
                                        
                                         <%   } %>
                                    </center>

                                </td>
                            </tr>
                        <% } %>
                    
                   
           </table>   
                    
        <% con.Close();
        /// Fecha a Conexao
    }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
            <strong><font color="red">Erro: <%: e.Message %></font></strong>
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>

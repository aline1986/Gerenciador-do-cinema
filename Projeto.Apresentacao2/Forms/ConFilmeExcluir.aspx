﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConFilmeExcluir.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.ConFilmeExcluir" %>

<title>Gerenciador de cinema</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script>
        function Excluir()
        {
            confirm('Deseja Excluir o Filme Selecionado?');
        }
    </script>
    <script src="../Scripts/modernizr-2.6.2.js"></script>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header"> 
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="../Home/Logado" class="navbar-brand">Voltar</a>
               </div>
            <br />
            
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
<strong><font face="arial" size="6">Exclusão de filmes</font></strong>
<br /><br />
<hr />
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

                    
                    SqlCommand com = new SqlCommand("SELECT * FROM Gerenciamento_de_filmes", con);
                       SqlDataReader dr = com.ExecuteReader();
                    /// Conversa com a base
                    %>
            
                    <table border style="margin-left: 150px" width="900px" height="300px">
                        <th bgcolor="gray">
                            <td bgcolor="gray"><strong><center>Título</center></strong></td>
                            <td bgcolor="gray"><strong><center>Descrição</center></strong></td>
                            <td bgcolor="gray"><strong><center>Duração</center></strong></td>
                            <td bgcolor="gray"><strong><center>Imagem do Filme</center></strong></td>
                            <td bgcolor="gray"><strong><center>Excluir</center></strong></td>
                        </th>
                    <%while (dr.Read())
                        {

                            Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();

                            gf.Id = Convert.ToInt32(dr["Id"]);
                            gf.Titulo = dr["Titulo"].ToString();
                            gf.Descricao = dr["Descricao"].ToString();
                            gf.Duracao = Convert.ToInt32(dr["Duracao"]);
                            gf.Imagem = dr["Imagem"].ToString();
                            gf.DuracaoMinuto = Convert.ToInt32(dr["DuracaoMinuto"]);
                            gf.DuracaoSegundo = Convert.ToInt32(dr["DuracaoSegundo"]);

                            /// Codigo do(a) Usuario(a) Administrador(a)
                            %>
                            <tr>
                                <td></td>
                               <td width="150px"><center><%: gf.Titulo %></center></td>
                                <td width="300px" height="300px"><center><%: gf.Descricao %></center></td>
                                <td width="400px"><center><%: gf.Duracao %> Hora(s) <%: gf.DuracaoMinuto %> Minuto(s) e <%: gf.DuracaoSegundo %> Segundos(s)</center></td> 
                                <td><center><img src=" <%: "../Imagem/" + gf.Imagem %>" width="155px" /></center></td>
                                <td><center><a href="DeleteFilme.aspx?Id=<%: gf.Id%>" onclick="Excluir()" class="btn-danger btn-sm"  ">Clique</a></center></td>
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

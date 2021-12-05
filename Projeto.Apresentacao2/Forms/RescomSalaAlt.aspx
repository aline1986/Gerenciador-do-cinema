<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RescomSalaAlt.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.RescomSalaAlt" %>

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
        <a href="../Home/Logado" class="navbar-brand">Voltar</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav"></ul>

        </div>

    </div>
</div>
<br /><br /><br /><br />
<h2 style="margin-left: 25px">Fazendo a Alteração dos dados da Sala</h2>
<hr />
<form id="form1" action="UpDateSala.aspx" runat="server" style="margin-left: 50px">
        <div>
                <%@Import Namespace="System.Data"  %>
                <%@Import Namespace="System.Data.SqlClient"  %>
                <%@Import Namespace="System.Configuration"  %>  
                <%@Import Namespace="Projeto.Entidades" %>
            
              
                        <% /// Assemblies Para Entidades e Conexao com a Base %>
            <%  
                try
                {
                
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    string Id = Request.QueryString["Id"];
                    SqlCommand com = new SqlCommand("SELECT * FROM Lista_de_salas Where Id = '" + Id + "'", con);
                    SqlDataReader dr = com.ExecuteReader();
                    /// Conversa com a base
                    %>
            
                    
                    <%if (dr.Read())
                    {

                        Lista_de_salas ls = new Lista_de_salas();

                        ls.Id = Convert.ToInt32(dr["Id"]);
                        ls.Nome = dr["Nome"].ToString();
                        ls.QuantidadeDeAssentos = Convert.ToInt32(dr["QuantidadeDeAssentos"]);
                      
                        
                        /// Codigo do(a) Usuario(a) Administrador(a)
                            %>
                                <input type="hidden" name="Id" value="<%: ls.Id %>" class="form-control" />
                                <div class="row" style="margin-left: 25px">
                                    <div class="col-md-4">
                                        <label><font face="arial" size="3">Nome:</font></label>
    
                                            <input type="text" name="Nome" value="<%: ls.Nome %>" class="form-control" />
                                            <br /><br />
                                        <label><font face="arial" size="3">Quantidade de assentos:</font></label>
                                            <input type="number" name="QuantidadeDeAssentos"  class="form-control" value="<%: ls.QuantidadeDeAssentos %>" />
                                            <br /><br />
                                       
                     
                                        <input type="submit" value="Editar sala" class="btn-primary btn-sm" />
                                             </div>
                                        </div>
                        <% } %>
                    
                   
             
                    
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


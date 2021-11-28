<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteSessao.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.DeleteSessao" %>

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
            <%  try
                {

                
                Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();

                try
                {
                    string conection = "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    string Id = Request.QueryString["Id_Sessao"];




                    SqlCommand com = new SqlCommand("SELECT * FROM Gerenciamento_de_sessoes Where Id = " + Id, con);
                    SqlDataReader dr = com.ExecuteReader();

                    if(dr.Read())
                    {
                        gs.Id_filme = Convert.ToInt32(dr["Id_Filme"]);
                        gs.Id_sala = Convert.ToInt32(dr["Id_sala"]);
                    }

                    /// Conversa com a base
                    %>
            
                    
                    
        <% con.Close();
        /// Fecha a Conexao
    }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
                    
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
            <%
           try
                {
                    string conection = "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    string Id = Request.QueryString["Id_Sessao"];




                    SqlCommand com = new SqlCommand("DELETE FROM Lista_de_salas Where Id = " + gs.Id_sala, con);
                    com.ExecuteReader();

                                        /// Conversa com a base
                    %>
            
                    
                    
        <% con.Close();
        /// Fecha a Conexao
    }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
                       
                    
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
                 <%
           try
                {
                    string conection = "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    string Id = Request.QueryString["Id_Sessao"];




                    SqlCommand com = new SqlCommand("DELETE FROM Gerenciamento_de_filmes Where Id = " + gs.Id_filme, con);
                    com.ExecuteReader();

                                        /// Conversa com a base
                    %>
            
                    
                    
        <% con.Close();
        /// Fecha a Conexao
    }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
                       
                    
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
            <script>
                window.location.href = "../Home/ExcluirSucessoSessao";
            </script>          
          <%
              }
                catch (Exception e)
                { %>

                    <script>
                window.location.href = "../Home/ExcluirErroSessao";
            </script>
                <% }
              %>

        </div>
    </form>


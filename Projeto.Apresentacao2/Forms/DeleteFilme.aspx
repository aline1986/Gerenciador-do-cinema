<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteFilme.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.DeleteFilme" %>

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
                    string conection = "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    string Id = Request.QueryString["Id"];


                    

                        SqlCommand com = new SqlCommand("DELETE FROM Gerenciamento_de_filmes  Where Id = " + Id, con);
                        com.ExecuteReader();

                    

                    /// Conversa com a base
                    %>
            
          <script>
                window.location.href = "../Home/ExcluirSucessoFilme";
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
                window.location.href = "../Home/ExcluirErroFilme";
            </script>          
                    
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>
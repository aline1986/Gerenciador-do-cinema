<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActionCadastroFilme.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.ActionCadastroFilme" %>

<form id="form1" runat="server">
        <div>
                <%@Import Namespace="System.Data"  %>
                <%@Import Namespace="System.Data.SqlClient"  %>
                <%@Import Namespace="System.Configuration"  %>  
                <%@Import Namespace="Projeto.Entidades" %>
              
                        <% /// Assemblies Para Entidades e Conexao com a Base %>
            <%  
                try
                {
                    string conection = "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                    gf.Titulo = Request.Form["Titulo"];
                    gf.Descricao = Request.Form["Descricao"];
                    gf.Duracao = Convert.ToInt32(Request.Form["Duracao"]);
                    gf.Imagem = Request.Form["Imagem"];

                    SqlCommand com = new SqlCommand("INSERT INTO Gerenciamento_de_filmes(Titulo, Descricao, Duracao, " +
                        "Imagem) VALUES ('" + gf.Titulo +"', '" + gf.Descricao + "', " + gf.Duracao + ", '" + gf.Imagem + "')", con);
                     com.ExecuteReader();
                    /// Conversa com a base
                    /// 
                    %>
                <script>
                window.location.href = "../Home/CadastroSucessoFilme";
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
                window.location.href = "../Home/CadastroErroFilme";
            </script> 

                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>
    